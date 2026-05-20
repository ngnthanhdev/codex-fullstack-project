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
- Keep cross-app work in root `tasks/`.
- Keep app-specific work in each app's own `tasks/` directory.
- Update this document when API shape, authentication, deployment, or data ownership changes.

