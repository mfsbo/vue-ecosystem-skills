---
number: 382
title: Area Chart dotted background
category: Q&A
created: 2024-05-05
url: "https://github.com/f5/unovis/discussions/382"
upvotes: 1
comments: 1
answered: true
---

# Area Chart dotted background

i woud love to know how we can achieve something like this


i can set a div behind it, but that will be applied to the whole chart with its axis and all, but only want it to be behind the area component.

not sure if there's a way to do that! 

thank you!


---

## Accepted Answer

Hi @Flowko, we don't currently support dotted gridlines and it's not in our plans.

However, what you can do, is:
1. Specify the chart margins explicitly by setting `autoMargin` to `false`
2. Provide your exact margin values (e.g. `margin: { top: 10, bottom: 60, left: 125, right: 10 }`). This will pin your axes location.
3. Position your div behind the chart accordingly.