# Codex NestJS Template

Production-ready template de khoi dong NestJS backend project voi Codex IDE.

Template nay tap trung vao workflow:

```text
Idea -> Brief -> Specification -> Scope Breakdown -> Code -> Test -> Checkpoint -> Ship
```

## Muc Tieu

- Giup Codex hieu backend project ngay tu dau thong qua `AGENTS.md`.
- Luu yeu cau, kien truc, quyet dinh va task trong `docs/` va `tasks/`.
- Chia scope theo layer de lam viec co thu tu.
- Co san NestJS best-practice skill tu `Kadajett/agent-nestjs-skills`.
- Co script tao project moi tu template.
- Co CI mau cho NestJS / TypeScript project.

## Co Gi San

```text
AGENTS.md                                Huong dan chinh cho Codex
CHECKPOINT.md                            Tom tat trang thai sau moi giai doan
docs/
  BRIEF.md                               Tom tat y tuong ban dau
  SPECIFICATIONS.md                      Yeu cau chi tiet
  ARCHITECTURE.md                        Kien truc va convention NestJS
  SCOPE_BREAKDOWN.md                     Chia scope theo layer
  DECISIONS.md                           Architecture Decision Records ngan
  NESTJS_SKILLS.md                       Huong dan skill NestJS
  phases/phase-0.md                      Workflow brainstorm/design truoc khi code
tasks/
  layer-0-todo.md                        Foundation tasks
  layer-refinement-todo.md               Bug/feature sau khi app da chay
  done.md                                Log viec da xong
skills/nestjs/agent-nestjs-skills/       NestJS skills vendored tu Kadajett/agent-nestjs-skills
scripts/
  start-project.sh                       Tao project moi tu template tren macOS/Linux
  start-project.ps1                      Tao project moi tren Windows PowerShell
  add-task.js                            Them task vao file layer
  pick-task.js                           Lay task todo dau tien
.github/workflows/ci.yml                 CI mau
```

## Cach Dung Template

### Tao project moi

Tren macOS/Linux:

```bash
./scripts/start-project.sh
```

Tren Windows PowerShell:

```powershell
.\scripts\start-project.ps1
```

Sau do mo project moi trong Codex IDE va bat dau bang:

```text
Hay doc AGENTS.md, docs/BRIEF.md, docs/SPECIFICATIONS.md va tasks/layer-0-todo.md roi bat dau Phase 0.
```

### Dung truc tiep repo nay

```bash
npm run check
git status
```

## NestJS Skill

Skill source:

https://github.com/Kadajett/agent-nestjs-skills

Template nay co NestJS skill tai:

```text
skills/nestjs/agent-nestjs-skills/
```

Khi lam viec lien quan NestJS, Codex nen doc:

```text
skills/nestjs/agent-nestjs-skills/SKILL.md
skills/nestjs/agent-nestjs-skills/AGENTS.md
```

Neu can chi tiet theo chu de, doc cac rule trong:

```text
skills/nestjs/agent-nestjs-skills/rules/
```

## Nguyen Tac Lam Viec Voi Codex

- Brainstorm va viet spec truoc khi code feature lon.
- Moi task nen nho, co acceptance criteria ro.
- Dung module boundaries ro rang: controller, service, provider, repository, DTO, guard, pipe, interceptor.
- Test/verify ngay sau khi code.
- Sau moi layer, cap nhat `CHECKPOINT.md`.
- Khong commit secret. Chi commit `.env.example`.

## License

Template nay dung MIT License. NestJS skill giu license/terms theo upstream repository.
