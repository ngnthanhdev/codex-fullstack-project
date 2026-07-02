---
name: nestjs-production-api-skill
description: Use when building, reviewing, or hardening NestJS APIs with standard response envelopes, global exception filters, validation pipes, CORS allowlists, Helmet, env validation, controller/service/repository layering, Prisma persistence, Swagger/OpenAPI, auth, authorization, rate limiting, logging, health checks, and production observability.
---

# NestJS Production API Skill

Use this skill before adding backend modules consumed by mobile/web clients. The goal is predictable contracts, safe persistence, explicit authorization, and production-ready failure behavior.

## When To Apply

Use for:

- New NestJS modules/controllers/services/repositories.
- Auth/session/account flows.
- API response/error contract work.
- Prisma schema and migration changes.
- File/document/storage APIs.
- Notification, search, chat, billing, task, booking, expense, or domain modules.
- Production hardening: CORS, Helmet, rate limit, validation, logging, health, Swagger.

## Layering

```text
module/
  dto/                    request validation DTOs
  module.controller.ts    HTTP orchestration only
  module.service.ts       business logic and authorization
  module.repository.ts    database access only
  module.types.ts         response mapping and domain types
  module.service.spec.ts  focused service tests
```

Rules:

- Controllers do not contain business logic.
- Services do not expose raw ORM entities.
- Repositories do not make authorization decisions unless explicitly named as scoped queries.
- DTOs validate all external input.
- Response mappers shape output and remove sensitive fields.

## Global App Baseline

Configure:

- Helmet/security headers.
- JSON body size limit.
- CORS allowlist.
- Global API prefix.
- Global validation pipe with whitelist, forbidden unknown fields, transform.
- Global success envelope interceptor.
- Global exception filter.
- Request ID middleware.
- Structured HTTP latency logging.
- Swagger/OpenAPI for client-consumed APIs.
- Health/readiness endpoint.

## Response Envelope

Success:

```json
{ "success": true, "data": {} }
```

Paginated success:

```json
{
  "success": true,
  "data": [],
  "meta": { "pagination": { "page": 1, "pageSize": 20, "total": 100, "totalPages": 5 } }
}
```

Error:

```json
{ "success": false, "code": "FORBIDDEN", "message": "You do not have access.", "details": {} }
```

Rules:

- Never expose stack traces, Prisma errors, framework names, token values, password hashes, or secrets.
- Error `code` is stable; `message` can be localized.
- Validation details should identify fields without leaking internal schemas.

## Validation

- Validate body, query, params, and headers.
- Use DTO decorators or schema validation consistently.
- Reject unknown body fields.
- Transform primitive query/param types intentionally.
- Validate pagination bounds.
- Validate IDs, ownership-dependent links, enum values, money/currency, dates, and ranges.
- Backend validation is authoritative even when frontend validates too.

## Auth And Authorization

- Authentication answers "who is this?"
- Authorization answers "can this user do this to this resource?"
- Never trust `userId`, owner id, role, entitlement, permission, currency, or membership from the client.
- Load the resource or scoped relation before mutation.
- Check object-level ownership/membership/role in service or policy guards.
- Separate admin/owner/member/viewer rules clearly.
- Destructive or sensitive flows may need audit events.

## Persistence

- Use repositories for Prisma/database access.
- Use transactions for multi-step writes and derived records.
- Use migrations for schema changes.
- Add indexes for ownership, status, lookup fields, unique constraints, pagination, expiry, and audit queries.
- Keep history when deletion would break financial, legal, audit, or collaboration records.
- Use soft removal where history must remain readable.
- Avoid N+1 queries; include/select intentionally.
- Do not return Prisma objects directly to controllers.

## Security

- Hash passwords with a modern password hash.
- Hash refresh tokens at rest.
- Rotate refresh tokens and support revocation.
- Add route-specific throttling for auth/reset/invite/sensitive flows.
- Use CORS allowlists, not open origins, in production.
- Keep all secrets in env.
- Validate env at startup and fail fast when required secrets are missing.
- Limit request body sizes and file sizes.

## OpenAPI/Contract

- Add tags and response descriptions.
- Keep route DTOs and response examples current.
- Document auth requirements.
- Document pagination and error envelope.
- For client-critical flows, add contract tests or generated types when possible.

## Testing

- Service unit tests for business rules and authorization.
- Repository tests only where query behavior is nontrivial.
- HTTP/e2e tests for auth, validation, envelope, and critical workflows.
- Migration/schema changes need at least typecheck plus focused tests.
- File/storage/provider boundaries should have mock/provider tests.

## Observability

- Add request IDs.
- Log method/path/status/duration and request id.
- Do not log secrets, passwords, tokens, reset links, private keys, or sensitive PII.
- Health endpoint should verify app liveness; readiness can verify database/provider dependencies when needed.

## Review Checklist

- DTO rejects unknown fields.
- Controller is thin.
- Service checks resource-level authorization.
- Repository owns DB access.
- Response mapper removes sensitive fields.
- Envelope/filter apply.
- Transactions protect multi-step writes.
- Indexes support new lookup patterns.
- Tests cover changed behavior or risk is documented.
