---
name: react-native-animation-skill
description: Use when adding or refactoring React Native animations, Reanimated primitives, splash transitions, tab bar hide/show behavior, swipe rows, press feedback, list entry motion, gesture-driven UI, or reduced-motion support.
---

# React Native Animation Skill

Use this for motion that improves feedback, continuity, or perceived quality.

## Rules

- Animate transform and opacity. Avoid animating width, height, top, left, or expensive layout properties.
- Keep micro-interactions around 150-300ms.
- Prefer spring motion for touch feedback and spatial UI.
- List item entry can stagger by roughly 25-50ms.
- Animation must communicate cause/effect, not exist as decoration.
- User input must remain interruptible.
- Respect reduced motion for splash, background, tab bar, list, and gesture animations.

## Reanimated Patterns

- Use shared values for local animated state.
- Use derived values for computed animation state.
- Use animated styles instead of React state for fast-moving gesture/scroll animation.
- Use layout transitions for insert/remove/reorder polish when it does not harm performance.
- For gestures, prefer Gesture Handler/Reanimated-driven interactions.

## Common Primitives

- `AnimatedBlock`: section-level fade/translate entry plus layout transition.
- `AnimatedListItem`: lighter list entry stagger plus layout transition.
- `AnimatedPressable`: transform/opacity press feedback.
- Splash handoff: native splash -> short Reanimated transform/opacity transition -> app.
- Swipe row: use maintained Reanimated/Gesture Handler swipeable, plus visible action controls for accessibility.

## Checklist

- Uses transform/opacity only for motion.
- Has reduced-motion fallback.
- Does not block taps or navigation.
- Keeps safe-area and tab bar overlap in mind.
- Does not store scroll position in React state.
