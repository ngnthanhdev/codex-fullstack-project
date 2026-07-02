---
name: mobile-file-media-skill
description: Use when implementing, reviewing, or refactoring ImagePicker, camera, avatar uploads, proof image uploads, receipt photos, media permissions, MIME validation, image normalization, preview, sharing, mobile media workflows, and file/media UX.
---

# Mobile File Media Skill

Use this skill for camera, gallery, avatar, proof, receipt, identity, attachment, and media preview flows.

## When To Apply

Use for:

- `ImagePicker` or camera flows.
- Avatar/profile photo upload.
- Receipt/proof photo upload.
- Media permission prompts.
- HEIC/HEIF/JPEG/PNG/WebP handling.
- File preview/share/open actions.
- Any workflow where a user chooses or captures local media.

## Permission Rules

- Ask permission only when the user starts the action.
- Explain why access is needed near the trigger when the reason is not obvious.
- Permission denial should not break unrelated screen behavior.
- Offer a fallback: choose file instead of camera, paste URL, skip upload, or continue without media.
- Do not request camera/library permission on app launch unless the app is camera-first.

## Client File Shape

Normalize every picked/captured file:

```ts
type PickedMedia = {
  name: string;
  uri: string;
  mimeType: string;
  size: number;
  width?: number;
  height?: number;
};
```

Rules:

- Build a safe fallback name from URI or timestamp.
- Infer MIME from picker, extension, or known capture type.
- Use file size from picker when available.
- Treat missing file size as unknown and let backend validate if needed.

## Image Capture/Pick Rules

- Use explicit `mediaTypes`.
- Choose quality based on use case: avatar can be compressed; legal/proof documents may need higher quality.
- Consider cropping for avatars only if product wants it.
- Preserve original enough for proof/receipt workflows.
- Normalize HEIC/HEIF when backend or preview cannot support them.
- Avoid very large uploads; use image manipulation/compression when appropriate.

## Upload Integration

- Use `document-upload-skill` for upload target and metadata patterns.
- Keep byte upload separate from final domain mutation.
- Attach media to the resource owner: user, transaction, expense, trip, task, message, etc.
- Backend must verify ownership and allowed MIME.
- Do not trust client-provided URLs, names, or MIME type.

## Preview UX

- Show selected media before submit for consequential actions.
- Offer remove/replace.
- Use clear labels: Camera, Photo Library, File, Remove.
- Show upload progress or disabled-submit state.
- For proof/receipt flows, make review-before-submit explicit.
- For avatar flows, show current avatar and pending replacement.

## Sharing/Open Rules

- Check platform support before sharing/opening.
- Use native share sheets where appropriate.
- Provide fallback copy/download URL when share is unavailable.
- Avoid blocking the workflow if share fails.

## Backend Rules

- Validate content type and byte size.
- Store metadata needed for retrieval, audit, and ownership.
- Generate storage keys server-side.
- Scope keys by resource/user.
- Sanitize file names.
- Strip or avoid storing sensitive EXIF metadata if privacy requires it.

## Accessibility Rules

- Media action buttons need labels and hints.
- Preview images need meaningful alt/accessibility labels when content matters.
- Remove/replace buttons need clear destructive or secondary styling.
- Do not rely on thumbnail alone to communicate upload status.

## Review Checklist

- Permission request is contextual.
- Cancel and denial are handled.
- File shape is normalized.
- MIME/size validation exists on backend.
- Upload errors are recoverable.
- Preview/remove/replace states exist.
- Ownership is verified before linking media.
