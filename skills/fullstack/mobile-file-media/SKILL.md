---
name: mobile-file-media-skill
description: Use when implementing ImagePicker, avatar uploads, proof image uploads, receipt photos, media permissions, MIME validation, image normalization, file preview, file sharing, or mobile media workflows.
---

# Mobile File Media Skill

Use this for camera, gallery, image upload, avatar, proof, receipt, and preview/share flows.

## Mobile Rules

- Request camera or media-library permission only when the user starts the related action.
- Permission denial should not break the rest of the screen.
- Capture or pick media with explicit media types and quality settings.
- Normalize file name, MIME type, size, and URI into one internal file shape.
- Validate allowed MIME types before upload when possible.
- Keep upload and metadata creation separate.
- Show preview or selected-file summary before submit when the action is consequential.
- Use platform share/open/quick-look APIs where useful, with graceful fallback.

## Backend Rules

- Validate MIME type and byte size again on the backend.
- Store only metadata needed for retrieval, audit, and ownership.
- Do not trust client-provided public URLs or storage keys without verification.
- Proof/receipt/avatar uploads should be scoped to the owning resource/user.

## UX Rules

- Explain why the app needs camera/library access.
- Use clear affordances: camera, photo library, file upload, remove/replace.
- Show upload progress or disabled-submit state for long operations.
- Destructive replacement/removal needs confirmation when data loss is possible.

## Checklist

- Permission flow is contextual.
- MIME and size validation exist.
- Upload errors are recoverable.
- Preview/share/open fallback exists where relevant.
- Backend verifies resource ownership.
