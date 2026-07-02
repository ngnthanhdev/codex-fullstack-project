---
name: mobile-ui-ux-workspace-skill
description: Use when designing or implementing mobile app screens that should feel like a polished workspace or operational tool. Covers complete screen states, layout hierarchy, accessibility, design tokens, card/list usage, touch ergonomics, empty/loading/error/permission states, and production mobile UX quality.
---

# Mobile UI/UX Workspace Skill

Use this for mobile screens where users repeatedly scan, compare, create, edit, and act on real data.

## Rules

- Build the actual workflow, not a marketing surface.
- Prioritize the user's next decision: what is happening, what needs attention, what can they do now.
- Use dense but calm layouts with clear grouping and hierarchy.
- Use cards only for repeated entities, modals, and framed tools. Do not nest cards.
- Give every screen one primary action. Secondary actions must be visually quieter.
- Use sections, lists, chips, badges, tabs, and bottom sheets for workflow density.
- Use semantic colors for status, but never rely on color alone.
- Every API-backed screen needs loading, cached refresh if useful, empty, error, retry, and permission-denied states.
- Empty states should explain what is missing and offer the next useful action.
- Destructive actions require confirmation or undo.
- Touch targets should be at least 44x44 pt. Icon-only controls need accessible labels.
- Text must support localization and dynamic sizing without overlapping.

## Design Tokens

- Centralize colors, type, spacing, radius, shadows/elevation, and z-index.
- Prefer semantic names: `background`, `surface`, `surfaceMuted`, `ink`, `muted`, `border`, `primary`, `accent`, `success`, `danger`.
- Use a consistent spacing rhythm such as `4/8/12/16/24/32`.
- Use one icon family for structural icons.
- Use tabular numbers for money, date, time, counters, and metrics.

## Implementation Shape

- Shared primitives: `components/ui/*`.
- Feature-specific UI: `features/<feature>/components/*`.
- Route files stay thin and compose feature hooks/components.
- Screen-level copy comes from i18n files, not inline business logic.

## Checklist

- Main task is visible in the first viewport.
- Loading, empty, error, retry, permission, and disabled states exist.
- Touch targets and labels are accessible.
- Content has enough bottom/safe-area padding.
- No cards inside cards.
- No hard-coded raw colors in feature screens when tokens exist.
