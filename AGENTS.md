# Codex Fullstack Project

This repository is a Codex-first fullstack project shell.

## Project Layout

```text
apps/mobile  Expo React Native frontend workspace
apps/api     NestJS backend workspace
docs         Shared fullstack planning documents
tasks        Shared cross-app task tracking
skills       Shared Codex skills for production fullstack work
```

## Working Rules

- Read this file before working on the project.
- Read `docs/BRIEF.md`, `docs/SPECIFICATIONS.md`, `docs/ARCHITECTURE.md`, and `docs/Production Rules.md` before implementing large changes.
- Use `docs/Frontend Architecture Proposal.md` for mobile structure and data-flow decisions.
- Use `docs/Backend Architecture Proposal.md` for API structure, validation, security, and repository boundaries.
- Use `docs/Refactor Plan.md` when turning a thin scaffold into production-ready code.
- Use `skills/fullstack/production-app/SKILL.md` before implementing production user-facing workflows, forms, date/time inputs, uploads, notifications, offline/cache behavior, OCR/extraction, or cross-layer fullstack features.
- For mobile work, also read `apps/mobile/AGENTS.md`.
- For backend work, also read `apps/api/AGENTS.md`.
- Keep API contracts explicit before wiring mobile screens to backend behavior.
- Prefer implementing backend behavior first when the data model or API shape is unclear.
- Update shared docs when a decision affects both frontend and backend.
- Do not commit secrets. Keep examples in `.env.example` files only.
- All JSON API responses should follow the standard envelope in `docs/Production Rules.md`.
- Frontend components must not call backend APIs directly; use service/query/mutation layers.
- Backend modules that touch persistence should use controller/service/repository layering.
- New environment variables must be added to `.env.example` and validated at app startup where applicable.

## Workspace Ownership

- `apps/mobile`: Expo Router, React Native UI, device integrations, mobile data fetching, EAS.
- `apps/api`: NestJS modules, controllers, services, DTOs, guards, database integrations, API tests.
- `docs`: product brief, specifications, architecture decisions, cross-app scope.
- `tasks`: fullstack tasks that involve both `apps/mobile` and `apps/api`.

## Expected Workflow

1. Clarify the product goal in `docs/BRIEF.md`.
2. Turn the goal into detailed behavior in `docs/SPECIFICATIONS.md`.
3. Read `docs/Production Rules.md` and decide which baseline rules apply immediately.
4. Read `skills/fullstack/production-app/SKILL.md` for the reusable implementation baseline.
5. Define the API boundary and shared contracts in `docs/ARCHITECTURE.md`.
6. Align mobile structure with `docs/Frontend Architecture Proposal.md`.
7. Align backend structure with `docs/Backend Architecture Proposal.md`.
8. Break implementation into layers in `docs/SCOPE_BREAKDOWN.md`.
9. Track cross-app work in `tasks/layer-0-todo.md`.
10. Implement, test, and update `tasks/done.md`.

## Useful Commands

```bash
npm run check
npm run check:mobile
npm run check:api
npm run pick-task:mobile
npm run pick-task:api
npm run list-skills
```
