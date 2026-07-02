---
name: mobile-api-query-skill
description: Use when implementing frontend API clients, auth refresh, API envelopes, TanStack Query, query-key factories, typed service layers, mutations, pagination, cache invalidation, loading/error states, or network failure handling.
---

# Mobile API Query Skill

Use this before wiring screens to backend APIs.

## API Envelope

All JSON responses should use:

```json
{ "success": true, "data": {} }
```

```json
{ "success": false, "code": "VALIDATION_ERROR", "message": "Please check the highlighted fields.", "details": {} }
```

Pagination should return `data` plus `meta.pagination`.

## Client Rules

- Route components must not call `fetch`, `axios`, or backend URLs directly.
- Use one API client to attach auth headers, language headers, parse envelopes, normalize errors, and handle network failures.
- Use single-flight refresh handling so concurrent 401 responses share one refresh request.
- Expose typed helpers for normal JSON, paginated JSON, form data, and raw uploads.
- Keep feature API calls in `features/<feature>/services`.

## Query Rules

- Use TanStack Query for server state.
- Keep query keys in one centralized factory.
- Feature hooks should wrap `useQuery`, `useInfiniteQuery`, and `useMutation`.
- Mutations must invalidate/refetch all affected query keys.
- Use cached data during revisit/refetch where helpful.
- Screens must handle loading, empty, error, retry, and disabled mutation states.

## Checklist

- API contract exists before UI wiring.
- Service layer is typed.
- Query keys are centralized.
- Mutations invalidate related keys.
- Errors reaching UI are user-friendly.
