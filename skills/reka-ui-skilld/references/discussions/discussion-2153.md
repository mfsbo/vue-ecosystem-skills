---
number: 2153
title: "Animating \"side\" and \"transform-origin\" with Motion"
category: Q&A
created: 2025-09-09
url: "https://github.com/unovue/reka-ui/discussions/2153"
upvotes: 1
comments: 1
answered: false
---

# Animating "side" and "transform-origin" with Motion

I have a tooltip transition with Motion, but I'm not sure how to handle the "side" properly.

I'm currently doing

```ts
const side = computed<PopperSide>(() => attrs['data-side'] as PopperSide)
```

But it can be flipped if there's not enough space, so the initial value might be incorrect. How can I handle this properly? I tried using `@placed` and rendering the animation like this:

```html
<Motion
    v-if="isPlaced"
    :initial="{
      opacity: 0,
      ...transform(side),
    }"
    :animate="{
      opacity: 1,
      transform: 'translate(0, 0) scale(1)',
    }"
    :exit="{
      opacity: 0,
      ...transform(side),
    }"
    :transition=" {
      duration: 1,
      type: 'spring',
      bounce: 0,
    }"
    class="origin-(--reka-tooltip-content-transform-origin)"
  >
    <slot />
  </Motion>

  <div
    v-else
    class="opacity-0"
  >
    <slot />
  </div>
```...

---

## Top Comments

**@wouterlms**:

The transform origin only seems to be off by 20px when using `scale` in the animation, e.g. `scale(0.5)`. Doesn't matter what the width of the tooltip is, or what scale I use it's always 20px. If I remove `v-if="placed"` it's correct