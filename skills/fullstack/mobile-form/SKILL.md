---
name: mobile-form-skill
description: Use when creating or refactoring mobile forms, modal forms, validation schemas, submit flows, React Hook Form or TanStack Form integration, Zod/Yup validation, Controller fields, inline errors, loading states, and form accessibility.
---

# Mobile Form Skill

Use this for any form beyond a trivial one-field action.

## Rules

- Use React Hook Form or TanStack Form with Zod/Yup validation.
- Infer form value types from the schema.
- Split form logic into schema, defaults, UI fields, submit transform, and mutation handler.
- Keep validation in one place. Do not duplicate rules in UI and submit logic.
- Use visible labels. Placeholder-only labels are not enough.
- Show errors near the related field.
- Validate on blur or submit unless live validation is truly useful.
- Disable submit while a mutation is pending.
- Preserve or confirm before losing long-form drafts.
- Field-specific errors stay inline; global API errors go through centralized notifications.

## Modal Form Shape

- Use native/modal presentation appropriate for the platform.
- Wrap with keyboard-aware layout.
- Use `ScrollView` with `keyboardShouldPersistTaps="handled"`.
- Put Cancel/Close in a predictable top area.
- Keep submit action visible at the end or sticky when the form is long.

## Controller Pattern

- Use `Controller` for custom inputs.
- Pass `value`, `onChange`, `onBlur`, and `error` explicitly.
- Convert display strings to API payloads in a submit transform, not inside UI components.

## Checklist

- Schema exists and submitted type is inferred.
- Defaults reset correctly when editing/opening/closing.
- Submit is disabled/loading while pending.
- First invalid field is identifiable.
- API errors are normalized before display.
