---
name: smart-bill-capture-skill
description: Use when building OCR, receipt scanning, smart bill capture, image-to-draft extraction, ML Kit text recognition, rule-based parsers, confidence/warning systems, or review-first creation flows for expenses or other records.
---

# Smart Bill Capture Skill

Use extraction only to create drafts. The user confirms before real records are created.

## Flow

1. User chooses camera, photo library, or file.
2. App extracts text using on-device OCR when possible.
3. Parser creates a draft with confidence, warnings, raw text, and parser version.
4. User reviews/edits the draft.
5. Confirm action creates the real domain record.

## OCR Rules

- Prefer on-device OCR for images when privacy, speed, or offline behavior matters.
- Skip OCR gracefully for unsupported platforms/files.
- Keep OCR module loaded dynamically if native-only.
- Preserve raw text for debugging or backend review when safe.

## Parser Rules

- Normalize text for accents/case.
- Detect currencies and localized number formats.
- Score amount candidates instead of trusting the first number.
- Treat low confidence and missing amount as warnings, not silent failures.
- Keep parser/provider replaceable: local rules, mock, backend provider, or external AI.

## UX Rules

- Label extracted output as a draft.
- Never auto-create a real expense or record.
- Show confidence/warnings and a clear review CTA.
- Let users reset and try another file.

## Checklist

- Unsupported files fail gracefully.
- Draft contains confidence and warnings.
- User can edit before confirm.
- Confirm is idempotent or protected from double submit.
