---
number: 1464
title: How to format the tooltip with variables?
category: General
created: 2024-07-29
url: "https://github.com/orgs/formkit/discussions/1464"
upvotes: 1
comments: 0
answered: false
---

# How to format the tooltip with variables?

Can you also use other variables besides `value` and `handle` to format the tooltip
`:tooltip-format="(value, handle) => (handle === 'min' ? '👉' : '👈')"`

I would like to do something like
```
"tooltip-format": (value: number, suffix: string) => `${value} ${suffix}`
```
