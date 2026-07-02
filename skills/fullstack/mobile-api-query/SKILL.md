---
name: mobile-api-query-skill
description: Use when implementing, reviewing, or refactoring frontend API clients, auth refresh, API envelopes, TanStack Query, query-key factories, typed service layers, mutations, pagination, cache invalidation, loading/error states, optimistic or cached UI, and network failure handling.
---

# Mobile API Query Skill

Use this skill before wiring screens to backend data. The goal is a typed, centralized, resilient client layer that keeps route components free of transport details.

## When To Apply

Use for:

- New API-backed screens.
- Auth/session/bootstrap flows.
- Token refresh, retry, and network error handling.
- TanStack Query hooks and query keys.
- Pagination/infinite lists.
- Mutations and cache invalidation.
- Upload/download API calls.

## Standard Envelope

Success:

```json
{ "success": true, "data": {} }
```

Error:

```json
{ "success": false, "code": "VALIDATION_ERROR", "message": "Please check the highlighted fields.", "details": {} }
```

Pagination:

```json
{
  "success": true,
  "data": [],
  "meta": { "pagination": { "page": 1, "pageSize": 20, "total": 100, "totalPages": 5 } }
}
```

## Layering

```text
lib/api/api-client.ts        transport, envelope, auth, language, refresh
lib/api/api-error.ts         normalized error type and message helpers
lib/query/query-keys.ts      centralized query key factory
lib/query/query-client.ts    query defaults
features/x/services         typed API calls
features/x/hooks            useQuery/useMutation wrappers
routes/screens              compose hooks and UI only
```

## API Client Rules

- Route components must not call `fetch`, `axios`, or backend URLs directly.
- One client attaches auth headers, language headers, content type, and request metadata.
- One parser unwraps success envelopes and throws normalized errors.
- Network failures map to a consistent network error code/message.
- 401 refresh is single-flight: concurrent failures share one refresh request.
- After refresh success, retry the original request once.
- If refresh fails, clear session and route to auth intentionally.
- Provide helpers for JSON, paginated JSON, form data, upload target calls, and raw download/upload responses.
- Do not leak backend/framework error shapes to UI components.

## Query Key Rules

- Use one query key factory.
- Keys should include resource hierarchy and params that affect result.
- Avoid hand-written array keys in screens.
- Keep detail/list keys related so invalidation is easy.
- Include language/currency/user scope when it affects returned data.

Example shape:

```ts
export const queryKeys = {
  profile: { me: ["profile", "me"] as const },
  trips: {
    all: ["trips"] as const,
    detail: (tripId: string) => ["trips", tripId] as const,
  },
};
```

## Service Rules

- Feature services own endpoint paths and request/response types.
- Services return domain payloads, not envelopes.
- Services should not show toasts or navigate.
- Services should not know about React components.
- Use explicit input/output types for every API call.

## Hook Rules

- Feature hooks own TanStack Query behavior.
- Hooks can expose `displayData` for cached revisit data.
- Mutations invalidate or update every affected query key.
- Hooks may centralize optimistic update and rollback logic.
- Hooks should not hide important errors unless the screen has another recovery path.

## Screen Rules

- Screens handle loading, cached, empty, error, retry, permission, and mutation pending states.
- First load can show skeleton.
- Revisit can show cached content while refetching.
- Mutation errors go through normalized user-friendly messages.
- Use disabled-submit/pending UI to prevent duplicate writes.

## Pagination Rules

- Backend owns page metadata.
- Client validates pagination meta exists for paginated helpers.
- Infinite lists need footer loading, end state, retry for next page, and stable item keys.
- Do not blank existing pages while fetching the next page.

## Auth Rules

- Access tokens are short-lived.
- Refresh tokens rotate and are stored securely.
- Client refresh queue must avoid refresh storms.
- Protected route gate should not flash private screens before session bootstrap.
- Preserve return path for deep links requiring login.

## Review Checklist

- API contract exists.
- Screen has no direct transport calls.
- Service types match backend response.
- Query key is centralized.
- Mutations invalidate affected keys.
- Errors are normalized.
- Cached/retry states are designed.
- Refresh behavior is single-flight and bounded.
