---
number: 1024
title: DOM nodes count keeps in Performance monitoring tab keeps growing
type: other
state: open
created: 2025-06-20
url: "https://github.com/TanStack/virtual/issues/1024"
reactions: 7
comments: 9
---

# DOM nodes count keeps in Performance monitoring tab keeps growing

### Describe the bug

I’ve been using this library to virtualise a grid, and while testing, I noticed that the DOM node count keeps increasing when monitoring via the Performance monitoring tab in Brave DevTools. 

At first, I assumed it might be an issue with my implementation, so I tested one of the official examples – specifically, the infinite scroll demo from the website.

Inspecting the Elements tab, it does appear that items are being mounted and unmounted correctly as I scroll. However, the total DOM node count continues to rise, which seems unexpected for a virtualised list.

I then wondered if the performance monitor might be counting some kind of 'virtual' or detached nodes, but to compare, I tried `react-virtuoso`. There, the node count rises initially as you scroll, but drops back down when items go out of view – which is the behaviour I would expect.

Is this increasing DOM node count an expected behaviour with TanStack Virtual, or could it be a memory leak or cleanup issue?

### Your minimal, reproducible example

https://stackblitz.com/github/tanstack/virtual/tree/main/examples/react/infinite-scroll?embed=1&theme=dark&preset=node&file=src/main.tsx

### Steps to reproduce

...