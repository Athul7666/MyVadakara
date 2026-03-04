# Vadakara Connect

Production-ready hyperlocal service marketplace for Vadakara, Kerala, with a premium UX for Clients and Service Providers plus an Admin web dashboard.

## Monorepo Structure

- `mobile_app/` — Flutter (Android + iOS, single codebase, Riverpod, Clean Architecture)
- `backend/` — FastAPI + PostgreSQL + JWT + OTP auth + RBAC + rate limiting
- `admin_dashboard/` — React + TypeScript admin dashboard shell
- `infra/` — Docker compose and deployment templates

## Core Product Capabilities

### Roles
- `CLIENT`
- `SERVICE_PROVIDER`
- `ADMIN`

### Client
- OTP login
- onboarding
- premium home with service cards (Auto Rickshaw, Cab, Light Vehicle, Heavy Vehicle, Household Services)
- create service requests
- live provider availability indicators
- ratings, complaints, account deletion

### Service Provider
- separate login entry
- service category selection
- KYC/document upload
- profile completion progress
- approval status badge (`Pending`, `Approved`, `Suspended`)
- accept/reject requests
- earnings placeholder

### Admin (Web)
- user analytics
- provider approval workflow
- complaint triage and resolution
- suspend/ban users
- audit logs

## Security and Compliance
- JWT access + refresh flows
- OTP verification with attempt limits
- role-based access control
- encrypted sensitive data fields
- private document storage (S3/GCS compatible)
- API rate limiting middleware
- account deletion workflow and audit traces
- GDPR-friendly structure and privacy policy endpoint

## Getting Started

### Backend
```bash
cd backend
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

### Mobile App
```bash
cd mobile_app
flutter pub get
flutter run
```

### Admin Dashboard
```bash
cd admin_dashboard
npm install
npm run dev
```

### Full stack with Docker
```bash
docker compose -f infra/docker-compose.yml up --build
```
