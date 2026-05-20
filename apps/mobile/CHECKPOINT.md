# Project Checkpoint

Cap nhat file nay sau moi layer lon de Codex co the tiep tuc ma khong can doc lai toan bo lich su chat.

## Current State

- Template repo da co AGENTS.md, docs, tasks, scripts va Expo skills.
- Chua co app source code mac dinh; project con duoc tao tu script hoac them sau.

## Architecture Snapshot

```text
Codex reads AGENTS.md
  -> reads docs/BRIEF.md and docs/SPECIFICATIONS.md
  -> picks tasks from tasks/layer-*-todo.md
  -> loads matching skills/expo/*/SKILL.md when Expo work appears
  -> implements and verifies
  -> updates tasks/done.md and CHECKPOINT.md
```

## Key Decisions

- Dung `AGENTS.md` lam source of truth cho Codex IDE.
- Vendor Expo skills vao repo de workflow portable khi push len GitHub.
- Chia task theo layer de tranh lam viec lon qua trong mot prompt.

## Open Questions

- Ten app/product cuoi cung la gi?
- Stack backend/data se dung gi?
- Deploy target dau tien: iOS, Android, web, hay ca ba?

## Next Recommended Step

1. Dien `docs/BRIEF.md`.
2. Dien `docs/SPECIFICATIONS.md`.
3. Chay Phase 0 theo `docs/phases/phase-0.md`.
4. Cap nhat `tasks/layer-0-todo.md` theo scope that.
