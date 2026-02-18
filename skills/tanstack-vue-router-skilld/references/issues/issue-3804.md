---
number: 3804
title: Page doesn't scroll to top after navigation
type: other
state: open
created: 2025-03-18
url: "https://github.com/TanStack/router/issues/3804"
reactions: 16
comments: 6
labels: "[information needed]"
---

# Page doesn't scroll to top after navigation

I'm still trying to create a minimum reproduction for this.

Current behaviour:

- By default scroll does not get reset to top after navigation
- Setting `scrollRestoration: true` doesn't works correctly with `router.history.back()`