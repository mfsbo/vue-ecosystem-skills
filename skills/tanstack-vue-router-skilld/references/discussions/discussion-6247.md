---
number: 6247
title: TanStack Start is missing documentation on how to add TanStack Query
category: Q&A
created: 2025-12-29
url: "https://github.com/TanStack/router/discussions/6247"
upvotes: 3
comments: 0
answered: false
---

# TanStack Start is missing documentation on how to add TanStack Query

The title says it all. Adding TanStack Query isn't as straightforward as `pnpm add @tanstack/react-query`

First, you need to modify the `__root.tsx` and use `createRootRouteWithContext` passing down the `queryClient`. After that edit `router.tsx`, instantiate a `QueryClient`, and use the `setupRouterSsrQueryIntegration`.

To find this out, I had to dig into the example in the repository

https://tanstack.com/start/latest/docs/framework/react/examples/start-basic-react-query

Is there a tutorial in progress from the TanStack team, or can I contribute by adding documentation?