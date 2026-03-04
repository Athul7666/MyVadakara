from fastapi import APIRouter

router = APIRouter()


@router.get("/analytics")
def analytics() -> dict[str, int]:
    return {"users": 0, "providers": 0, "open_requests": 0}


@router.patch("/providers/{provider_id}/approve")
def approve_provider(provider_id: int) -> dict[str, str | int]:
    return {"message": "approved", "provider_id": provider_id}


@router.patch("/users/{user_id}/suspend")
def suspend_user(user_id: int) -> dict[str, str | int]:
    return {"message": "suspended", "user_id": user_id}
