# Decisions

Ghi lai quyet dinh quan trong de Codex va team khong phai tranh luan lai.

## ADR-0001: Use AGENTS.md as Codex source of truth

- Date: 2026-05-20
- Status: accepted

### Context

Project can mot file dau vao on dinh de Codex doc truoc khi lam viec.

### Decision

Dung `AGENTS.md` lam file huong dan chinh.

### Consequences

- Khi thay doi workflow, cap nhat `AGENTS.md`.
- Cac docs chi tiet nam trong `docs/`.

## ADR-0002: Keep NestJS skills available locally

- Date: 2026-05-20
- Status: accepted

### Context

Project can dung skill tu `Kadajett/agent-nestjs-skills`.

### Decision

Giu skill tai `skills/nestjs/agent-nestjs-skills` de Codex co the doc rule NestJS offline trong workspace.

### Consequences

- Codex co the doc skill ngay sau khi clone repo fullstack.
- Khi can cap nhat skill, thay noi dung thu muc nay bang snapshot moi tu upstream.
