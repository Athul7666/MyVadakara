from fastapi import APIRouter

router = APIRouter()


@router.post("")
def create_request() -> dict[str, str]:
    return {"message": "Service request created"}


@router.patch("/{request_id}/accept")
def accept_request(request_id: int) -> dict[str, str | int]:
    return {"message": "accepted", "request_id": request_id}


@router.patch("/{request_id}/reject")
def reject_request(request_id: int) -> dict[str, str | int]:
    return {"message": "rejected", "request_id": request_id}
