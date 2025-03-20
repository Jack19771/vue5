<template>
    <div class="relative h-screen bg-surface-0 dark:bg-surface-950">
        <div class="bg-surface-900 h-screen border-r border-surface flex flex-col w-72 select-none absolute left-0 top-0">
            <div class="px-6 py-4">
                <svg class="fill-surface-0" width="109" height="32" viewBox="0 0 109 32" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M20.7207 6.18211L14.9944 3.11148L3.46855 9.28678L0.579749 7.73444L14.9944 0L23.6242 4.62977L20.7207 6.18211ZM14.9996 12.3574L26.5182 6.1821L29.4216 7.73443L14.9996 15.4621L6.37724 10.8391L9.27337 9.28677L14.9996 12.3574ZM2.89613 16.572L0 15.0196V24.2656L14.4147 32V28.8953L2.89613 22.7132V16.572ZM11.5185 18.09L0 11.9147V8.81001L14.4147 16.5376V25.7904L11.5185 24.2312V18.09ZM24.2086 15.0194V11.9147L15.5788 16.5377V31.9998L18.475 30.4474V18.09L24.2086 15.0194ZM27.0969 22.7129V10.3623L30.0004 8.81V24.2653L21.3706 28.895V25.7904L27.0969 22.7129Z"
                    />
                    <path
                        d="M55.3605 6.528C55.3605 5.67467 55.7872 5.248 56.6405 5.248H56.9925C57.8458 5.248 58.2725 5.67467 58.2725 6.528V27.008C58.2725 27.8613 57.8458 28.288 56.9925 28.288H56.6405C55.7872 28.288 55.3605 27.8613 55.3605 27.008V18.656C55.3605 17.8027 54.9338 17.376 54.0805 17.376H49.7925C48.9392 17.376 48.5125 17.8027 48.5125 18.656V27.008C48.5125 27.8613 48.0858 28.288 47.2325 28.288H46.8805C46.0272 28.288 45.6005 27.8613 45.6005 27.008V6.528C45.6005 5.67467 46.0272 5.248 46.8805 5.248H47.2325C48.0858 5.248 48.5125 5.67467 48.5125 6.528V13.184C48.5125 14.0373 48.9392 14.464 49.7925 14.464H54.0805C54.9338 14.464 55.3605 14.0373 55.3605 13.184V6.528ZM67.3955 20.256C68.2488 20.256 68.6755 19.8293 68.6755 18.976V13.76C68.6755 12.9067 69.1022 12.48 69.9555 12.48H70.3075C71.1608 12.48 71.5875 12.9067 71.5875 13.76V27.904C71.5875 28.5227 71.3742 29.0453 70.9475 29.472L69.8915 30.528C69.4648 30.9547 68.9422 31.168 68.3235 31.168H62.7235C61.8702 31.168 61.4435 30.7413 61.4435 29.888V29.536C61.4435 28.6827 61.8702 28.256 62.7235 28.256H67.3955C68.2488 28.256 68.6755 27.8293 68.6755 26.976V24.448C68.6755 23.5947 68.2488 23.168 67.3955 23.168H64.4195C63.8008 23.168 63.2782 22.9547 62.8515 22.528L61.7955 21.472C61.3688 21.0453 61.1555 20.5227 61.1555 19.904V13.76C61.1555 12.9067 61.5822 12.48 62.4355 12.48H62.7875C63.6408 12.48 64.0675 12.9067 64.0675 13.76V18.976C64.0675 19.8293 64.4942 20.256 65.3475 20.256H67.3955ZM76.388 31.264C75.5347 31.264 75.108 30.8373 75.108 29.984V13.76C75.108 12.9067 75.5347 12.48 76.388 12.48H82.276C82.8947 12.48 83.4173 12.6933 83.844 13.12L84.868 14.144C85.2947 14.5707 85.508 15.0933 85.508 15.712V21.696C85.508 22.3147 85.2947 22.848 84.868 23.296L83.844 24.32C83.4173 24.7467 82.8947 24.96 82.276 24.96H79.3C78.4467 24.96 78.02 25.3867 78.02 26.24V29.984C78.02 30.8373 77.5933 31.264 76.74 31.264H76.388ZM79.3 15.36C78.4467 15.36 78.02 15.7867 78.02 16.64V20.768C78.02 21.6213 78.4467 22.048 79.3 22.048H81.348C82.2013 22.048 82.628 21.6213 82.628 20.768V16.64C82.628 15.7867 82.2013 15.36 81.348 15.36H79.3ZM99.0942 21.056C99.0942 21.9093 98.6676 22.336 97.8142 22.336H92.8862C92.0329 22.336 91.6062 22.7627 91.6062 23.616V24.064C91.6062 24.9173 92.0329 25.344 92.8862 25.344H97.8142C98.6676 25.344 99.0942 25.7707 99.0942 26.624V26.976C99.0942 27.8293 98.6676 28.256 97.8142 28.256H91.9262C91.3076 28.256 90.7849 28.032 90.3582 27.584L89.3342 26.56C88.9076 26.1333 88.6942 25.6107 88.6942 24.992V15.712C88.6942 15.0933 88.9076 14.5707 89.3342 14.144L90.3582 13.12C90.7849 12.6933 91.3076 12.48 91.9262 12.48H95.8622C96.4809 12.48 97.0036 12.6933 97.4302 13.12L98.4542 14.144C98.8809 14.5707 99.0942 15.0933 99.0942 15.712V21.056ZM91.6062 18.496C91.6062 19.3493 92.0329 19.776 92.8862 19.776H94.9022C95.7556 19.776 96.1822 19.3493 96.1822 18.496V16.64C96.1822 15.7867 95.7556 15.36 94.9022 15.36H92.8862C92.0329 15.36 91.6062 15.7867 91.6062 16.64V18.496ZM105.52 26.976C105.52 27.8293 105.093 28.256 104.24 28.256H103.888C103.035 28.256 102.608 27.8293 102.608 26.976V15.744C102.608 15.1253 102.821 14.6027 103.248 14.176L104.304 13.12C104.731 12.6933 105.253 12.48 105.872 12.48H106.448C107.301 12.48 107.728 12.9067 107.728 13.76V14.112C107.728 14.9653 107.365 15.392 106.64 15.392C106.277 15.392 106 15.5093 105.808 15.744C105.616 15.9573 105.52 16.2667 105.52 16.672V26.976Z"
                    />
                </svg>
            </div>
            <div class="overflow-y-auto">
                <ul class="list-none p-2 m-0">
                    <li>
                        <div class="p-4 text-surface-600 font-medium">HOME</div>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-home !text-xl !leading-none mr-2" />
                            <span class="font-medium">Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-comments !text-xl !leading-none mr-2" />
                            <span class="font-medium">Messages</span>
                            <span class="inline-flex items-center justify-center ml-auto bg-primary-100 text-primary-900 rounded-full min-w-6 h-6">3</span>
                        </a>
                    </li>
                    <li>
                        <a
                            v-styleclass="{
                                selector: '@next',
                                enterFromClass: 'hidden',
                                enterActiveClass: 'animate-slidedown',
                                leaveToClass: 'hidden',
                                leaveActiveClass: 'animate-slideup'
                            }"
                            class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150"
                        >
                            <i class="pi pi-calendar !text-xl !leading-none mr-2" />
                            <span class="font-medium">Calendar</span>
                            <i class="pi pi-chevron-down !text-xl !leading-none ml-auto" />
                        </a>
                        <ul class="list-none py-0 pl-4 pr-0 m-0 hidden overflow-y-hidden transition-all duration-[400ms] ease-in-out">
                            <li>
                                <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                                    <i class="pi pi-calendar !text-xl !leading-none mr-2" />
                                    <span class="font-medium">Work</span>
                                </a>
                            </li>
                            <li>
                                <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                                    <i class="pi pi-calendar !text-xl !leading-none mr-2" />
                                    <span class="font-medium">Personal</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="list-none p-2 m-0 border-t border-surface-800">
                    <li>
                        <div class="p-4 text-surface-600 font-medium">ORGANIZATION</div>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-home !text-xl !leading-none mr-2" />
                            <span class="font-medium">Overview</span>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-lock !text-xl !leading-none mr-2" />
                            <span class="font-medium">Security</span>
                            <span class="inline-flex items-center justify-center ml-auto bg-primary-100 text-primary-900 rounded-full min-w-6 h-6">3</span>
                        </a>
                    </li>
                    <li>
                        <a
                            v-styleclass="{
                                selector: '@next',
                                enterFromClass: 'hidden',
                                enterActiveClass: 'animate-slidedown',
                                leaveToClass: 'hidden',
                                leaveActiveClass: 'animate-slideup'
                            }"
                            class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150"
                        >
                            <i class="pi pi-file !text-xl !leading-none mr-2" />
                            <span class="font-medium">Reports</span>
                            <i class="pi pi-chevron-down !text-xl !leading-none ml-auto" />
                        </a>
                        <ul class="list-none py-0 pl-4 pr-0 m-0 hidden overflow-y-hidden transition-all duration-[400ms] ease-in-out">
                            <li>
                                <a
                                    v-styleclass="{
                                        selector: '@next',
                                        enterFromClass: 'hidden',
                                        enterActiveClass: 'animate-slidedown',
                                        leaveToClass: 'hidden',
                                        leaveActiveClass: 'animate-slideup'
                                    }"
                                    class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150"
                                >
                                    <i class="pi pi-chart-line !text-xl !leading-none mr-2" />
                                    <span class="font-medium">Analytics</span>
                                    <i class="pi pi-chevron-down !text-xl !leading-none ml-auto" />
                                </a>
                                <ul class="list-none py-0 pl-4 pr-0 m-0 hidden overflow-y-hidden transition-all duration-[400ms] ease-in-out">
                                    <li>
                                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                                            <i class="pi pi-refresh !text-xl !leading-none mr-2" />
                                            <span class="font-medium">Traffic</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                                            <i class="pi pi-dollar !text-xl !leading-none mr-2" />
                                            <span class="font-medium">Conversions</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                                    <i class="pi pi-chart-bar !text-xl !leading-none mr-2" />
                                    <span class="font-medium">Sales</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul class="list-none p-2 m-0 border-t border-surface-800">
                    <li>
                        <div class="p-4 text-surface-600 font-medium">CUSTOMERS</div>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-home !text-xl !leading-none mr-2" />
                            <span class="font-medium">Overview</span>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-users !text-xl !leading-none mr-2" />
                            <span class="font-medium">Users</span>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-inbox !text-xl !leading-none mr-2" />
                            <span class="font-medium">Inbox</span>
                            <span class="inline-flex items-center justify-center ml-auto bg-primary-100 text-primary-900 rounded-full min-w-6 h-6">8</span>
                        </a>
                    </li>
                    <li>
                        <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                            <i class="pi pi-search !text-xl !leading-none mr-2" />
                            <span class="font-medium">Search</span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="p-2 mt-auto border-t border-surface-800">
                <a class="flex items-center cursor-pointer p-4 text-surface-300 hover:bg-surface-800 rounded-border transition-colors duration-150">
                    <img src="https://fqjltiegiezfetthbags.supabase.co/storage/v1/render/image/public/block.images/blocks/avatars/circle/avatar-f-1.png" class="mr-2 w-8 h-7" />
                    <span class="font-medium">Amy Elsner</span>
                </a>
            </div>
        </div>
    </div>
</template>
<script setup></script>
