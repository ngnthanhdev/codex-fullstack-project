# Production Hardening Plan

Use this plan when a generated project starts from a thin scaffold and needs to become production-ready.

## Phase 0 - Production Foundation

- Add production rules and architecture proposals.
- Add centralized mobile API client, token store, error normalization, query client, and auth service layer.
- Refactor auth forms to React Hook Form + Zod.
- Add backend global error/response/logging/security baseline.
- Add refresh-token rotation and repository boundary for auth/users.

## Phase 1 - API Contract and Tests

- Add OpenAPI/Swagger.
- Add shared contract generation or schema export strategy.
- Add auth service unit tests, API integration tests, and mobile auth form tests.
- Add CI workflow for typecheck/build/test.

## Phase 2 - First Domain Data Flow

- Implement the first domain backend modules with repository layer and resource-level authorization.
- Add typed mobile services and TanStack Query hooks.
- Add offline queue and sync mutation if the product needs offline writes.

## Phase 3 - Production Deployment Readiness

- Add Dockerfile/docker-compose for local dependencies.
- Add health/readiness endpoints.
- Add structured log shipping and error tracking integration.
- Add staging deployment workflow and rollback plan.

## Phase 4 - Global SaaS Hardening

- Add billing/premium entitlement verification.
- Add rate limits by route and account risk signals.
- Add audit logs for account deletion and security-sensitive actions.
- Add data retention and privacy export/delete workflows.
