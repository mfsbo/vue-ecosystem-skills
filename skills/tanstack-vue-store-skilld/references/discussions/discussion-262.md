---
number: 262
title: Tanstack store, useSyncExternalStore and React concurrent mode
category: General
created: 2025-12-04
url: "https://github.com/TanStack/store/discussions/262"
upvotes: 1
comments: 0
answered: false
---

# Tanstack store, useSyncExternalStore and React concurrent mode

(Disclaimer: this is more like a rant about my experience)

I love Tanstack libraries, and Tanstack store is a great addition and fundamentals for other Tanstack libraries.

However the only problem I have with this library is that the implementation is framework agnostic - so it uses useSeS - and it breaks transition.

(https://blog.axlight.com/posts/why-use-sync-external-store-is-not-used-in-jotai/)

I could bare with this if I used this library directly to manage state in my service application since I can just use other libraries with transition support until React finally supports fully featured `useExternalStore`. But Store is the building block for other libraries such as Router or Form etc.

I heavily utilizes transition features in my code, but for example
- startTransi...