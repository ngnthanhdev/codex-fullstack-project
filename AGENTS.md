# Codex Fullstack Project

This repository is a Codex-first fullstack project shell.

## Project Layout

```text
apps/mobile  Expo React Native frontend workspace
apps/api     NestJS backend workspace
docs         Shared fullstack planning documents
tasks        Shared cross-app task tracking
```

## Working Rules

- Read this file before working on the project.
- Read `docs/BRIEF.md`, `docs/SPECIFICATIONS.md`, and `docs/ARCHITECTURE.md` before implementing large changes.
- For mobile work, also read `apps/mobile/AGENTS.md`.
- For backend work, also read `apps/api/AGENTS.md`.
- Keep API contracts explicit before wiring mobile screens to backend behavior.
- Prefer implementing backend behavior first when the data model or API shape is unclear.
- Update shared docs when a decision affects both frontend and backend.
- Do not commit secrets. Keep examples in `.env.example` files only.

## Workspace Ownership

- `apps/mobile`: Expo Router, React Native UI, device integrations, mobile data fetching, EAS.
- `apps/api`: NestJS modules, controllers, services, DTOs, guards, database integrations, API tests.
- `docs`: product brief, specifications, architecture decisions, cross-app scope.
- `tasks`: fullstack tasks that involve both `apps/mobile` and `apps/api`.

## Expected Workflow

1. Clarify the product goal in `docs/BRIEF.md`.
2. Turn the goal into detailed behavior in `docs/SPECIFICATIONS.md`.
3. Define the API boundary and shared contracts in `docs/ARCHITECTURE.md`.
4. Break implementation into layers in `docs/SCOPE_BREAKDOWN.md`.
5. Track cross-app work in `tasks/layer-0-todo.md`.
6. Implement, test, and update `tasks/done.md`.

## Useful Commands

```bash
npm run check
npm run check:mobile
npm run check:api
npm run pick-task:mobile
npm run pick-task:api
```

