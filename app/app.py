# --- FastAPI backend (app.py) ---
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
import json
import os

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

DOCUMENTS_FILE = "documents.json"

# MODELE
class DocumentIn(BaseModel):
    name: str
    type: str
    icon: str
    area: str
    subArea: str
    cid: str

class Document(DocumentIn):
    id: int

class DeleteRequest(BaseModel):
    ids: List[int]

# ENDPOINTY
@app.get("/api/documents", response_model=List[Document])
def get_documents():
    if not os.path.exists(DOCUMENTS_FILE):
        return []
    with open(DOCUMENTS_FILE, "r") as f:
        return json.load(f)

@app.post("/api/documents")
def add_document(doc: DocumentIn):
    documents = []
    if os.path.exists(DOCUMENTS_FILE):
        with open(DOCUMENTS_FILE, "r") as f:
            documents = json.load(f)

    new_id = max((d["id"] for d in documents), default=0) + 1
    doc_with_id = doc.dict()
    doc_with_id["id"] = new_id

    documents.append(doc_with_id)

    with open(DOCUMENTS_FILE, "w") as f:
        json.dump(documents, f, indent=2)

    return {"status": "success", "message": "Document saved", "id": new_id}

@app.post("/api/documents/delete")
def delete_documents(request: DeleteRequest):
    if not os.path.exists(DOCUMENTS_FILE):
        raise HTTPException(status_code=404, detail="Document storage not found")

    with open(DOCUMENTS_FILE, "r") as f:
        documents = json.load(f)

    filtered = [doc for doc in documents if doc["id"] not in request.ids]

    with open(DOCUMENTS_FILE, "w") as f:
        json.dump(filtered, f, indent=2)

    return {"status": "success", "deleted_ids": request.ids}
