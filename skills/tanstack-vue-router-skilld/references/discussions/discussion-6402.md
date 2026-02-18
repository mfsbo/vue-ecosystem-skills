---
number: 6402
title: Prerender data using SPA mode.
category: Q&A
created: 2026-01-17
url: "https://github.com/TanStack/router/discussions/6402"
upvotes: 2
comments: 1
answered: false
---

# Prerender data using SPA mode.

Hello,

I have some data heavy application, and I prerender:
- `/`
- `/page/$id`

If I access `page/1` directly, the app is blazing fast as the `loader` already prefetched all the required data via react-query prefetchInfiniteQuery etc at build time.
When I navigate from `/` to `page/1`, the cache is not utilized, though, so it's creepingly slow.

Is there some way with tanstack start to serve prerender data trough spa navigation?
I guess that would mean prerendering the data to json or sth and than inject/fetch it on navigation.

---

## Top Comments

**@schiller-manuel**:

have a look at https://tanstack.com/start/latest/docs/framework/react/guide/static-server-functions 