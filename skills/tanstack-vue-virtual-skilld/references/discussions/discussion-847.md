---
number: 847
title: Static(not virtualized) items in scroll container placed before actual virtualized list
category: Q&A
created: 2024-10-05
url: "https://github.com/TanStack/virtual/discussions/847"
upvotes: 12
comments: 1
answered: true
---

# Static(not virtualized) items in scroll container placed before actual virtualized list

Hi everyone,
I'm trying to integrate virtualized dynamic grid into my project and I faced one issue which I don't know how to fix. According to my designs, I have couple static elements inside scrollable container, they are placed before actual virtualized list. So, this leades to the problem, when we scroll container, virtualized items starts dissapearing even they are still visible on the screen.
I tried different approaches, such as using some  scroll padding/margings, but it didn't help or even broke the layout more. May I missed something or you guys have any solutions on this? Thank you in advance

I have forked example from documentation and reproduced the problem I have, so you can have a look how it works
**To reproduce**: Just scroll container a bit to see items from virtualized list, then scroll a bit more and you will items dissapearing even they should be visible on screen.
See 75-77 lines in main.tsx, https://stackblitz.com/edit/tanstack-virtual-cxltrd?file=src%2Fmain.tsx

If this is an issue, I can raise it and will try to prepare pull request, as I anyway need it for my job

---

## Accepted Answer

**@piecyk** [maintainer]:

As mention in https://github.com/TanStack/virtual/discussions/856#discussioncomment-10955571 here we can use scrollMargin, this value informs where the list starts. 