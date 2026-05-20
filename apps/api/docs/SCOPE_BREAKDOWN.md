# Scope Breakdown

Dung dependency-driven layers. Lam xong layer truoc roi moi sang layer sau.

## Layer 0: Foundation

Muc tieu: tao nen tang de backend chay va de team/Codex lam viec nhat quan.

- Project setup
- TypeScript/lint/test config
- ConfigModule va `.env.example`
- Health endpoint
- Global validation pipe
- Error response pattern
- Logging baseline

## Layer 1: Core Domain API

Muc tieu: lam luong API gia tri chinh.

- Feature modules
- DTOs
- Controllers/services
- Core data model
- Unit tests

## Layer 2: Persistence And Integrations

Muc tieu: noi database, auth, queues, third-party service.

- Database schema/migrations
- Repository layer
- Auth/authorization
- External service clients
- Transactions va retry policy khi can

## Layer 3: Release Readiness

Muc tieu: dua backend den trang thai co the deploy.

- E2E tests
- Dockerfile/docker-compose neu can
- CI/CD
- Observability: logs, metrics, health checks
- Security hardening

## Refinement Layer

Sau khi backend chay, bug va feature moi duoc dua vao `tasks/layer-refinement-todo.md`.
