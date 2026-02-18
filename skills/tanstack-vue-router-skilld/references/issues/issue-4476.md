---
number: 4476
title: Tanstack Router (with Tanstack Query) throws CancelledError when navigating between pages
type: other
state: open
created: 2025-06-19
url: "https://github.com/TanStack/router/issues/4476"
reactions: 16
comments: 1
---

# Tanstack Router (with Tanstack Query) throws CancelledError when navigating between pages

### Which project does this relate to?

Router

### Describe the bug

By configuring the Router as below and using a `useQuery` hook on page 1 and a `fetchQuery` call in `beforeLoad` on page 2 (same key), navigating from page 1 to page 2 crashes with CancelledError.

- defaultPreload: “intent”
- defaultPendingComponent component is set (can make defaultPendingMs 0 so the error is more instant. but we can leave as default)
- added `if (preload) return;` in page 2 `beforeLoad` to “block” preloading (this isn't necessary to create the issue but it helps with the demo)

### Your Example Website or App

https://codesandbox.io/p/github/cirex-web/tanstack-router-cancellederror-demo/main

### Steps to Reproduce the Bug or Issue

1. Load home page (Observer gets mounted (by useQuery or useSuspenseQuery) with queryKey “key” on Page 1)
2. Wait until “key” goes stale
3. Navigate to Page 2, whose `beforeLoad` function calls queryClient.fetchQuery using the same queryKey “key”. queryFn accepts the abort signal argument.
4. If queryFn is slow, a CancelledError is thrown by the `fetchQuery` call with the stacktrace


(seems like this is caused by the page 1 observer unmounting)

If we move the `beforeLoad` code into `loader`, we get the same error. In fact, we don’t even need a pending component defined to get the error!


### Expected behavior

The fetch in either `beforeLoad` or `loader` should probably just work, irrespective of observers unmounting on the previous page.

### Screenshots or Videos

https://github.com/user-attachments/assets/bf0d73b8-6a0a-430e-900d-eb434ec8a778

### Platform

- OS: macOS
- Browser: Chrome
- Router Version: 1.121.24
- Query Version: 5.80.7


### Additional context

...