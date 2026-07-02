---
name: firebase-notification-skill
description: Use when adding push notifications, Firebase Cloud Messaging, Expo Notifications, notification inboxes, device token registration, backend Firebase Admin delivery, stale token cleanup, reminder/task notification flows, or notification permission UX.
---

# Firebase Notification Skill

Use this for durable in-app notifications and optional OS push delivery.

## Product Rules

- Keep in-app notification records separate from push delivery.
- Push setup must not block app usage if permissions, native runtime, or credentials are unavailable.
- Ask notification permission in context, not at first launch by default.
- Local/in-app feedback still goes through centralized toast/notification helpers.

## Mobile Rules

- Use Expo Notifications for permission/device behavior where appropriate.
- Use React Native Firebase Messaging for FCM tokens when needed by native iOS/Android delivery.
- Register tokens only for authenticated users.
- Send provider, platform, token, and locale to the backend.
- Avoid repeated registration for the same user/session.
- Catch push setup errors silently or report non-blocking diagnostics.

## Backend Rules

- Store push tokens with provider, platform, locale, enabled/disabled state, and user owner.
- Send notifications through a provider boundary.
- For Firebase Admin, initialize the app once with env-provided project id/client email/private key.
- Chunk multicast sends, commonly up to 500 tokens.
- Serialize data payload values to strings.
- Disable stale or invalid tokens on provider error codes.
- Return delivery stats for observability.

## Checklist

- Permission request is contextual.
- Token registration is idempotent enough for app startup.
- Invalid tokens are disabled.
- Push provider missing credentials does not crash.
- In-app notification record exists even if push fails.
