---
name: mobile-ui-ux-workspace-skill
description: Use when designing, implementing, reviewing, or refactoring mobile app screens that should feel like a polished workspace or operational tool. Covers complete screen states, information hierarchy, accessibility, touch ergonomics, design tokens, layout systems, navigation, cards/lists, empty/loading/error/permission states, visual consistency, production mobile UX, and design-system quality.
---

# Mobile UI/UX Workspace Skill

Use this skill when a mobile screen must help users repeatedly scan, compare, create, edit, coordinate, or act on real data. The target feeling is a calm production workspace, not a marketing page.

## When To Apply

Must use this skill for:

- New mobile screens or major screen redesigns.
- Workflows with lists, entities, forms, filters, tabs, dashboards, or detail pages.
- Navigation shell, tab bars, headers, action bars, modals, sheets, cards, and empty states.
- UI quality passes for accessibility, hierarchy, spacing, state coverage, or production polish.
- Design-token or component-library work.
- Cross-platform mobile/web layout decisions for Expo React Native.

Skip only when the task is pure backend, infra, or non-visual automation.

## Priority Matrix

| Priority | Category | Must Have | Avoid |
| --- | --- | --- | --- |
| 1 | Accessibility | labels, contrast, dynamic text, safe touch targets | icon-only mystery buttons, color-only status |
| 2 | Screen States | loading, cached, empty, error, retry, permission, disabled | blank screens, spinner-only long waits |
| 3 | Task Clarity | one main job, obvious next action | decorative hero layouts that hide workflow |
| 4 | Navigation | stable tabs/back behavior, deep-linkable key screens | overloaded nav, hidden primary routes |
| 5 | Layout | mobile-first, scan-friendly grouping | nested cards, cramped rows, horizontal overflow |
| 6 | Design Tokens | semantic color/type/spacing/radius | raw hex and random one-off shadows |
| 7 | Interaction | press feedback, confirmations, undo where useful | destructive one-tap actions |
| 8 | Performance | virtualized lists, stable row props, image optimization | heavy list rows, inline objects everywhere |
| 9 | Localization | translated copy, flexible layout | hard-coded strings, text overlap |
| 10 | Visual Polish | consistent icon style, elevation, rhythm | mixed styles, purely decorative effects |

## Product Posture

- Build the actual workflow as the first screen.
- For operational apps, prefer dense but calm information layouts over spacious editorial layouts.
- Show the thing the user came to inspect or change; do not bury it under brand copy.
- The first viewport should answer one of: what matters now, what changed, what do I owe/do/choose, what can I act on.
- If a screen is a workspace, use lists, sections, metrics, action rows, and detail panels instead of hero marketing composition.
- Avoid social-feed patterns unless the product's core job truly needs them.

## Information Hierarchy

- Use one clear primary action per screen.
- Secondary actions should be visually quieter.
- Destructive actions should be separated spatially and semantically.
- Keep important status and next action near the entity it affects.
- Put metadata in predictable places: title, subtitle/context, badges/chips, secondary row, trailing actions.
- Use compact section titles to orient, not oversized marketing headers inside app surfaces.
- For data-heavy screens, group by natural decision units: day, status, owner, category, due date, or priority.
- Keep repeated rows structurally consistent so users can scan differences quickly.

## Layout Rules

- Mobile-first. Design for one-handed scanning before tablet/desktop expansion.
- Use safe-area padding and reserve space for bottom tabs, floating bars, keyboards, and toast stacks.
- Avoid horizontal scrolling except for short chip filters or controlled carousels.
- Avoid nested scroll regions unless there is a very clear reason.
- Do not put cards inside cards.
- Use cards only for repeated entities, modals, and framed tools.
- Prefer unframed sections for page layout; use cards for individual objects.
- Keep row touch targets at least 44x44 pt.
- Add at least 8px gap between adjacent touch targets where practical.
- Preserve readable text at dynamic font sizes.

## Design Tokens

Centralize these tokens:

- Colors: `background`, `surface`, `surfaceMuted`, `ink`, `muted`, `subtle`, `border`, `primary`, `accent`, `success`, `danger`, `warning`, `scrim`, `shadow`.
- Type: `regular`, `medium`, `bold`, `display`, `mono`, and a compact font scale.
- Spacing: use a predictable rhythm such as `4/8/12/16/24/32`.
- Radius: small, medium, large, pill.
- Elevation/shadow: define a small scale; do not invent random shadows per component.
- Motion: durations/easing/spring presets.
- Z-index/layers: base, sticky header, overlay, modal, toast.

Rules:

- Feature screens should use tokens, not raw hex values.
- Dark mode must be designed, not inverted.
- Functional color needs icon/text backup.
- Use one icon family and one stroke style for structural icons.
- Use tabular figures for money, dates, timers, counters, and balances.

## Accessibility Rules

- Normal text contrast should meet WCAG AA where possible.
- Icon-only buttons need `accessibilityLabel`; complex controls need `accessibilityHint`.
- Interactive state should include selected/disabled/expanded where applicable.
- Do not remove focus rings or screen-reader semantics on web targets.
- Dynamic text should not overlap, clip critical content, or break buttons.
- Use visible labels for inputs; placeholders are not labels.
- Errors should be close to the field and announced where practical.
- Toasts should not steal focus; critical errors need a clear recovery path.
- Modals and multi-step flows need escape routes.
- Swipe/gesture actions must have visible alternatives.

## Screen State Rules

Every API-backed screen should intentionally handle:

- First load: skeleton or useful loading state.
- Cached revisit: show stale/cached data with subtle refresh where useful.
- Empty: explain what is missing and offer the next useful action.
- Error: show friendly message and retry.
- Permission denied: explain why access is blocked and how to recover.
- Offline/network failure: distinguish from validation/server errors.
- Mutation pending: disable conflicting actions and show progress.
- Success: concise confirmation through centralized feedback.

Avoid:

- Permanent blank surfaces.
- Full-screen spinners for data that can use skeletons.
- Toast-only field validation.
- Errors only at the top when a specific field failed.

## Navigation Rules

- Bottom tabs are for top-level destinations only.
- Keep bottom tabs to 5 or fewer items with both icon and label.
- Preserve back behavior and prior scroll/filter/input state where practical.
- Do not unexpectedly reset stacks or jump home.
- Key screens should be deep-linkable when they are shareable or notification targets.
- Primary actions should not hide inside overflow menus.
- Use modals/sheets for focused tasks, not as replacement for primary navigation.
- Large screens can adapt to sidebars, but hierarchy should remain equivalent.

## Component Rules

### Buttons

- One primary button per decision area.
- Disabled state should be visually and semantically disabled.
- Loading state should prevent double submit.
- Icon buttons need labels.
- Destructive buttons use danger semantics and confirmation when irreversible.

### Cards And Rows

- Cards represent objects; rows represent scanable object summaries.
- Keep row layout stable across loading/revisit states.
- Put status badges where the eye expects them.
- Use avatars/initials only when identity matters.
- Keep trailing actions predictable.

### Empty/Error/Skeleton

- Empty state = what is missing + why it matters + next action.
- Error state = what failed + retry/recovery.
- Skeleton should approximate final layout, not generic gray blocks everywhere.

### Toasts/Alerts

- Centralize toast calls through a notification helper.
- Use success/error/info variants.
- Auto-dismiss normal messages; keep errors slightly longer.
- Keep inline validation separate from global toast feedback.

## Workspace Patterns

Use these patterns for operational apps:

- Home/dashboard: "what matters now" summary, next action, compact metrics, recent activity.
- List: grouped sections, filter chips, empty state, cached revisit, pagination footer.
- Detail: context header, key facts, related items, actions, audit/activity area.
- Create/edit modal: short header, form sections, cancel, submit, disabled/pending state.
- Review flow: extracted/generated draft, warnings/confidence, edit, discard, confirm.
- Settings/profile: grouped preference sections, dangerous actions separated at bottom.

## Performance UX

- Use virtualized lists for large collections.
- Memoize row components where row count is high.
- Avoid inline objects/functions in hot list render paths.
- Use optimized image components and known dimensions.
- Reserve space for async media to avoid layout jump.
- Prefer cached revisit over refetch blanking.
- Keep press feedback under roughly 100ms.

## Implementation Shape

- Shared primitives: `components/ui/*`.
- Feature components: `features/<feature>/components/*`.
- Feature services/hooks: `features/<feature>/services`, `features/<feature>/hooks`.
- Route files compose; they should not hold API details, validation schemas, or heavy business logic.
- Screen copy should come from i18n files.
- Use theme hooks/tokens rather than importing raw constants everywhere when the app supports theme switching.

## Review Checklist

- First viewport communicates the screen's job.
- Primary action is obvious and singular.
- Loading, cached, empty, error, retry, permission, and disabled states exist.
- Touch targets and icon labels are accessible.
- Dynamic text/localization will not break layout.
- Cards are not nested.
- Feature UI uses tokens, not raw visual one-offs.
- Destructive actions are confirmed/undoable.
- Navigation/back behavior is predictable.
- Data-heavy lists are performant enough for expected scale.
