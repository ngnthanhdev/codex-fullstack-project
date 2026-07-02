---
name: smart-bill-capture-skill
description: Use when building, reviewing, or refactoring OCR, receipt scanning, smart bill capture, image-to-draft extraction, on-device text recognition, rule-based parsers, confidence/warning systems, review-first creation flows, or expense/document extraction workflows.
---

# Smart Bill Capture Skill

Use this skill for OCR or rule/AI extraction that turns a file into an editable draft. Never create final domain records automatically from extraction output.

## When To Apply

Use for:

- Receipt/bill scanning.
- OCR from camera/photo/PDF/image.
- Expense draft extraction.
- Booking/document metadata extraction.
- Rule-based parsing from raw text.
- Review-first AI/OCR workflows.

## Golden Rule

Extraction creates a draft. User review creates the real record.

Do not skip review for money, legal, identity, booking, or destructive workflows.

## Flow

1. User chooses camera, photo library, or file.
2. App validates the file type enough to choose an extraction path.
3. OCR runs on device or backend/provider.
4. Parser creates a draft with extracted fields.
5. Draft includes confidence, warnings, raw text or trace metadata, parser/provider version.
6. User reviews and edits.
7. Confirm mutation creates the real record.
8. Discard/reset leaves no final domain record.

## OCR Rules

- Prefer on-device OCR for images when privacy, speed, cost, or offline behavior matters.
- Load native OCR modules dynamically if they are unavailable on web.
- Skip OCR gracefully for unsupported platform/file types.
- Preserve raw text when useful and safe.
- Keep OCR provider replaceable: local ML, backend provider, AI provider, mock.
- Do not block unrelated app usage if OCR fails.

## Parser Rules

- Normalize text for case, accents, spacing, and punctuation.
- Parse localized number formats: `1,234.56`, `1.234,56`, `1 234`, minor-unit currencies.
- Detect currency symbols and codes.
- Score candidates instead of trusting the first number.
- Prefer totals near total keywords.
- Ignore likely non-item lines: tax code, transaction id, phone, address, reference, subtotal, change, card info.
- Extract merchant/title when confidence is reasonable.
- Extract line items only when enough structure exists.
- Include parser version in the draft.

## Warning Rules

Create warnings for:

- Missing amount.
- Low confidence.
- Multiple possible totals.
- Unsupported currency.
- OCR returned no text.
- File type unsupported for local OCR.
- Parser found amount but no merchant/title.

Warnings should be visible in review UI.

## Draft Model

Recommended draft shape:

```ts
type ExtractedDraft = {
  id?: string;
  title?: string;
  merchant?: string;
  totalAmount?: number;
  currency?: string;
  date?: string;
  lineItems?: Array<{ label: string; amount?: number }>;
  confidence: number;
  warnings: string[];
  rawText?: string;
  parserVersion: string;
};
```

## UX Rules

- Label output as a draft.
- Show confidence/warnings in plain language.
- Let the user edit all important fields.
- Provide Try another, Discard, Review, Confirm.
- Do not hide missing required values.
- Confirm button should be disabled until required fields are valid.
- Keep extracted file name visible during review.

## Backend Rules

- Backend may store drafts separately from final records.
- Confirm endpoint should validate the draft belongs to user/resource.
- Confirm should be idempotent or protected from double submit.
- Final record creation should happen in a transaction.
- Store provider/parser metadata if it helps audit/debugging.

## Review Checklist

- Extraction cannot create final records directly.
- Unsupported files fail gracefully.
- Draft includes confidence and warnings.
- User can edit before confirm.
- Confirm validates permissions and required fields.
- Double confirm cannot create duplicates.
