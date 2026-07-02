---
name: native-date-input-skill
description: Use when implementing, reviewing, or refactoring mobile date, time, date range, reminder, calendar, schedule, booking, deadline, or timezone-sensitive inputs. Covers Android/iOS native picker abstraction, API date boundaries, display formatting, local date vs instant decisions, clearable values, min/max constraints, accessibility, and form integration.
---

# Native Date Input Skill

Use native platform date/time controls whenever practical. Do not hand-roll calendar/time pickers unless the product needs custom range visualization.

## When To Apply

Use for:

- Date, time, date range, reminder, deadline, booking, schedule, event, calendar, and timezone fields.
- Replacing text-only date entry.
- Bugs involving timezone drift, invalid ranges, or inconsistent display.
- Cross-platform Android/iOS date picker behavior.

## First Decision: What Kind Of Date?

Classify every date field before coding:

- Local calendar date: birthday, trip date, task due day. It should not shift by timezone.
- Local time of day: reminder at 08:00, activity start time without date.
- Instant: server event timestamp, notification sent time, createdAt.
- Date-time in a place: flight, activity, appointment, local schedule.
- Range: start/end date or start/end time.

Document the boundary format for the chosen type.

## Boundary Rules

- API instants use ISO 8601 UTC strings.
- Local calendar dates should use explicit `YYYY-MM-DD` or documented UTC-midnight normalization.
- Local time should use `HH:mm` where a date is not needed.
- Avoid passing locale display strings to APIs.
- Parse display strings only at UI boundaries.
- Backend validates impossible ranges even if UI prevents them.

## Component Shape

Create one reusable abstraction:

```text
DateTimeField
DateInput
TimeInput
DateRangeInput
```

Support:

- `label`
- `value`
- `onChange`
- `onBlur`
- `mode`
- `placeholder`
- `minimumDate`
- `maximumDate`
- `minuteInterval`
- `disabled`
- `clearable`
- `error`
- `displayText`
- `fallbackDate`

## Platform Behavior

Android:

- Use native imperative dialog when available.
- Handle `set` and `dismissed`.
- Call `onBlur` on dismissal.
- Use positive/negative button labels when supported.

iOS:

- Use a sheet/modal picker with Cancel and Done.
- Keep a temporary value while the sheet is open.
- Commit only on Done.
- Cancel should not mutate the field.

Web/fallback:

- Use the best available input or a controlled fallback.
- Keep formatting consistent with app helpers.

## Form Integration

- Use `Controller` for custom date/time fields.
- Trigger validation on blur and on dependent field changes.
- Date range fields should revalidate both start and end.
- When start changes past end, decide whether to auto-adjust end or show validation; document the product choice.
- Clear actions should mark field dirty and validate if relevant.

## Display Formatting

- Use locale-aware date/time formatting.
- Use 24-hour vs 12-hour rules based on product locale/settings.
- Use tabular numbers for times and compact date chips.
- Keep display text stable during refetch/edit flows.
- Use human labels like Today/Tomorrow only when they do not obscure exact dates.

## Validation Rules

- Reject invalid dates.
- Reject end before start.
- Enforce min/max if business rules require them.
- For reminders, reject past time when the reminder must be future-only.
- For ranges, handle same-day ranges explicitly.
- For all-day dates, avoid timezone drift.

## Accessibility Rules

- Pressable field has button role.
- Label describes the field, not just "Open picker".
- Hint explains date or time picker opening.
- Clear button has its own accessible label.
- Disabled state is exposed.
- Error text is visible and associated where practical.

## Review Checklist

- Date kind is classified.
- API boundary format is explicit.
- Android and iOS behavior are defined.
- Range validation exists on frontend and backend.
- Display uses locale helpers.
- Clear/disabled/error states exist.
- No locale display string is sent to the API.
