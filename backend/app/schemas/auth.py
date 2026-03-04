from pydantic import BaseModel


class OTPRequest(BaseModel):
    phone: str
    role: str


class OTPVerify(BaseModel):
    phone: str
    otp: str


class TokenResponse(BaseModel):
    access_token: str
    refresh_token: str
    token_type: str = "bearer"
