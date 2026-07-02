---
name: mobile-form-skill
description: Use when creating, reviewing, or refactoring production mobile forms, modal forms, validation schemas, submit flows, React Hook Form or TanStack Form integration, Zod/Yup validation, Controller fields, inline errors, loading states, draft safety, and form accessibility.
---

# Mobile Form Skill

Use this skill for any form beyond a trivial one-field action. The goal is a form that is easy to complete, hard to submit incorrectly, and safe under poor network conditions.

## When To Apply

Use for:

- Login, signup, profile, settings, create/edit, checkout, booking, expense, task, document, invite, or search forms.
- Modal/page-sheet forms.
- Dynamic fields, segmented controls, chips, member pickers, date/time fields, money fields, file pickers, or split inputs.
- Validation refactors.
- API-backed submit flows.

## Priority Matrix

| Priority | Category | Must Have | Avoid |
| --- | --- | --- | --- |
| 1 | Validation source | one schema owns rules | duplicated UI and submit validation |
| 2 | Submit safety | pending/disabled state | double submit |
| 3 | Error clarity | field-local errors | vague toast-only failures |
| 4 | Accessibility | visible labels, hints, focus | placeholder-only labels |
| 5 | Data transform | submit transform | mutation receiving UI-only strings |
| 6 | Draft safety | reset/confirm behavior | losing unsaved user input |
| 7 | Keyboard UX | correct input types | awkward keyboards |
| 8 | Network UX | retry and normalized errors | raw backend errors |

## Architecture

Split every complex form into:

- `schema`: Zod/Yup validation with localized messages.
- `defaults`: create/edit default values.
- `form component`: visual fields and field layout.
- `submit transform`: convert form values to API input.
- `mutation handler`: calls service/mutation and handles success/error.
- `types`: inferred from schema.

Recommended folders:

```text
features/<feature>/
  schemas/<feature>-schema.ts
  components/<feature>-form-modal.tsx
  services/<feature>-service.ts
  hooks/use-<feature>-queries.ts
```

## Validation Rules

- Use React Hook Form or TanStack Form with Zod/Yup.
- Infer `FormValues` from schema.
- Validate on blur for most fields; validate on submit for final safety.
- Do not validate noisily on every keystroke unless it helps the field.
- Normalize strings in schema or submit transform: trim, lowercase email, remove empty optional values.
- Validate cross-field rules in schema: date ranges, password confirmation, exact split totals, min/max participants.
- Keep user-facing validation messages localized.
- Backend validation is still required; frontend validation is UX, not security.

## Field Rules

- Inputs need visible labels.
- Placeholders are examples, not labels.
- Errors appear under the related field.
- Helper text stays visible for complex fields.
- Required fields should be obvious.
- Use semantic keyboards: email, numeric, decimal, phone, URL.
- Password fields need show/hide when practical.
- Money/date/time/file fields should use dedicated reusable components.
- Picker/chip controls need selected state and accessibility state.
- Read-only state should differ from disabled state.

## Modal Form Rules

- Use platform-appropriate modal/page-sheet presentation.
- Include a clear Cancel/Close action.
- Use keyboard-aware layout.
- Use a scroll container with `keyboardShouldPersistTaps="handled"`.
- Keep bottom padding for safe area and floating tab bars.
- If the user changed data, confirm before dismissing long or costly forms.
- Avoid nested scroll regions inside form modals.

## Submit Rules

- Submit uses `handleSubmit`.
- Disable submit when invalid if that helps, and always when mutation is pending.
- Show pending state on the submit button.
- Prevent duplicate mutation calls.
- On success, invalidate related query keys and close/reset intentionally.
- On API error, map field errors to fields if possible; otherwise show a normalized global message.
- Never clear local/offline draft data until backend confirms success.

## Dynamic Forms

- Dynamic arrays need stable IDs.
- Add/remove controls must be accessible.
- When changing currency/unit/mode, reset incompatible dependent values intentionally.
- When toggling participants/options, revalidate dependent totals and constraints.
- Keep derived values visible: remaining total, equal share, calculated end time, selected count.

## File/Media Fields

- Treat picked files as form-adjacent state, not only plain text fields.
- Show file name, MIME type, size, clear/replace action.
- Validate allowed type and size before submit when possible.
- Keep upload pending state separate from final metadata submit if using two-step upload.

## Error Handling

- Field error = near the field.
- Form-level recoverable error = concise message with retry or fix guidance.
- Network error = explain connection issue, not "invalid input".
- Permission error = explain access issue.
- Server validation details should be normalized before UI.

## Accessibility Checklist

- Every field has a visible label.
- Custom controls expose role, label, selected/disabled state.
- Error text is reachable by screen readers where practical.
- Touch targets are at least 44x44 pt.
- Keyboard focus/order follows visual order.
- Submit remains reachable when keyboard is open.

## Review Checklist

- Schema exists and form value type is inferred.
- Defaults reset correctly for create/edit/open/close.
- Submit transform strips UI-only values.
- Submit is disabled/loading while pending.
- Errors are field-local when possible.
- API errors are normalized.
- Related query keys are invalidated on success.
- Unsaved long forms are protected.
