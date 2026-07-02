---
name: document-upload-skill
description: Use when implementing document pickers, attachment uploads, file metadata, local or S3 upload targets, preview/download URLs, FileSystem upload, DocumentPicker, file validation, and resource-linked documents.
---

# Document Upload Skill

Use a two-step upload flow for production file handling.

## Flow

1. Mobile picks a file with DocumentPicker or another platform picker.
2. Mobile asks backend for an upload target.
3. Mobile uploads bytes to the target.
4. Mobile creates or links metadata through the API.
5. Backend returns document/attachment response DTOs.

## Mobile Rules

- Use DocumentPicker with an explicit MIME allowlist.
- Copy to cache when the platform requires stable local access.
- For `file://` or `content://`, use FileSystem upload when fetch/blob is unreliable.
- For web/blob-compatible URIs, fetch the file and upload the blob.
- Show selected file name, MIME type, size, clear action, and upload errors.
- Keep attachment upload separate from domain metadata forms.

## Backend Rules

- Support local development storage and production object storage through one upload-target shape.
- Validate MIME type, byte size, ownership, permissions, and storage key prefix.
- Prevent path traversal in local storage.
- For S3-compatible storage, use signed PUT/GET URLs and short expirations.
- For local storage, write only under a controlled root and serve through a safe static route.

## Checklist

- File type and size are validated on both sides.
- Storage key is scoped to the owning resource.
- Upload target expires.
- Metadata creation verifies the uploaded/linked attachment.
- Preview/download URL flow exists where useful.
