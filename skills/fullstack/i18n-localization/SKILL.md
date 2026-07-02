---
name: i18n-localization-skill
description: Use when adding, reviewing, or refactoring localization, VI/EN or multi-locale translations, localized API errors, language headers, legal copy, currency/date/number formatting, translation files, accessibility labels, localization-ready UI copy, and multilingual mobile/backend behavior.
---

# i18n Localization Skill

Use this skill whenever user-facing text, API errors, legal copy, dates, numbers, money, or accessibility labels change.

## When To Apply

Use for:

- New screens/components with text.
- API error messages.
- Legal/terms/privacy content.
- Date/time/money formatting.
- Form labels, placeholders, helper text, validation messages.
- Toasts, empty states, loading/error states.
- Accessibility labels/hints.
- Language switchers or locale persistence.

## Frontend Rules

- User-facing strings live in translation files.
- Do not hard-code copy in route screens except temporary placeholders.
- Avoid building sentences by concatenating translated fragments.
- Keep translation keys stable and scoped by feature.
- Include accessibility labels and hints in translation files.
- Include empty/loading/error/permission copy, not just happy-path labels.
- Use locale-aware date/time/number/currency helpers.
- Send language headers through the API client.

## Backend Rules

- API errors use stable machine-readable codes.
- Backend maps error codes to localized messages by request language.
- Validation errors should expose field details in a stable, safe shape.
- API docs/descriptions can be localized if useful.
- Legal documents should include language and version metadata.
- Store legal consent with document type, version, language, source, timestamp, and optional request metadata.

## Language Resolution

Recommended order:

1. Explicit user setting.
2. Request header from client.
3. Device/browser locale.
4. App default.

Rules:

- Normalize language tags.
- Fall back gracefully for missing keys.
- Avoid crashing on unsupported language.
- Keep server and client supported language lists aligned.

## Formatting

Dates/times:

- Use locale-aware formatting.
- Decide 12h/24h behavior.
- Do not use locale display strings as API payloads.

Money:

- Store amounts in minor units when practical.
- Track currency explicitly.
- Use currency-specific minor units for parsing and display.
- Use tabular figures in UI.

Numbers:

- Use locale helpers for decimal/grouping.
- Avoid hand-parsing user input without locale strategy.

## Validation Messages

- Schema validation messages should be localized.
- Backend validation codes should map to user-friendly copy.
- Field-specific messages stay near fields.
- Global API errors go through normalized notification helpers.

## Layout And Copy

- Text expansion can break layouts; design for longer strings.
- Avoid fixed-width text containers when translations vary.
- Buttons should handle longer labels or wrap gracefully.
- Avoid tiny fonts to fit translated copy.
- Keep tone consistent across locales.

## Legal Content

- Legal text can be backend-served HTML/Markdown if versioned.
- Signup/consent flows should record exact version/language accepted.
- If scroll-to-end acceptance is required, do not hide the requirement.
- Legal review in profile/settings should display current accepted or latest version clearly.

## Review Checklist

- New copy exists for all supported locales.
- Accessibility labels/hints are localized.
- API error code has translations.
- Language headers are sent by client.
- Backend resolves language consistently.
- Dates/money/numbers use locale helpers.
- Legal text has version/language if consent matters.
- UI survives longer translated strings.
