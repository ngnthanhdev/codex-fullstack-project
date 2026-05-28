# Codex Fullstack Project

Codex-first fullstack project shell for building an Expo React Native mobile app with a NestJS backend API.

This repository was created from:

- `ngnthanhdev/codex-react-native-template`
- `ngnthanhdev/codex-nestjs-template`

The goal of this repo is to give Codex a clear, repeatable workflow from product idea to implementation:

```text
Idea -> Brief -> Specification -> Scope Breakdown -> Code -> Test -> Checkpoint -> Ship
```

## Repository Structure

```text
apps/
  mobile/   Expo React Native workspace and Expo-specific Codex skills
  api/      NestJS backend workspace and NestJS-specific Codex skills
docs/       Shared fullstack planning documents
tasks/      Shared cross-app task tracking
AGENTS.md   Root instructions that Codex should read first
```

## Production Rule Documents

Codex should treat these files as the production baseline for new projects:

- `docs/Production Rules.md`: API envelope, frontend rules, backend rules, review checklist, and recommended hardening additions.
- `docs/Frontend Architecture Proposal.md`: recommended mobile folder structure and data-flow boundaries.
- `docs/Backend Architecture Proposal.md`: recommended NestJS structure, security baseline, and repository boundaries.
- `docs/Refactor Plan.md`: phased plan for turning a scaffold into production-ready code.

## Clone The Project

```bash
git clone https://github.com/ngnthanhdev/codex-fullstack-project.git
cd codex-fullstack-project
```

Install workspace dependencies:

```bash
npm install
```

Run the template checks:

```bash
npm run check
```

## Open In Codex IDE

1. Open Codex IDE.
2. Choose **Open Folder**.
3. Select the cloned `codex-fullstack-project` folder.
4. Start a new Codex chat inside that folder.
5. Send this prompt:

```text
Read AGENTS.md, docs/BRIEF.md, docs/SPECIFICATIONS.md, docs/ARCHITECTURE.md, docs/Production Rules.md, docs/Frontend Architecture Proposal.md, docs/Backend Architecture Proposal.md, docs/Refactor Plan.md, and tasks/layer-0-todo.md.
Then start Phase 0 for this fullstack Expo + NestJS project.
Work sequentially: clarify the brief, update the specifications, define the production rules that apply now, define the first vertical slice, then propose the implementation order before coding.
```

Codex should then follow the root workflow first. When the work becomes mobile-specific, it should also read `apps/mobile/AGENTS.md`. When the work becomes backend-specific, it should also read `apps/api/AGENTS.md`.

## Recommended AI Workflow

Ask Codex to work in this order:

1. Fill or refine `docs/BRIEF.md`.
2. Turn the brief into concrete behavior in `docs/SPECIFICATIONS.md`.
3. Apply the baseline in `docs/Production Rules.md`.
4. Define the API boundary and app structure in `docs/ARCHITECTURE.md`.
5. Align mobile implementation with `docs/Frontend Architecture Proposal.md`.
6. Align backend implementation with `docs/Backend Architecture Proposal.md`.
7. Break the first release into layers in `docs/SCOPE_BREAKDOWN.md`.
8. Pick the first task from `tasks/layer-0-todo.md`.
9. Scaffold runnable app code only after the product direction is clear.
10. Implement backend behavior before mobile integration when the API shape is unclear.
11. Test or verify each completed layer before moving forward.

## Useful Commands

```bash
npm run check
npm run check:mobile
npm run check:api
npm run pick-task:mobile
npm run pick-task:api
```

## Environment Files

Use `.env.example` files as references only:

```text
.env.example
apps/mobile/.env.example
apps/api/.env.example
```

Do not commit real `.env` files or secrets.

## Important Note

The two source repositories are Codex workflow templates. They provide docs, task structure, and skills. They are not yet runnable Expo/NestJS apps until the runtime app code is scaffolded during implementation.
