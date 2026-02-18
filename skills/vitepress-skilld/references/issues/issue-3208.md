---
number: 3208
title: improve developer experience for default-empty 'headers' field in PageData
type: docs
state: open
created: 2023-11-14
url: "https://github.com/vuejs/vitepress/issues/3208"
reactions: 4
comments: 2
labels: "[docs, contribution welcome]"
---

# improve developer experience for default-empty 'headers' field in PageData

### Is your feature request related to a problem? Please describe.


`page.headers` as returned from `useData` was an empty array even though my document had headers defined. It took my some searching to understand that I needed to set the following config in order to populate it:

```js
  markdown: {
    headers: true,
  },
```

This issue – where the user had the same confusion – helped me understand: https://github.com/vuejs/vitepress/issues/2840#issuecomment-1691067613



### Describe the solution you'd like

Two things might help

1) add documentation which connects https://vitepress.dev/reference/runtime-api#usedata to https://vitepress.dev/reference/site-config
2) make `headers` optional, and don't include it when not enabled (`[]` vs `undefined`)



### Desc...