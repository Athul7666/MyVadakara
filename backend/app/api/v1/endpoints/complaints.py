from fastapi import APIRouter

router = APIRouter()


@router.post("")
def file_complaint() -> dict[str, str]:
    return {"message": "Complaint submitted"}
