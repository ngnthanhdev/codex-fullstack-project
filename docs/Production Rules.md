# Production Rules

These rules are the default production baseline for projects created from this template. Treat them as requirements unless the project documents make a deliberate exception.

## Production Baseline

### Critical

- Production auth must use refresh-token rotation and revocation before long-lived sessions ship.
- Production CORS must use an explicit origin allowlist.
- All API errors must use the standard response contract below.
- Secrets, access tokens, refresh tokens, private keys, database dumps, and production `.env` files must never be committed.

### High

- Complex mobile forms should not rely on duplicated local `useState` validation in route components.
- Mobile API calls must use a centralized client with response interceptors, refresh handling, request retry where safe, and centralized error normalization.
- Backend services must not access Prisma directly. Production modules must keep database access in repositories.
- Backend requests must have correlation IDs, structured HTTP latency logging, rate limiting, and security headers.

### Medium

- API success responses must be wrapped consistently.
- Backend environment variables must be documented and validated at startup.
- Mobile server state must be managed behind TanStack Query keys/mutations.
- Contract documentation must describe the production API envelope and auth token lifecycle.

### Low

- UI notification/toast patterns should go through a centralized notification abstraction.
- E2E and integration tests should be added once the first vertical slice is stable.

## Standard API Contract

All JSON API responses must follow one of these envelopes.

```json
{
  "success": true,
  "data": {}
}
```

```json
{
  "success": false,
  "code": "VALIDATION_ERROR",
  "message": "Please check the highlighted fields.",
  "details": {}
}
```

Pagination must use:

```json
{
  "success": true,
  "data": [],
  "meta": {
    "pagination": {
      "page": 1,
      "pageSize": 20,
      "total": 100,
      "totalPages": 5
    }
  }
}
```

Rules:

- Dates are ISO 8601 UTC strings.
- Do not expose stack traces, Prisma errors, framework names, password hashes, tokens, API keys, or sensitive PII.
- Backend owns authorization, persistence, account lifecycle, streak computation, and resource-level access checks.
- Mobile owns presentation, device storage, route guards, optimistic UI, and offline queues.

## Frontend Rules

- Complex forms must use React Hook Form or TanStack Form with Zod/Yup schema validation.
- Form data types must be inferred from schema.
- Keep each form split into schema, defaults, UI fields, and submit handler.
- Do not duplicate validation across UI and submit logic.
- Submit buttons must be disabled during submit/mutation to prevent double submit.
- API calls must go through service/query/mutation layers, never directly from components.
- Server state must use TanStack Query. Client-only UI state may use Zustand or Context.
- Cache keys must come from a centralized query-key factory.
- Mutations must invalidate/refetch related query keys.
- Normalize API errors before they reach UI components.
- UI must show loading, empty, and error states for user-visible async flows.
- Do not store access tokens in `localStorage`. Mobile may use SecureStore. Web should prefer httpOnly cookies.
- Do not hard-code secrets or environment-specific URLs outside `.env.example`.

## Backend Rules

- Use controller/service/repository layering. Controllers orchestrate HTTP only; services own business logic; repositories own database access.
- Validate all body, query, params, and headers. Reject unknown body fields.
- Use global exception filters and response interceptors.
- Separate authentication from authorization.
- Never trust `userId`, role, or entitlement values from the client.
- Enforce resource/object-level permissions in service or policy guards.
- Hash passwords with bcrypt or argon2. Never log or persist plain passwords.
- Refresh tokens must be rotated, hashed at rest, and revocable.
- Use CORS allowlists, Helmet security headers, request size limits, and rate limiting.
- Use database migrations for schema changes.
- Use transactions for multi-step write flows.
- Add indexes for common lookup fields.
- Do not return database entities directly.
- Add health checks before deployment automation.
- CI must run lint/format/typecheck/test/build before merge.

## Recommended Additions

- Add OpenAPI or another generated contract artifact for every backend route used by the mobile app.
- Prefer typed API clients or schema exports over manually duplicated request/response types.
- Add contract tests for the API envelope, auth lifecycle, and first critical vertical slice.
- Add accessibility checks for touch target size, screen reader labels, focus order, contrast, and text scaling.
- Add i18n rules early if the app targets more than one locale. Keep user-facing strings out of business logic.
- Add analytics through a typed event wrapper. Do not call analytics SDKs directly from route components or controllers.
- Add feature flags for risky releases, paid features, and migrations that may need gradual rollout.
- Add observability before launch: structured logs, request IDs, error tracking, and basic product metrics.
- Add privacy rules for data export, account deletion, retention windows, and sensitive-field redaction.
- Add migration safety rules: reversible migrations where possible, backup/restore notes, and a rollback plan.
- Add offline conflict rules for queued mobile mutations, idempotency keys, and retry behavior.
- Pin or review major dependency upgrades and document upgrade decisions in `docs/DECISIONS.md`.

## Code Review Checklist

- Form schema exists and the submitted type is inferred from it.
- Component has no direct `axios`, `fetch`, or Prisma calls.
- API errors are normalized and user-friendly.
- Mutation invalidates the right query keys.
- Route/controller contains no business logic.
- Request DTO rejects unknown fields and validates shape.
- Authorization checks the actual resource owner/permission.
- Tokens/secrets/passwords are never logged.
- New env vars are added to `.env.example` and startup validation.
- List endpoints are paginated.
- Tests or checks cover changed behavior.

## Reference Examples

### React Hook Form + Zod

```tsx
const registerSchema = z
  .object({
    username: z.string().trim().min(2),
    email: z.string().trim().email().transform((value) => value.toLowerCase()),
    password: z.string().min(8),
    confirmPassword: z.string().min(8),
  })
  .refine((value) => value.password === value.confirmPassword, {
    path: ["confirmPassword"],
    message: "Passwords must match",
  });

type RegisterFormValues = z.infer<typeof registerSchema>;

const form = useForm<RegisterFormValues>({
  resolver: zodResolver(registerSchema),
  defaultValues: registerDefaults,
  mode: "onBlur",
});
```

### Axios Refresh Queue

```ts
let refreshPromise: Promise<string | null> | null = null;

apiClient.interceptors.response.use(undefined, async (error) => {
  const originalRequest = error.config;
  if (error.response?.status !== 401 || originalRequest._retry) {
    return Promise.reject(normalizeApiError(error));
  }

  originalRequest._retry = true;
  refreshPromise ??= refreshAccessToken().finally(() => {
    refreshPromise = null;
  });

  const token = await refreshPromise;
  originalRequest.headers.Authorization = `Bearer ${token}`;
  return apiClient(originalRequest);
});
```

### TanStack Query Service Pattern

```ts
export const queryKeys = {
  me: ["user", "me"] as const,
};

export function useMeQuery() {
  return useQuery({
    queryKey: queryKeys.me,
    queryFn: userService.me,
  });
}

export function useLoginMutation() {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: authService.login,
    onSuccess: () => queryClient.invalidateQueries({ queryKey: queryKeys.me }),
  });
}
```

### Backend Validation Middleware

```ts
app.useGlobalPipes(
  new ValidationPipe({
    whitelist: true,
    forbidNonWhitelisted: true,
    transform: true,
  }),
);
```

### Global Error Handler

```ts
@Catch()
export class GlobalExceptionFilter implements ExceptionFilter {
  catch(error: unknown, host: ArgumentsHost) {
    const response = host.switchToHttp().getResponse<Response>();
    response.status(status).json({
      success: false,
      code,
      message,
      details,
    });
  }
}
```

### Auth + Authorization Middleware

```ts
@UseGuards(JwtAuthGuard)
@Patch(":id")
update(@Param("id") id: string, @CurrentUser() user: CurrentUser) {
  return this.habitsService.updateOwnedHabit({ habitId: id, userId: user.id });
}
```

### Rate Limit + CORS + Helmet

```ts
app.use(helmet());
app.enableCors({ origin: allowedOrigins, credentials: true });
app.use(json({ limit: "1mb" }));
```

### Standard API Response

```ts
return {
  success: true,
  data: user,
};
```
