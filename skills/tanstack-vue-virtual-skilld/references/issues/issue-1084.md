---
number: 1084
title: Dynamic item sizes are not recalculated after reordering
type: other
state: open
created: 2025-12-01
url: "https://github.com/TanStack/virtual/issues/1084"
reactions: 6
comments: 2
---

# Dynamic item sizes are not recalculated after reordering

### Describe the bug

In a virtualized list using @tanstack/vue-virtual, reordering items with dynamic or varying sizes (e.g., different heights) does not trigger a recalculation of their cached measurements. As a result, the items retain their initial rendered dimensions post-reorder, leading to visual artifacts such as:

- Larger items being clipped or overflowing within the constrained space originally allocated to smaller items.
- Smaller items leaving empty gaps due to mismatched container sizes.

### Your minimal, reproducible example

https://stackblitz.com/edit/tanstack-virtual-xbv5kvkh?file=src%2FApp.vue

### Steps to reproduce

1. Click the Swap button
2. Look at the list's second and third items

### Expected behavior

After reordering, the virtualizer should re-measure and update the sizes for affected items

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

- Windows - Chrome - v.142.0.7444.61

### tanstack-virtual version

v3.13.12

### TypeScript version

v5.4.5

### Additional context

_No response_

### Terms & Code of Conduct

- [ ] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.