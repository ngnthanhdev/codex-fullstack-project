# Backend Architecture Proposal

## Target Structure

```text
apps/api/src
  common/
    errors/               exception filters, error codes
    interceptors/         response envelope, request logging
    middleware/           request id, sanitization helpers
    types/                request/user/api response types
  config/                 env validation and config helpers
  auth/
    dto/                  request validation DTOs
    auth.controller.ts    HTTP orchestration only
    auth.service.ts       business logic
    auth.repository.ts    database access
    jwt.strategy.ts       authentication
  users/
    users.controller.ts
    users.service.ts
    users.repository.ts
  prisma/
    prisma.service.ts
```

## Baseline To Implement

- Global error envelope through `GlobalExceptionFilter`.
- Global success envelope through `ApiResponseInterceptor`.
- Request ID middleware and structured HTTP latency logging.
- Helmet, CORS allowlist, JSON body limit, global validation pipe, and rate limiting.
- Startup environment validation for required production settings.
- Repository layer for modules that touch the database.
- Refresh token rotation with hashed tokens and revocation.
- User/account repository boundaries.

## Backend Compatibility Guidance

JSON responses should use the standard production envelope. The mobile API client should unwrap this envelope, so UI code can consume domain payloads. External clients should read payloads from `response.data`.

## Next Phases

1. Add OpenAPI decorators and generated contract docs.
2. Add database migrations and a migration safety checklist.
3. Add health check endpoint with database connectivity.
4. Add service unit tests and Supertest integration tests for auth.
5. Add resource-level authorization policies for domain resources as those modules are implemented.
