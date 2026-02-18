---
number: 927
title: Multiple Virtualized Lists in Shared Scroll Container Issue
category: Q&A
created: 2025-02-13
url: "https://github.com/TanStack/virtual/discussions/927"
upvotes: 1
comments: 1
answered: true
---

# Multiple Virtualized Lists in Shared Scroll Container Issue

I'm working with `@tanstack/react-virtual` and running into a challenge with multiple virtualized lists in a shared scroll container. I'm trying to create a listbox-like component with sections, each using `useVirtualizer`, all within the same scroll area.

My current approach involves a context to share the scroll parent ref between the virtualized sections.

I tried adjusting the `scrollMargin` as pointed here but still no luck :/

Here's a simplified example demonstrating the issue: https://stackblitz.com/edit/sb1-zjvjhxge



Any guidance or examples would be greatly appreciated.

---

## Accepted Answer

My bad, just checked once again the documentation of https://tanstack.com/virtual/latest/docs/api/virtualizer#scrollmargin and the description is clear.

Here's the fixed version of my example https://stackblitz.com/edit/sb1-dhlx1rkx