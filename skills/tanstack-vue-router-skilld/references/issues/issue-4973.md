---
number: 4973
title: Search Params as Actual State
type: other
state: open
created: 2025-08-16
url: "https://github.com/TanStack/router/issues/4973"
reactions: 12
comments: 6
---

# Search Params as Actual State

We tried to use TanStack Router search params as our primary global state. While the read story is great (`useSearch` + schema validation), the write and lifecycle aspects are too low-level. We ended up building a fairly involved layer to make search-params reliable, composable, and ergonomic. We’ve read "Search Params Are State" — we agree on the premise; the missing pieces are writes and cross-component coordination.

This issue proposes concrete primitives the router could provide to enable "search params as state" without userland workarounds.

### What exists today (and why it's not sufficient)

- Global encode/decode can be customized via `parseSearch`/`stringifySearch` (e.g., `parseSearchWith`, `stringifySearchWith`). This is helpful but applies globally, not per param.

```ts
const router = createRouter({
  routeTree,
  parseSearch: parseSearchWith((v) => v),
  stringifySearch: stringifySearchWith(String),
});
```

- Route-level `validateSearch` normalizes/validates incoming search values, but there’s no symmetric per-param encode on write.
- `navigate` supports a `mask` option to control visible URL segments, but masking is specified per navigation, not per param, and does not compose across components.

### Why the current API falls short

- **Last-write-wins within a render**: Multiple `navigate({ search: ... })` calls during the same render/commit will override each other; only the last one survives. Real apps routinely update different params from different components in the same render. We need deterministic, atomic batching across the tree. 
Repro (navigate last-write-wins vs functional updaters): CodeSandbox demo

...