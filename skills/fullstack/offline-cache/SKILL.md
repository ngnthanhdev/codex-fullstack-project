---
name: offline-cache-skill
description: Use when implementing, reviewing, or refactoring cached revisit data, offline packs, retry/network failure states, offline queues, sync mutations, stale data display, local persistence, optimistic updates, idempotency keys, or resilient mobile workflows for poor connectivity.
---

# Offline Cache Skill

Use this skill when a mobile workflow should remain useful on slow, flaky, or missing networks.

## When To Apply

Use for:

- Cached read screens.
- Offline packs or read-only snapshots.
- Retry and network-failure UI.
- Offline write queues.
- Optimistic updates.
- Revisit/cached TanStack Query behavior.
- File/upload retry states.
- Any travel, field, finance, logistics, or productivity workflow where connectivity is unreliable.

## Classify The Feature

Before coding, decide:

- Online-only: must have network; show clear network error.
- Cached-read: can show stale data but writes need network.
- Offline-draft: can collect input locally and submit later.
- Offline-write: can queue mutation and sync later.
- Realtime: can fall back to polling or cached read.

Document which one applies.

## Read Behavior

- First load: skeleton/loading.
- Revisit: show cached data while refetching when safe.
- Stale state: indicate if decisions depend on freshness.
- Error with cache: keep cached data visible and show non-blocking error.
- Error without cache: show full error state with retry.
- Empty state: distinguish true empty from failed load.

## Write Behavior

For online writes:

- Disable submit during mutation.
- Show retry on network failure.
- Do not clear form/draft until backend confirms.

For offline writes:

- Use an outbox/queue.
- Add idempotency keys or offline UUIDs.
- Track states: queued, syncing, failed, synced.
- Define conflict behavior.
- Sync in stable order when order matters.
- Retry with backoff.
- Let user retry or discard failed queued items.

## Local Storage Rules

- Scope cache by user id and resource id.
- Clear sensitive cache on logout.
- Version persisted cache schemas.
- Store only data needed for resilience.
- Avoid storing secrets in general-purpose storage.
- Keep file paths/URIs valid across app restarts when needed.

## TanStack Query Rules

- Server state belongs in Query.
- Query keys must include user/resource params.
- Use `staleTime` intentionally.
- Use cached data for display, not as source of truth for privileged writes.
- Mutations should invalidate/refetch after sync.
- Persist query data only for safe and useful resources.

## Offline Pack Pattern

An offline pack is a read-only snapshot for an important resource.

Include:

- Resource id.
- Version/timestamp.
- Core summary data.
- Critical related lists.
- Last successful sync time.

Use for:

- Today's plan.
- Important bookings/documents metadata.
- Open tasks.
- Latest messages preview.
- Current balances or read-only summaries.

Do not use for:

- Secret tokens.
- Highly sensitive content without encryption.
- Data that becomes dangerous when stale unless clearly labeled.

## Network Failure UX

- Say what failed and what the user can still do.
- Provide retry where practical.
- Keep cached content visible when safe.
- Use toast for non-blocking failures; use inline state for screen-blocking failures.
- Distinguish validation errors from network errors.

## Conflict Rules

Define per feature:

- Last write wins.
- Server wins.
- Client draft requires manual merge.
- Duplicate-safe by idempotency key.
- Reject and show recovery path.

Never silently drop local user input.

## Review Checklist

- Feature is classified as online-only, cached-read, offline-draft, offline-write, or realtime fallback.
- Loading/cached/stale/error/retry states exist.
- Local data is scoped and safe.
- Offline writes have idempotency keys.
- Failed sync has user recovery.
- Backend confirmation happens before destructive local cleanup.
- Logout clears sensitive local data.
