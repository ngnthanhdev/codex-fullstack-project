---
name: production-app-fullstack
description: Use when building or refactoring a production-quality fullstack app with a mobile or frontend client and an API backend. Covers UI/UX quality, design tokens, animation, forms, native date/time inputs, API envelopes, TanStack Query/service layers, Firebase push notifications, document/file upload, OCR/review-first extraction flows, i18n, offline/cache behavior, and NestJS-style production API rules. Apply before implementing user-facing workflows, cross-layer features, auth/session flows, file/media features, notification features, or production hardening.
---

# Production App Fullstack

Use this skill to turn a scaffold into a polished production app. It is intentionally framework-aware but not product-specific: adapt names, routes, colors, and domain models to the project.

## When To Use

Use this skill for:

- New user-facing mobile/frontend features.
- Cross-layer work touching UI, API, persistence, auth, files, notifications, or i18n.
- Refactoring screens into production-ready workflows.
- Adding forms, date/time inputs, uploads, OCR/extraction, push notifications, offline/cached states, or realtime/chat-like behavior.
- Hardening an API backend before mobile integration.

Also read app-specific skills:

- Expo/React Native work: `apps/mobile/AGENTS.md` and relevant `apps/mobile/skills/expo/**/SKILL.md`.
- NestJS/backend work: `apps/api/AGENTS.md` and relevant `apps/api/skills/nestjs/**/SKILL.md`.

## Working Sequence

1. Define the user job and the first vertical slice.
2. Write or update the API contract before wiring UI.
3. Implement backend behavior first when the data model, authorization, or response shape is unclear.
4. Add typed frontend services, query keys, query/mutation hooks, then screens.
5. Add loading, cached-refresh, empty, error, permission-denied, retry, and disabled-submit states.
6. Verify with typecheck/tests and a visual/manual pass for the affected workflow.
7. Update implementation status, checkpoint, and task logs.

## UI/UX Baseline

- Build the actual workflow as the first screen; avoid marketing/landing-page composition for apps and tools.
- Favor dense but calm operational layouts that are easy to scan repeatedly.
- Use cards only for repeated entities, modals, and framed tools. Avoid cards inside cards.
- Keep one clear primary action per screen. Make secondary and destructive actions visually subordinate.
- Every API-backed screen needs first-load loading, cached revisit rendering where useful, empty, error, retry, and permission-denied states.
- Empty states should suggest the next useful action.
- Destructive actions need confirmation or undo.
- Touch targets should be at least 44x44 pt. Icon-only buttons need accessible labels/hints.
- Do not communicate status by color alone; pair color with icon/text.
- Keep user-facing copy localization-ready and out of business logic.

## Design System

- Centralize color, typography, radius, spacing, shadows/elevation, z-index, and semantic state tokens.
- Use semantic color names: background, surface, surfaceMuted, ink, muted, border, primary, accent, success, danger.
- Support light and dark mode from the beginning when the product expects both.
- Use a predictable spacing rhythm such as 4/8/12/16/24/32.
- Use one icon family. Prefer vector icons, not emoji, for structural UI.
- Use tabular numbers for money, dates, counters, and timers.
- Keep route screens thin; reusable surfaces/components live in shared `components/`, feature-specific UI in `features/*/components`.

## Animation

- Animate transform and opacity; avoid animating width, height, top, left, or layout-heavy properties.
- Keep micro-interactions around 150-300ms. Use spring motion for physical UI feedback.
- Stagger lists subtly, roughly 25-50ms per item.
- Use reduced-motion fallbacks for splash, background, tab, list, and gesture animations.
- Animations must explain cause and effect: press feedback, screen hierarchy, reveal, dismissal, loading, or state change.
- Do not block user input while animation runs.
- For React Native, prefer Reanimated shared values, derived values, layout transitions, and Gesture Handler for gesture-driven UI.

## Forms

- Complex forms must use React Hook Form or TanStack Form with Zod/Yup validation.
- Infer form data types from the schema.
- Split form implementation into schema, defaults, UI fields, submit transform, and mutation handler.
- Use visible labels, field-local errors, helper text for complex fields, and semantic keyboard/input types.
- Validate on blur or submit; avoid noisy validation on every keystroke unless the field requires it.
- Disable submit while a mutation is pending.
- Auto-focus or visibly identify the first invalid field when practical.
- Long or destructive forms should protect unsaved changes.

## Native Date And Time Inputs

- Use native date/time controls instead of hand-rolled date pickers when practical.
- Android can use imperative native dialogs; iOS can use a sheet/modal picker with Cancel/Done.
- Keep a single reusable `DateInput`, `TimeInput`, or `DateTimeField` abstraction.
- Store dates in explicit formats at boundaries. Use ISO UTC strings for API payloads unless the domain needs local dates.
- Display dates/times through localization-aware formatters.
- Support min/max dates, clearable values, disabled state, accessibility labels, and error state.

## API Client And Query Layer

- All JSON API responses should use a success/error envelope:

```json
{ "success": true, "data": {} }
```

```json
{ "success": false, "code": "VALIDATION_ERROR", "message": "Please check the highlighted fields.", "details": {} }
```

- Pagination should return `data` plus `meta.pagination`.
- Frontend components must not call `fetch`, `axios`, or backend URLs directly.
- Use a centralized API client that unwraps envelopes, attaches auth/language headers, normalizes errors, and handles network failures.
- Use single-flight refresh-token handling so concurrent 401 responses share one refresh attempt.
- Keep typed feature services in `features/*/services`.
- Use TanStack Query for server state and a centralized query-key factory.
- Mutations must invalidate/refetch all related query keys.
- Use cached data during revisit/refetch where it improves perceived speed.

## Auth And Secure Storage

- Access tokens should be short-lived.
- Refresh tokens must rotate, be hashed at rest on the backend, and be revocable.
- Mobile tokens should use SecureStore/keychain-style storage with a safe fallback only when required by platform constraints.
- Auth/session bootstrap should gate protected routes without flashing private screens.
- Preserve intended return paths across login/signup when deep links require auth.

## Notifications And Firebase

- Push setup must not block normal app usage if permissions, native runtime, or provider credentials are unavailable.
- Ask notification permission in context, not on first launch by default.
- Register device tokens through a backend endpoint with provider, platform, and locale.
- For Firebase, mobile may use Expo Notifications for permissions/device behavior and React Native Firebase Messaging for FCM tokens where needed.
- Backend push delivery should use provider boundaries, chunk sends, serialize data payloads to strings, and disable invalid/stale tokens.
- Keep in-app notifications/inbox separate from OS push delivery. Backend events should create durable notification records first, then optionally send push.

## Documents, Files, And Media

- Use a two-step upload flow: backend creates an upload target, mobile uploads bytes, then mobile creates/links metadata.
- Support local development storage and production object storage through the same upload-target shape.
- Validate MIME type, byte size, storage key ownership, and resource permission on the backend.
- Prevent path traversal in local storage.
- Use DocumentPicker/ImagePicker for file selection and FileSystem upload for `file://` or `content://` URIs when needed.
- Separate attachments from domain metadata so files can link to activities, expenses, users, or other resources.
- Provide preview/download/share affordances when the platform supports them.

## OCR And Review-First Extraction

- Treat OCR/AI/rule extraction as draft creation, never automatic final mutation.
- Prefer on-device OCR for images when it improves privacy, speed, or offline behavior.
- Parse extracted text into a draft with confidence, warnings, raw text/version metadata, and editable fields.
- Require a user review/confirm action before creating real domain records.
- Keep parser/provider boundaries replaceable: mock, local rules, ML provider, or external AI provider.

## Backend Production API

- Use controller/service/repository layering.
- Controllers orchestrate HTTP only. Services own business logic. Repositories own database access.
- Validate body, query, params, and headers. Whitelist allowed fields and reject unknown body fields.
- Use global response interceptors and global exception filters.
- Do not return ORM entities directly; map to response DTOs.
- Enforce resource/object-level authorization in services or policy guards.
- Never trust `userId`, role, entitlement, currency, ownership, or permission values from the client.
- Use migrations for schema changes and transactions for multi-step write flows.
- Add indexes for common lookup, ownership, status, and pagination fields.
- Add CORS allowlists, Helmet/security headers, request size limits, rate limiting, request IDs, structured latency logging, health checks, and startup env validation.
- Add OpenAPI/Swagger or another generated contract artifact for routes consumed by clients.

## i18n, Currency, And Formatting

- Send language headers from the client and localize API error messages through stable error codes.
- Keep user-facing strings in translation files.
- Use locale-aware date, time, currency, and number formatting.
- Store money in minor units where possible. Track currency explicitly per resource when multi-currency is possible.
- Use tabular figures for money and time in UI.

## Offline And Cache Behavior

- Show explicit network failure states with retry.
- Use cached read-only revisit data for important screens where stale data is acceptable.
- Offline writes need an outbox/queue, idempotency keys, retry policy, conflict behavior, and user-visible sync state.
- Do not clear local draft/offline data until the backend confirms success.

## Verification Checklist

- API contract is documented and matches frontend service types.
- No route component calls backend APIs directly.
- Form schema exists and submitted type is inferred from it.
- Loading, empty, error, retry, disabled-submit, and permission states exist.
- Mutation invalidates the right query keys.
- Backend DTO rejects unknown fields.
- Authorization checks the actual resource owner/member/permission.
- Files validate MIME, size, ownership, and storage key.
- Push/OCR/file/provider failures do not block unrelated app usage.
- i18n, dates, money, and accessibility labels are covered.
- Typecheck/tests/build and a visual/manual workflow pass were run or explicitly noted as pending.
