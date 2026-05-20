# Codex Project Guide

## Project Identity

Repo nay la template de tao NestJS backend project moi voi Codex IDE. No lay cam hung tu `opencode-react-native-template`, nhung dung `AGENTS.md` lam source of truth cho Codex.

## Language

- Trao doi voi user bang tieng Viet, ngan gon va ro viec.
- Khi sua code, uu tien pattern dang co trong project.
- Truoc khi lam feature lon: doc brief/spec/task lien quan, sau do chia viec nho.

## Local NestJS Skill

Project nay gan NestJS best-practice skill tu:

```text
skills/nestjs/agent-nestjs-skills/
```

Day la vendored snapshot tu `https://github.com/Kadajett/agent-nestjs-skills`.

Khi lam viec lien quan NestJS, dependency injection, modules, controllers, providers, DTOs, validation, guards, interceptors, filters, database, testing, security, performance, microservices, hoac deployment, hay doc skill phu hop truoc khi code.

## Skill Map

- `skills/nestjs/agent-nestjs-skills/SKILL.md`: entrypoint cua skill.
- `skills/nestjs/agent-nestjs-skills/AGENTS.md`: compiled NestJS best-practice guide.
- `skills/nestjs/agent-nestjs-skills/rules/arch-*.md`: architecture va module boundaries.
- `skills/nestjs/agent-nestjs-skills/rules/di-*.md`: dependency injection.
- `skills/nestjs/agent-nestjs-skills/rules/api-*.md`: DTOs, pipes, interceptors, versioning.
- `skills/nestjs/agent-nestjs-skills/rules/security-*.md`: guards, JWT, validation, sanitization, rate limit.
- `skills/nestjs/agent-nestjs-skills/rules/error-*.md`: exception handling va filters.
- `skills/nestjs/agent-nestjs-skills/rules/db-*.md`: migrations, transactions, N+1.
- `skills/nestjs/agent-nestjs-skills/rules/test-*.md`: TestingModule, Supertest, mocks.
- `skills/nestjs/agent-nestjs-skills/rules/devops-*.md`: config, logging, graceful shutdown.
- `skills/nestjs/agent-nestjs-skills/rules/micro-*.md`: health checks, queues, message patterns.
- `skills/nestjs/agent-nestjs-skills/rules/perf-*.md`: caching, lazy loading, database optimization.

## Workflow

1. Neu user dua y tuong moi, tao/bo sung spec truoc khi code.
2. Neu task lien quan NestJS, doc skill/rule tuong ung trong `skills/nestjs/agent-nestjs-skills`.
3. Neu skill bi thieu file, cap nhat lai tu upstream `Kadajett/agent-nestjs-skills`.
4. Sau khi code, chay verify phu hop: lint, typecheck, test, e2e, build, hoac migration dry run khi can.
5. Cap nhat checkpoint/task log neu project da co cac file do.

## Template Files

- `README.md`: gioi thieu template va cach dung.
- `docs/BRIEF.md`: y tuong san pham.
- `docs/SPECIFICATIONS.md`: yeu cau chi tiet.
- `docs/ARCHITECTURE.md`: stack, structure va convention.
- `docs/SCOPE_BREAKDOWN.md`: chia layer.
- `tasks/layer-0-todo.md`: viec nen tang.
- `scripts/start-project.sh`: tao project moi tu template.

## NestJS Guardrails

- Khong commit secret, token, `.env` that, database dump, private key.
- Dung `.env.example` de ghi ten bien moi truong.
- Validate all external input bang DTO + validation pipe.
- Tach controller orchestration khoi business logic trong service.
- Khong tao circular dependency neu co the thiet ke lai module boundary.
- Khong chay migration destructive hoac deploy production neu user chua yeu cau ro.
