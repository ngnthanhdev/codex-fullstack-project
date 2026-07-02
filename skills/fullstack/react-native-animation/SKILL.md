---
name: react-native-animation-skill
description: Use when adding, reviewing, or refactoring React Native and Expo animations with Reanimated, Gesture Handler, animated splash screens, tab bar hide/show behavior, swipe rows, press feedback, list entry motion, loading states, shared layout transitions, scroll-linked UI, or reduced-motion support.
---

# React Native Animation Skill

Use this skill for motion that improves feedback, continuity, hierarchy, or perceived performance in a React Native/Expo app.

## When To Apply

Use for:

- Reanimated shared values, animated styles, layout transitions, or entering/exiting animations.
- Press feedback, gesture feedback, swipe rows, drag interactions, sheet/modal motion.
- Splash handoff, loading overlays, skeleton shimmer, list entry animation.
- Bottom tab hide/show on scroll, sticky headers, collapsing headers, or scroll-linked UI.
- Animation performance reviews.
- Reduced-motion support.

Skip for purely static UI unless motion behavior is part of the acceptance criteria.

## Priority Matrix

| Priority | Rule | Why |
| --- | --- | --- |
| 1 | Animate transform/opacity only | avoids layout recalculation and dropped frames |
| 2 | Keep motion meaningful | avoids decorative noise and user confusion |
| 3 | Respect reduced motion | accessibility and comfort |
| 4 | Use UI-thread gesture animation | keeps feedback responsive |
| 5 | Avoid React state for fast motion | prevents rerender jank |
| 6 | Keep animation interruptible | users can tap/scroll during motion |
| 7 | Stagger subtly | polish without delaying task completion |
| 8 | Preserve layout stability | no jumping or content shift |

## Core Rules

- Animate `transform` and `opacity`.
- Avoid animating `width`, `height`, `top`, `left`, `margin`, `padding`, or expensive layout properties.
- Keep micro-interactions around 150-300ms.
- Complex screen transitions should usually stay under 400ms.
- Exit animations should be shorter than enter animations.
- Motion must express cause/effect: press, reveal, dismiss, hierarchy, loading, refresh, success, failure.
- Do not block user input during animation.
- Do not use animation as decoration when static hierarchy would be clearer.
- Reduced-motion users should get static or simpler versions.

## Reanimated State Rules

- Shared values are animation state.
- Use `useAnimatedStyle` for visual mapping.
- Use `useDerivedValue` for values derived from other shared values.
- Use `useAnimatedReaction` only for side effects, not simple derived values.
- Use `.get()` / `.set()` style APIs when targeting React Compiler compatibility.
- Avoid updating React state from scroll/gesture frames.
- Use `runOnJS` only when a UI-thread worklet must call JS.

## Transform Patterns

Use these instead of layout animation:

- Expand/collapse: fixed container height + `scaleY`/opacity when acceptable, or layout transition for non-hot paths.
- Slide in/out: `translateX` or `translateY` + opacity.
- Press feedback: scale `0.96-0.99` + opacity/elevation change.
- Badge/toast appear: translate + opacity + slight scale.
- Tab indicator: translateX shared value.
- Pull/drag feedback: transform tracks gesture progress.

Avoid:

- Animating `height` on every frame in frequently used components.
- Animating `top`/`left` for moving objects.
- Measuring layout repeatedly to drive simple animations.

## Gesture Rules

- Gesture-driven visuals should update on the UI thread.
- Use Gesture Handler for tap/pan/swipe when the visual feedback matters.
- Store gesture state as shared values.
- Derive visual output from gesture progress.
- Provide non-gesture alternatives for critical actions.
- Avoid gesture conflicts with system back, scroll, and edge gestures.
- Use movement thresholds before starting drags to prevent accidental gestures.

## Press Feedback

Preferred pattern:

- `Gesture.Tap()` or an animated `Pressable`.
- Shared value `pressed` or `pressProgress`.
- `withTiming` into pressed state, `withSpring` back.
- Scale/opacity only.
- Call JS action with `runOnJS` when using gesture worklets.

Keep feedback visible within roughly 100ms.

## List Motion

- Use list entry animation only as polish, not as a blocking sequence.
- Stagger list items roughly 25-50ms.
- Keep each row animation short, around 180-260ms.
- Use layout transitions for insert/delete/reorder where it remains smooth.
- Disable or simplify list entry animation for very large lists if performance suffers.
- Use virtualization for large collections.
- Memoize expensive rows and avoid inline object props in hot render paths.

## Splash And Loading Motion

- Native splash should hand off quickly to app shell or short brand animation.
- Splash motion should use transform/opacity only.
- Provide reduced-motion fallback.
- Avoid long unskippable brand animation.
- Loading >300ms can show skeleton/progress.
- Loading >1s should show a clearer progress or contextual loading state.
- Blocking overlays should be reserved for destructive or app-wide operations.

## Scroll-Linked UI

- Do not store scroll position in React state.
- Use shared values for scroll progress.
- Use interpolation for hide/show, opacity, translate, and scale.
- Bottom tabs can hide after accumulated downward scroll and return on upward scroll.
- Keep hidden navigation inaccessible to screen readers if it is not interactable.
- Reserve bottom inset so content and toasts are not hidden behind floating bars.

## Swipe Rows

- Use maintained Reanimated/Gesture Handler swipeable components when practical.
- Swipe actions must have visible affordance or an alternate button.
- Destructive swipe actions require confirmation unless undo exists.
- Keep row height stable during swipe.
- Close other open rows when a new row opens if the UX would otherwise become cluttered.
- Use accessible labels for hidden actions.

## Modal And Sheet Motion

- Modal/sheet entry should preserve spatial logic: slide up from bottom, scale/fade from trigger, or platform-native modal.
- Provide obvious close/cancel.
- Confirm dismissal when unsaved form data would be lost.
- Keep background scrim purposeful, not decorative.
- Respect system gestures and safe areas.

## Reduced Motion

Use reduced motion to:

- Disable looping background motion.
- Remove parallax and large travel distance.
- Keep opacity-only or instant transitions for nonessential animation.
- Preserve functional feedback such as loading and pressed states in a simpler form.

React Native/Reanimated:

- Check platform or Reanimated reduced-motion APIs when available.
- Branch animation setup in `useEffect` or shared value initialization.

## Good Primitive Set

Create or reuse:

- `AnimatedBlock`: section-level enter + layout transition.
- `AnimatedListItem`: smaller list enter + layout transition.
- `AnimatedPressable`: reusable press scale/opacity.
- `AnimatedSkeleton`: subtle opacity repeat.
- `AnimatedSplash`: short transform/opacity handoff.
- `SwipeActionRow`: accessible swipe row with visible fallback.
- `ScrollAwareTabBar`: shared-value hide/show with safe-area awareness.

## Example Patterns

### Transform/Opacity Slide

```tsx
const style = useAnimatedStyle(() => ({
  opacity: withTiming(visible ? 1 : 0, { duration: 180 }),
  transform: [{ translateY: withTiming(visible ? 0 : 12, { duration: 180 }) }],
}));
```

### Derived Value

```tsx
const progress = useSharedValue(0);
const opacity = useDerivedValue(() => 1 - progress.get());
```

### Press Progress

```tsx
const pressed = useSharedValue(0);
const style = useAnimatedStyle(() => ({
  transform: [{ scale: 1 - pressed.get() * 0.04 }],
  opacity: 1 - pressed.get() * 0.12,
}));
```

### List Entry

```tsx
<Animated.View
  entering={FadeInUp.duration(220).delay(index * 35).springify().damping(19)}
  layout={LinearTransition.springify().damping(22)}
>
  {children}
</Animated.View>
```

## Anti-Patterns

- `setState` on every scroll frame.
- Long decorative loops on primary screens.
- Animating layout properties for common interactions.
- Press feedback that waits for JS work before showing.
- Gesture-only destructive actions.
- Motion that hides loading/error states.
- Tab bars or toasts overlapping content due to missing safe-area padding.
- Ignoring reduced motion.

## Review Checklist

- Animations use transform/opacity where possible.
- Shared values drive fast-changing visual state.
- Gesture animations run on UI thread when needed.
- Reduced-motion path exists.
- User input remains interruptible.
- List animations are short and do not hurt virtualization.
- Splash/loading states do not block longer than needed.
- Swipe actions have accessible alternatives.
- Safe-area and floating navigation overlap is handled.
