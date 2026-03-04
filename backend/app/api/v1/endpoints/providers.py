from fastapi import APIRouter

router = APIRouter()


@router.post("/profile")
def create_or_update_profile() -> dict[str, str]:
    return {"message": "Provider profile saved"}


@router.post("/documents")
def upload_document() -> dict[str, str]:
    return {"message": "Document uploaded securely"}


@router.get("/status")
def provider_status() -> dict[str, str]:
    return {"status": "PENDING"}
