---
name: offline-cache-skill
description: Use when adding cached revisit data, offline packs, retry/network failure states, offline queues, sync mutations, stale data display, local persistence, or resilient mobile workflows for poor connectivity.
---

# Offline Cache Skill

Use this for mobile workflows that must remain useful on slow or unreliable networks.

## Read Behavior

- Show cached data during refetch when stale data is acceptable.
- First load needs skeleton/loading.
- Revisit load can show cached content plus subtle refresh state.
- Network failure should show a clear message and retry action.
- Mark data as offline/stale when that matters to user decisions.

## Write Behavior

- Offline writes need an outbox/queue, idempotency keys, retry policy, and conflict behavior.
- Never clear local draft/offline data until the backend confirms success.
- Mutations should be disabled or queued explicitly when the app is offline.
- Show sync state for queued, syncing, failed, and complete items.

## Local Storage

- Store only data needed for resilience.
- Scope local cache by user and resource id.
- Clear sensitive cache on logout where appropriate.
- Keep cache schema/version if stored data may evolve.

## Query Integration

- TanStack Query owns server state.
- Persist query data only where useful and safe.
- Mutations must invalidate/refetch affected keys after sync.

## Checklist

- Loading, cached, stale, offline, failed, retry, and sync states are visible.
- Queued writes are idempotent.
- Local data is scoped and cleared safely.
- Backend confirms before local destructive cleanup.
