---
number: 153
title: TanStack Store vs. XState Store
category: General
created: 2024-12-26
url: "https://github.com/TanStack/store/discussions/153"
upvotes: 1
comments: 1
answered: false
---

# TanStack Store vs. XState Store

Theo made a video about XState Store a few days ago:
https://www.youtube.com/watch?v=Pmieyp75SrA
https://stately.ai/docs/xstate-store

TanStack Store has not been anywhere largely visible. What are the main differences and could TanStack Store be used in a same way as XState Store?

---

## Top Comments

**@ttsirkia**:

One of the biggest differences is that XState Store defines certain "centralized" actions to change the state of the store whereas TanStack Store gives `setState` to make any changes to the store.