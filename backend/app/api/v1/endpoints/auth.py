from fastapi import APIRouter

from app.schemas.auth import OTPRequest, OTPVerify, TokenResponse
from app.services.auth import create_access_token

router = APIRouter()


@router.post("/otp/request")
def request_otp(payload: OTPRequest) -> dict[str, str]:
    return {"message": f"OTP sent to {payload.phone}"}


@router.post("/otp/verify", response_model=TokenResponse)
def verify_otp(payload: OTPVerify) -> TokenResponse:
    token = create_access_token(payload.phone)
    return TokenResponse(access_token=token, refresh_token=token)
