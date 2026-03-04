# Vadakara Connect — Architecture Blueprint

## 1) Flutter Project Structure (Clean Architecture + Riverpod)

```text
mobile_app/lib/
  app.dart
  main.dart
  core/
    constants/app_tokens.dart
    theme/app_theme.dart
    widgets/premium_components.dart
  features/
    auth/
    provider/
    requests/
    admin/
    presentation/home/premium_home_screen.dart
  shared/
```

### Design System
- **Palette**: Brand Blue `#1A73E8`, Accent Teal `#00C2A8`, neutral backgrounds, dark mode parity.
- **Typography**: Inter with bold headlines and clean body scale.
- **Spacing**: 8px grid (`4, 8, 12, 16, 24, 32, 40, 56`).
- **Reusable components**: premium button, status badge, card shells, input and bottom-nav extension points.
- **Motion**: 200–300ms fade + rise animations via `flutter_animate`, with ripple-enabled touch surfaces.

## 2) Backend Project Structure (FastAPI)

```text
backend/app/
  main.py
  core/config.py
  db/base.py
  db/session.py
  middleware/rate_limit.py
  models/
    enums.py
    tables.py
  schemas/auth.py
  services/auth.py
  api/v1/
    router.py
    endpoints/
      auth.py
      users.py
      providers.py
      service_requests.py
      complaints.py
      admin.py
```

## 3) API Endpoints

### Auth
- `POST /api/v1/auth/otp/request`
- `POST /api/v1/auth/otp/verify`

### Users
- `GET /api/v1/users/me`
- `DELETE /api/v1/users/me`

### Providers
- `POST /api/v1/providers/profile`
- `POST /api/v1/providers/documents`
- `GET /api/v1/providers/status`

### Service Requests
- `POST /api/v1/service-requests`
- `PATCH /api/v1/service-requests/{request_id}/accept`
- `PATCH /api/v1/service-requests/{request_id}/reject`

### Complaints
- `POST /api/v1/complaints`

### Admin
- `GET /api/v1/admin/analytics`
- `PATCH /api/v1/admin/providers/{provider_id}/approve`
- `PATCH /api/v1/admin/users/{user_id}/suspend`

## 4) Relational Schema

### USERS
- `id` PK
- `phone` unique index
- `full_name`
- `role` indexed enum (`CLIENT`, `SERVICE_PROVIDER`, `ADMIN`)
- `is_active`
- `created_at`

### PROVIDER_DETAILS
- `id` PK
- `user_id` FK -> USERS.id (1:1, cascade delete)
- `category` indexed
- `status` indexed enum (`PENDING`, `APPROVED`, `SUSPENDED`)
- `document_url`
- `profile_completion_pct`

### SERVICE_REQUESTS
- `id` PK
- `client_id` FK -> USERS.id
- `provider_id` FK -> USERS.id nullable
- `category` indexed
- `status` indexed
- `notes`
- `created_at` indexed
- composite index `(client_id, status)`

### COMPLAINTS
- `id` PK
- `reporter_id` FK -> USERS.id
- `target_user_id` FK -> USERS.id
- `reason`
- `status` indexed
- `created_at`
- composite index `(target_user_id, status)`

### BLOCKED_PHONES
- `id` PK
- `phone` unique
- `reason`
- `blocked_at`

## 5) Admin Dashboard (Web)

```text
admin_dashboard/src/
  main.tsx
  pages/AdminApp.tsx
  components/
  theme/
```

- KPI cards for users, pending providers, complaints, and audit events.
- Extendable to charts, queues, and moderation workflows.

## 6) Cloud & Deployment Readiness

- Dockerized FastAPI service.
- PostgreSQL service in compose for local/dev.
- Replace local document URLs with S3/GCS signed URL flow.
- Add managed DB, WAF, and secret manager for production.
- `.env.example` supports twelve-factor configuration.
