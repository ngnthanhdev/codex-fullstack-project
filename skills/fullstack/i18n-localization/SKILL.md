---
name: i18n-localization-skill
description: Use when adding localization, VI/EN translations, localized API errors, language headers, legal copy, currency/date/number formatting, translation files, localization-ready UI copy, or multilingual mobile/backend behavior.
---

# i18n Localization Skill

Use this whenever user-facing text, API errors, dates, numbers, money, or legal content changes.

## Frontend Rules

- Keep user-facing strings in translation files.
- Do not build sentences by concatenating translated fragments unless grammar is guaranteed.
- Use locale-aware date, time, number, and currency formatting.
- Pass language headers such as `Accept-Language` and `X-Language` through the API client.
- Components should receive already-localized labels or call a scoped translation helper.
- Keep placeholders, empty states, errors, and accessibility labels translated.

## Backend Rules

- Backend errors should use stable error codes.
- Map error codes to localized messages by request language.
- API docs/descriptions can be localized if the project needs it.
- Legal/terms/privacy content should carry language and version metadata.
- Store consent with language/version/source when legal acceptance matters.

## Formatting Rules

- Store money in minor units where practical.
- Track currency explicitly if multi-currency is possible.
- Use tabular numbers in the UI for money and time.
- Avoid hard-coded locale assumptions in parsing.

## Checklist

- New copy exists in all supported locales.
- API error code has translations.
- Date/money formatting uses locale helpers.
- Accessibility labels are translated.
- Legal/consent copy has versioning when required.
