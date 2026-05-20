# Architecture

## Default Stack

- NestJS
- TypeScript
- REST-first API, co the mo rong GraphQL/WebSocket/queues khi can
- Jest + Supertest
- ConfigModule cho environment config

## Recommended Structure

```text
src/
  main.ts
  app.module.ts
  common/
    decorators/
    filters/
    guards/
    interceptors/
    pipes/
  config/
  modules/
    feature-name/
      feature-name.module.ts
      feature-name.controller.ts
      feature-name.service.ts
      dto/
      entities/
      repositories/
  database/
  health/
test/
```

## Coding Conventions

- Module theo feature boundary, khong gom tat ca vao mot shared module lon.
- Controllers chi xu ly transport/HTTP concerns.
- Services chua business logic.
- DTOs validate input bang class-validator hoac schema validator project chon.
- Repository/data access layer tach khoi service khi logic query phuc tap.
- Dung guards cho authorization, pipes cho validation/transformation, interceptors cho cross-cutting concerns.
- Throw HTTP exceptions ro rang o boundary phu hop.
- Khong de secret trong source code.

## NestJS Skill Usage

- Architecture/module boundary: `rules/arch-*.md`
- Dependency injection: `rules/di-*.md`
- API design: `rules/api-*.md`
- Security: `rules/security-*.md`
- Error handling: `rules/error-*.md`
- Database: `rules/db-*.md`
- Testing: `rules/test-*.md`
- DevOps: `rules/devops-*.md`

## Testing Strategy

- Unit tests cho service va pure logic.
- Controller tests voi TestingModule khi can.
- E2E tests voi Supertest cho API flow chinh.
- Mock external services trong tests.
