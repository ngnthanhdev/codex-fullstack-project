# Frontend Architecture Proposal

## Target Structure

```text
apps/mobile
  app/                    Expo Router routes only
  components/             shared reusable UI
  features/
    auth/
      components/         auth form fields / panels
      hooks/              auth mutations and route guard helpers
      schemas/            zod schemas and inferred types
      services/           typed API calls
      types/              auth-specific types
  lib/
    api/                  axios client, token store, error normalization
    query/                TanStack Query client and query keys
    notifications/        toast/alert abstraction
  hooks/                  cross-feature hooks
  theme/                  design tokens
  utils/                  pure helpers
```

## Baseline To Implement

- Centralized Axios client with access-token attachment.
- Response interceptor with refresh-token rotation, retry, and single-flight concurrent 401 handling.
- Normalized API error model.
- TanStack Query provider, query key factory, and auth mutation hooks.
- Auth forms implemented with React Hook Form or TanStack Form plus Zod/Yup.
- Auth service layer owns all auth API calls.

## Frontend Compatibility Guidance

The internal API client should unwrap the backend standard envelope so UI components receive domain payloads instead of transport envelopes. Route components should remain thin and should not know about token refresh, retry queues, or backend error shapes.

## Next Phases

1. Add route guards for authenticated routes once full session bootstrap is defined.
2. Move feature-specific writes to service/query/mutation layers.
3. Add React Query persistence for offline-capable flows.
4. Replace alert notification baselines with a polished app-level toast component.
5. Add component tests for forms and integration tests for API-backed flows.
