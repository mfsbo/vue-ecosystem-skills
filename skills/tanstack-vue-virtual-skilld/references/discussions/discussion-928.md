---
number: 928
title: Does virtual list support dynamic data?
category: Q&A
created: 2025-02-16
url: "https://github.com/TanStack/virtual/discussions/928"
upvotes: 1
comments: 1
answered: false
---

# Does virtual list support dynamic data?

I am trying to build a search command palette. There could be hundreds of commands, the list to render is changing as the search term changes.
In the examples I see `count` is a fixed value passed into `useVirtualizer`, so I wonder when my data changes, do I have to always create a new virtualizer?

---

## Top Comments

**@piecyk** [maintainer]:

No, count can change, also check https://tanstack.com/virtual/latest/docs/api/virtualizer#getitemkey 