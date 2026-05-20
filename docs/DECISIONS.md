# Decisions

Record important fullstack decisions here.

## ADR-0001: Use a Monorepo Layout

Status: Accepted

The project keeps the mobile frontend and backend API in one repository:

- `apps/mobile` for Expo React Native.
- `apps/api` for NestJS.

This keeps planning, API contracts, and cross-app changes easy to coordinate.

