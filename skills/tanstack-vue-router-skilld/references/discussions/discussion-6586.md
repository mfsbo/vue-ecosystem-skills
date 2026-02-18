---
number: 6586
title: How to exclude a nested path from sitemap?
category: Q&A
created: 2026-02-03
url: "https://github.com/TanStack/router/discussions/6586"
upvotes: 1
comments: 0
answered: false
---

# How to exclude a nested path from sitemap?

I want to exclude everything under `/app` from the sitemap, is there any way to use a function or regex on the `path` property of `pages`?

```js
tanstackStart({
  prerender: {
    enabled: true,
    crawlLinks: false,
  },
  sitemap: {
    enabled: true,
    host: 'https://example.com',
  },
  pages: [
    {
      path: "/app/.*", // here, how can I exclude everything under `/app/`?
      sitemap: {
        exclude: true,
      },
    },
  ],
}),
```