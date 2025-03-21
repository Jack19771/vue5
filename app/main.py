# app.py
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List
from fastapi.responses import JSONResponse
import json
import os

app = FastAPI()

# CORS config
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

DOCUMENTS_FILE = "documents.json"

class Document(BaseModel):
    id: int
    name: str
    type: str
    icon: str
    area: str
    subArea: str
    cid: str

@app.get("/api/documents", response_model=List[Document])
def get_documents():
    if not os.path.exists(DOCUMENTS_FILE):
        return []
    with open(DOCUMENTS_FILE, "r") as f:
        return json.load(f)

@app.post("/api/documents")
def add_document(doc: Document):
    documents = []
    if os.path.exists(DOCUMENTS_FILE):
        with open(DOCUMENTS_FILE, "r") as f:
            documents = json.load(f)
    documents.append(doc.dict())
    with open(DOCUMENTS_FILE, "w") as f:
        json.dump(documents, f, indent=2)
    return JSONResponse(content={"status": "success", "message": "Document saved"})
