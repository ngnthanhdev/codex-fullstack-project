---
name: nestjs-production-api-skill
description: Use when building or hardening NestJS APIs with standard response envelopes, global exception filters, validation pipes, CORS allowlists, Helmet, env validation, controller/service/repository layering, Prisma persistence, Swagger/OpenAPI, auth, authorization, and production observability.
---

# NestJS Production API Skill

Use this before adding backend modules consumed by a client.

## Structure

- Controller: HTTP orchestration only.
- Service: business logic, authorization, transactions, domain decisions.
- Repository: database access.
- DTO: body/query/params validation.
- Types/mapper: response DTO shaping; do not return ORM entities directly.

## Global App Baseline

- Helmet/security headers.
- JSON body size limit.
- CORS allowlist with credentials only when needed.
- Global prefix.
- Global validation pipe with whitelist, forbid unknown fields, transform.
- Global success envelope interceptor.
- Global exception filter returning `{ success, code, message, details }`.
- Request ID middleware and structured HTTP latency logging.
- Swagger/OpenAPI for client-consumed routes.
- Health/readiness endpoints before deployment automation.

## Security Rules

- Never trust client-supplied owner, user, role, entitlement, currency, or permission values.
- Enforce resource/object-level authorization in service or policy guards.
- Hash passwords and refresh tokens at rest.
- Rotate and revoke refresh tokens.
- Use route-specific throttling for sensitive flows.
- Keep secrets in env only; validate env at startup.

## Persistence Rules

- Use migrations for schema changes.
- Use transactions for multi-step writes.
- Add indexes for ownership, status, lookup, and pagination fields.
- Keep soft-delete/history where financial or audit history matters.

## Checklist

- DTO rejects unknown fields.
- Response envelope and error filter apply.
- Repository owns DB access.
- Authorization checks real resource ownership.
- Tests cover service behavior or HTTP contract for risky routes.
