from fastapi import APIRouter

router = APIRouter()


@router.get("/me")
def me() -> dict[str, str]:
    return {"id": "placeholder", "role": "CLIENT"}


@router.delete("/me")
def delete_account() -> dict[str, str]:
    return {"message": "Account scheduled for deletion"}
