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

## ADR-0002: Vendor Expo skills into repository

- Date: 2026-05-20
- Status: accepted

### Context

Project can bo skill Expo co the di theo repo khi push len GitHub.

### Decision

Copy `expo/skills` vao `skills/expo/` va giu license goc.

### Consequences

- Codex co the doc skill local.
- Khi muon update, sync lai theo `docs/EXPO_SKILLS.md`.
