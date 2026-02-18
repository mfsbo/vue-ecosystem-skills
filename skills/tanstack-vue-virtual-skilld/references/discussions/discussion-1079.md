---
number: 1079
title: How to integrate with storybook preview without rendering all the elements?
category: Q&A
created: 2025-11-14
url: "https://github.com/TanStack/virtual/discussions/1079"
upvotes: 1
comments: 1
answered: true
---

# How to integrate with storybook preview without rendering all the elements?

Virtualized list works normally when running vite, but rendering the same element in storybook, ALL elements in the list get rendered.

Might have something to do with storybook's rendering of components in an iframe, wondering if anyone else has had similar issues

---

## Accepted Answer

Ok never mind I had to move the tailwind styling from classes to style object to set the height and overflow properly