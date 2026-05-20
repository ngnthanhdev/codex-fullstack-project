# NestJS Skill For Codex

Nguon: https://github.com/Kadajett/agent-nestjs-skills

Template nay co skill tai:

```text
skills/nestjs/agent-nestjs-skills/
```

## Cach Codex Nen Dung

- Doc `skills/nestjs/agent-nestjs-skills/SKILL.md` khi bat dau task NestJS.
- Doc `skills/nestjs/agent-nestjs-skills/AGENTS.md` neu can ban compiled day du.
- Doc rule cu the trong `rules/` theo task:
  - `arch-*`: architecture/module boundaries
  - `di-*`: dependency injection
  - `api-*`: DTOs, pipes, interceptors, versioning
  - `security-*`: validation, guards, JWT, rate limiting
  - `error-*`: exceptions, filters, async errors
  - `db-*`: migrations, transactions, N+1
  - `test-*`: TestingModule, Supertest, mocks
  - `devops-*`: config, logging, graceful shutdown
  - `micro-*`: queues, health checks, message patterns
  - `perf-*`: caching, lazy loading, database optimization

## Cap Nhat Skill

```bash
rm -rf skills/nestjs/agent-nestjs-skills
git clone --depth 1 https://github.com/Kadajett/agent-nestjs-skills.git skills/nestjs/agent-nestjs-skills
rm -rf skills/nestjs/agent-nestjs-skills/.git
git add skills/nestjs/agent-nestjs-skills
git commit -m "Update NestJS skills"
```

## License Note

NestJS skill giu license/terms theo upstream repository.
