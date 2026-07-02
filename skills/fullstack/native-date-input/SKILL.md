---
name: native-date-input-skill
description: Use when implementing mobile date, time, date range, schedule, reminder, calendar, or booking inputs. Covers Android/iOS native picker abstraction, display formatting, API date boundaries, clearable values, min/max constraints, accessibility, and form integration.
---

# Native Date Input Skill

Use native date/time controls whenever practical.

## Rules

- Create one reusable `DateInput`, `TimeInput`, or `DateTimeField` abstraction.
- Android may use the imperative native dialog API.
- iOS may use a sheet/modal picker with Cancel and Done actions.
- Keep display format separate from API format.
- Use ISO UTC strings for API instants unless the domain requires local calendar dates.
- For local dates, document whether the value is timezone-free or normalized to UTC midnight.
- Support min/max dates, disabled state, clearable values, fallback values, errors, and form blur.
- Use locale-aware display formatting.
- Add accessibility label, hint, role, disabled state, and clear button label.

## Form Integration

- Store user-editable display strings only if the form needs them.
- Convert values in schema or submit transform.
- Validate date ranges in schema/business logic, not only in the UI.
- If start/end dates are linked, revalidate both when one changes.

## Checklist

- Android and iOS behavior are both defined.
- Boundary format is documented.
- Date ranges reject impossible values.
- Error and disabled states are visible.
- Clear action is accessible.
