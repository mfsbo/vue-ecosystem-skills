---
number: 241
title: Changes to React Nodes are not detected
type: other
state: closed
created: 2025-10-04
url: "https://github.com/TanStack/store/issues/241"
reactions: 0
comments: 1
---

# Changes to React Nodes are not detected

### Describe the bug

I have a use case where I store ReactNode items in the store. Different parts of the app register some informational elements and then they are all displayed in a single place in the root layout.

I encounter a problem during development (not sure if it matters but I am using Vite) where updates to any of the registered child components are not detected, which ends up not re-rendering them in the root layout. The same feature works when implementing it with React Context.

I am attaching a reproduction repo that contains `AppWithStore.tsx` and `AppWithContext.tsx` with the same feature implemented using both React Context and TanStack Store.



### Steps to Reproduce the Bug or Issue

...