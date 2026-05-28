# Architecture

## High-Level Layout

```text
apps/mobile  Expo React Native frontend
apps/api     NestJS backend API
```

## Integration Contract

- Mobile calls backend through a configured API base URL.
- Backend owns validation, authorization, persistence, and business rules.
- Mobile owns presentation, navigation, local UI state, and device-specific behavior.

## Conventions

- Keep shared decisions in `docs/DECISIONS.md`.
- Keep production rules in `docs/Production Rules.md`.
- Use `docs/Frontend Architecture Proposal.md` before changing mobile structure or server-state flow.
- Use `docs/Backend Architecture Proposal.md` before changing API structure, validation, persistence, auth, or logging.
- Use `docs/Refactor Plan.md` to phase production hardening work.
- Keep cross-app work in root `tasks/`.
- Keep app-specific work in each app's own `tasks/` directory.
- Update this document when API shape, authentication, deployment, or data ownership changes.
