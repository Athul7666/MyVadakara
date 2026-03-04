from fastapi import APIRouter

from app.api.v1.endpoints import admin, auth, complaints, providers, service_requests, users

api_router = APIRouter()
api_router.include_router(auth.router, prefix="/auth", tags=["auth"])
api_router.include_router(users.router, prefix="/users", tags=["users"])
api_router.include_router(providers.router, prefix="/providers", tags=["providers"])
api_router.include_router(service_requests.router, prefix="/service-requests", tags=["service_requests"])
api_router.include_router(complaints.router, prefix="/complaints", tags=["complaints"])
api_router.include_router(admin.router, prefix="/admin", tags=["admin"])
