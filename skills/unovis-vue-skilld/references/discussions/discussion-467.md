---
number: 467
title: How to show last item of X axis?
category: Q&A
created: 2024-10-21
url: "https://github.com/f5/unovis/discussions/467"
upvotes: 1
comments: 1
answered: true
---

# How to show last item of X axis?

Hello, in my graph I need to always show last date on X axis. What's the best way to do that? I am using vue.



I tried to set tick values explicitly but it just disappears.

```
:tick-values="[data?.[0]?.[index], data?.[data.length - 1]?.[index]]"
```


---

## Accepted Answer

Setting `tickValues` explicitly should do the job. Check out the docks here https://unovis.dev/docs/auxiliary/Axis#set-ticks-explicitly