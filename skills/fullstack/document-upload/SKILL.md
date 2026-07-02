---
name: document-upload-skill
description: Use when implementing, reviewing, or refactoring document pickers, attachments, upload targets, local or S3-compatible storage, file metadata, preview/download URLs, FileSystem upload, DocumentPicker, backend MIME/size validation, and resource-linked documents.
---

# Document Upload Skill

Use this skill for production document and attachment workflows. Keep file bytes, upload targets, and domain metadata separate.

## When To Apply

Use for:

- DocumentPicker flows.
- PDFs, Office files, CSV, text, image attachments, receipts, tickets, bookings, proofs, exports.
- Local development storage and production object storage.
- Signed upload/download URLs.
- File metadata linked to domain resources.
- Preview, download, share, open-in-place, or delete file features.

## Production Flow

Use a two-step or three-step upload flow:

1. Pick a file on the client.
2. Ask backend for an upload target.
3. Upload bytes to target.
4. Create or link metadata through backend.
5. Display the resulting attachment/document record.

Why:

- Backend controls validation, ownership, storage key, and expiration.
- Mobile avoids sending large files through JSON endpoints.
- Local storage and S3 can share one client contract.

## Client File Shape

Normalize picker output into one shape:

```ts
type PickedFile = {
  name: string;
  uri: string;
  mimeType: string;
  size: number;
};
```

Rules:

- Infer MIME type from picker when available, then file extension fallback.
- Never trust extension alone for backend validation.
- Show file name, MIME type, approximate size, clear/replace action.
- Keep file state separate from form values unless the file itself is the form value.

## Picker Rules

- Use an explicit MIME allowlist.
- Use `copyToCacheDirectory` if the platform needs a stable URI.
- Support single vs multiple intentionally.
- Handle cancel as no-op.
- Handle provider-specific missing size/name gracefully.
- For camera/gallery image files, coordinate with `mobile-file-media-skill`.

## Upload Rules

- For `file://` or `content://` URIs, use a native file upload path when fetch/blob is unreliable.
- For web/blob-compatible URIs, fetch the file and upload the blob.
- For local dev storage that requires auth, attach auth/language headers.
- For signed S3 upload URLs, send only required signed headers.
- Treat upload failure as recoverable; let the user retry or choose another file.
- Do not create final metadata unless byte upload succeeded.

## Backend Upload Target

Target response should include:

- `storageKey`
- `uploadUrl`
- `uploadMethod`
- `headers`
- `expiresAt`
- `storageMode`
- `maxByteSize`
- optional `publicUrl`

Rules:

- Expire upload targets quickly.
- Scope storage key to the owning resource, such as `resources/<id>/uuid-file-name`.
- Sanitize file names.
- Keep local and object-storage targets shape-compatible.

## Backend Validation

Validate:

- Authenticated user.
- Resource membership/ownership/permission.
- MIME type allowlist.
- Byte size greater than zero and under max.
- Storage key belongs to resource.
- Linked resource IDs belong to the same parent.
- Metadata fields are trimmed and normalized.

Prevent:

- Path traversal in local storage.
- Client-provided public URL abuse.
- Linking attachment to unrelated resource.
- Uploading executable or unsupported content types.

## Storage Providers

Local dev:

- Write only under a controlled root.
- Resolve and verify final path starts with root.
- Serve through a controlled static route.
- Do not expose arbitrary filesystem paths.

S3-compatible:

- Use signed PUT and signed GET URLs.
- Support custom endpoint for S3-compatible providers.
- Keep credentials in env only.
- Prefer short-lived download URLs unless files are intentionally public.

## Metadata Model

Separate:

- `Attachment`: file bytes metadata: name, content type, byte size, storage key, provider, uploader, status.
- `Document` or domain record: title, document type, provider, confirmation code, notes, linked activity/expense/resource, optional attachment id.

This lets one file be uploaded before final domain metadata is confirmed.

## Preview/Download UX

- Show file type icon, file name, size, linked resource, and actions.
- Provide download/open/share when platform supports it.
- Use native Quick Look/system viewer when available.
- Use WebView only for safe supported formats and URLs.
- Give a fallback when preview is unsupported.

## Review Checklist

- Client uses explicit MIME allowlist.
- Backend validates MIME, size, storage key, and permission.
- Upload target expires.
- Local path traversal is impossible.
- Metadata creation checks linked resource ownership.
- Upload failure does not create final record.
- Preview/download/share paths handle unsupported files gracefully.
