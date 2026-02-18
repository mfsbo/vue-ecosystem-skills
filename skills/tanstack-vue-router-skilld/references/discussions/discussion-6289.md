---
number: 6289
title: "Handling Stateful Auth in TanStack Start: Patterns for Header Forwarding"
category: Q&A
created: 2026-01-03
url: "https://github.com/TanStack/router/discussions/6289"
upvotes: 4
comments: 1
answered: false
---

# Handling Stateful Auth in TanStack Start: Patterns for Header Forwarding

The Issue: The "Double-Hop" When using TanStack Start with a stateful backend like Laravel Sanctum, authentication works perfectly on the client because the browser automatically attaches cookies and CSRF headers. However, when moving logic into a Server Function (e.g., for beforeLoad or createServerFn()), the request originates from the Start server, not the browser.

The backend API then sees a request from a "new" client and misses the context required for stateful auth:

1. Cookies are missing
2. XSRF-TOKEN headers are missing
3. Origin/Referer headers don't match allowed domains

The Current Workaround I am currently using an Axios interceptor that uses getRequestHeaders() from @tanstack/react-start/server to manually "proxy" these values from the incoming browser request to t...

---

## Top Comments

**@SeanCassiere** [maintainer]:

You might want to try giving `createIsomorphicFn` a shot.

https://tanstack.com/start/latest/docs/framework/react/guide/environment-functions#isomorphic-functions