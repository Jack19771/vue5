<template>
  <div>
    <!-- Ribbon -->
    <div v-if="selectedDocuments.length > 0" class="p-d-flex p-jc-between p-mb-3 p-ribbon">
      <Button label="View" icon="pi pi-search" @click="viewDocument" />
      <Button label="Send To" icon="pi pi-send" @click="confirmDelete" />
      <Button label="Delete" icon="pi pi-trash" @click="confirmDelete" />
      <Button label="Edit" icon="pi pi-pencil" @click="editDocument" />
    </div>

    <!-- Panel -->
    <Panel header="Document Library" class="p-mb-1">
      <div class="p-d-flex p-jc-between p-mb-3">
        <Button label="Add Document" icon="pi pi-plus" @click="addDocument" />
        <InputText v-model="searchQuery" placeholder="Search documents..." />
      </div>

      <!-- Tabela -->
      <div class="datatable-container">
        <DataTable
          v-model:selection="selectedDocuments"
          :value="filteredDocuments"
          selectionMode="checkbox"
          dataKey="id"
          paginator
          :rows="rowsPerPage"
          :totalRecords="totalRecords"
          :rowsPerPageOptions="[5, 10, 25]"
          @page="onPageChange"
        >
          <Column selectionMode="multiple" />
          <Column field="name" header="Name" sortable />
          <Column field="type" header="Type" sortable />
          <Column field="area" header="Area" sortable />
          <Column field="subArea" header="Sub-Area" sortable />
          <Column header="Icon" :body="fileIconTemplate" />
          <Column header="CID">
            <template #body="slotProps">
              <div v-if="slotProps.data.cid">
                <span class="truncate block max-w-[12rem]">{{ slotProps.data.cid }}</span>
                <Button
                  icon="pi pi-copy"
                  text
                  rounded
                  v-tooltip="'Kopiuj CID'"
                  @click="copyCID(slotProps.data.cid)"
                  class="ml-2"
                />
              </div>
              <span v-else>-</span>
            </template>
          </Column>
        </DataTable>
      </div>
    </Panel>

    <!-- Dialog -->
    <Dialog header="Add Document" v-model:visible="dialogVisible" :style="{ width: '450px' }">
      <div>
        <InputText v-model="newDocument.name" placeholder="Document Name" class="p-fluid" />
      </div>
      <div class="p-mt-3">
        <Dropdown v-model="newDocument.type" :options="documentTypes" optionLabel="label" optionValue="value" placeholder="Select Type" />
      </div>
      <div class="p-mt-3">
        <InputText v-model="newDocument.icon" placeholder="Icon (e.g. pi pi-file-pdf)" class="p-fluid" />
      </div>
      <div class="p-mt-3">
        <InputText v-model="newDocument.area" placeholder="Area" class="p-fluid" />
      </div>
      <div class="p-mt-3">
        <InputText v-model="newDocument.subArea" placeholder="Sub-Area" class="p-fluid" />
      </div>
      <div class="p-mt-3">
        <input type="file" @change="onFileChange" />
      </div>
      <div class="p-mt-3" v-if="uploading">
        <ProgressBar mode="indeterminate" style="height: 6px" />
        <div class="flex justify-center mt-3">
          <ProgressSpinner style="width: 30px; height: 30px" strokeWidth="4" />
        </div>
      </div>
      <div class="p-mt-3" v-if="uploadResult">
        <span><strong>CID:</strong> <a :href="`/ipfs/${uploadResult}`" target="_blank">{{ uploadResult }}</a></span>
      </div>

      <div class="p-d-flex p-jc-end p-mt-4">
        <Button label="Cancel" icon="pi pi-times" @click="closeDialog" class="p-button-text p-mr-2" />
        <Button label="Save" icon="pi pi-check" @click="saveDocument" class="p-button-text" />
      </div>
    </Dialog>

    <!-- Confirm Delete Dialog -->
    <Dialog v-model:visible="confirmDeleteVisible" header="Potwierdzenie" :modal="true" :closable="false" :style="{ width: '450px' }">
      <p>Na pewno chcesz usunąć zaznaczone dokumenty z listy? Pliki nie zostaną usunięte z IPFS i nadal będą dostępne po CID.</p>
      <template #footer>
        <Button label="Anuluj" icon="pi pi-times" text @click="confirmDeleteVisible = false" />
        <Button label="Usuń" icon="pi pi-check" severity="danger" @click="deleteDocuments" />
      </template>
    </Dialog>

    <!-- Toast -->
    <Toast group="ipfs" class="!w-[30rem]">
      <template #message="{ message }">
        <div class="flex items-start flex-1 gap-2">
          <span class="p-2">
            <i class="pi pi-check-circle text-green-500 text-2xl" />
          </span>
          <div class="p-2">
            <span class="text-xl font-medium text-surface-900 dark:text-surface-0">{{ message.summary }}</span>
            <p class="text-surface-700 dark:text-surface-100 mt-2">{{ message.detail }}</p>
          </div>
        </div>
      </template>
    </Toast>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useToast } from 'primevue/usetoast';

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import Button from 'primevue/button';
import InputText from 'primevue/inputtext';
import Dropdown from 'primevue/dropdown';
import Panel from 'primevue/panel';
import Dialog from 'primevue/dialog';
import Toast from 'primevue/toast';
import ProgressSpinner from 'primevue/progressspinner';
import ProgressBar from 'primevue/progressbar';

const toast = useToast();

const documents = ref([]);
const selectedDocuments = ref([]);
const dialogVisible = ref(false);
const confirmDeleteVisible = ref(false);
const searchQuery = ref('');
const fileToUpload = ref(null);
const uploadResult = ref('');
const uploading = ref(false);

const newDocument = ref({ name: '', type: '', icon: '', area: '', subArea: '', cid: '' });

const documentTypes = ref([
  { label: 'PDF', value: 'PDF' },
  { label: 'PowerPoint', value: 'PowerPoint' },
  { label: 'Word', value: 'Word' }
]);

const rowsPerPage = ref(10);
const totalRecords = computed(() => documents.value.length);

const filteredDocuments = computed(() => {
  return documents.value.filter(doc =>
    doc.name.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
    doc.type.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
    doc.area.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
    doc.subArea.toLowerCase().includes(searchQuery.value.toLowerCase())
  );
});

const fileIconTemplate = (rowData) => {
  return `<i class="${rowData.icon}"></i>`;
};

const loadDocuments = async () => {
  try {
    const res = await fetch('http://localhost:8000/api/documents');
    if (!res.ok) throw new Error("Błąd ładowania danych");
    const data = await res.json();
    documents.value = data;
  } catch (err) {
    console.error('Błąd ładowania dokumentów:', err);
    documents.value = [];
  }
};

const addDocument = () => {
  uploadResult.value = '';
  fileToUpload.value = null;
  uploading.value = false;
  newDocument.value = { name: '', type: '', icon: '', area: '', subArea: '', cid: '' };
  dialogVisible.value = true;
};

const closeDialog = () => {
  dialogVisible.value = false;
};

const saveDocument = async () => {
  const payload = {
    name: newDocument.value.name,
    type: newDocument.value.type,
    icon: newDocument.value.icon,
    area: newDocument.value.area,
    subArea: newDocument.value.subArea,
    cid: uploadResult.value
  };

  try {
    const response = await fetch("http://localhost:8000/api/documents", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(payload)
    });

    const data = await response.json();

    if (response.ok) {
      showToast("Dokument zapisany", `ID: ${data.id}`);
      await loadDocuments();
      dialogVisible.value = false;
    } else {
      showToast("Błąd zapisu", data.detail || "Nieznany błąd");
    }
  } catch (err) {
    showToast("Błąd", err.message);
  }
};

const confirmDelete = () => {
  if (selectedDocuments.value.length > 0) {
    confirmDeleteVisible.value = true;
  }
};

const deleteDocuments = async () => {
  try {
    const ids = selectedDocuments.value.map(doc => doc.id);
    await fetch("http://localhost:8000/api/documents/delete", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ ids })
    });
    showToast("Usunięto dokumenty", `ID: ${ids.join(', ')}`);
    await loadDocuments();
  } catch (err) {
    showToast("Błąd usuwania", err.message);
  } finally {
    confirmDeleteVisible.value = false;
    selectedDocuments.value = [];
  }
};

const viewDocument = () => {
  if (selectedDocuments.value.length > 0) {
    toast.add({
      group: 'ipfs',
      summary: 'Viewing Document',
      detail: selectedDocuments.value.map(doc => doc.name).join(', '),
      life: 3000
    });
  }
};

const editDocument = () => {
  if (selectedDocuments.value.length > 0) {
    toast.add({
      group: 'ipfs',
      summary: 'Editing Document',
      detail: selectedDocuments.value.map(doc => doc.name).join(', '),
      life: 3000
    });
  }
};

const onPageChange = (event) => {
  rowsPerPage.value = event.rows;
};

const onFileChange = async (event) => {
  const file = event.target.files[0];
  if (file) {
    uploading.value = true;
    try {
      const cid = await uploadToIPFS(file);
      uploadResult.value = cid;
      newDocument.value.cid = cid;
      showToast('Plik przesłany', `CID: ${cid}`);
    } catch (error) {
      showToast('Błąd', error.message);
    } finally {
      uploading.value = false;
    }
  }
};

const copyCID = async (cid) => {
  try {
    await navigator.clipboard.writeText(cid);
    showToast('Skopiowano CID', cid);
  } catch (err) {
    showToast('Błąd kopiowania', err.message);
  }
};

const showToast = (summary, detail) => {
  toast.add({
    group: 'ipfs',
    summary,
    detail,
    life: 3000
  });
};

const uploadToIPFS = async (file) => {
  const formData = new FormData();
  formData.append('file', file);
  const response = await fetch('http://localhost:5001/api/v0/add', {
    method: 'POST',
    body: formData,
  });
  const text = await response.text();
  const match = text.match(/"Hash":"([^"]+)"/);
  if (!match) throw new Error('Nie udało się odczytać CID.');
  return match[1];
};

onMounted(() => {
  loadDocuments();
});
</script>

<style scoped>
.p-datatable .p-datatable-thead > tr > th {
  text-align: center;
}

.datatable-container {
  margin-top: 20px;
}

.p-d-flex {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.p-mt-3 {
  margin-top: 1rem;
}

.p-ribbon {
  background-color: #f5f5f5;
  padding: 10px;
  border-radius: 8px;
  margin-bottom: 20px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}
</style>
