---
number: 6537
title: Microdata on html element
category: Q&A
created: 2026-01-28
url: "https://github.com/TanStack/router/discussions/6537"
upvotes: 1
comments: 0
answered: false
---

# Microdata on html element

I currently change the head with something like this

```ts
head: () => ({
    meta: [
      {
        title: 'FAQ - App',
      },
    ],
```

Setting `lang` here works currently and sets it on the html element.
but when using `itemscope` and `itemtype` it creates a meta element, which doesn't make much sense.

Is there any way to set Microdata for the html element?