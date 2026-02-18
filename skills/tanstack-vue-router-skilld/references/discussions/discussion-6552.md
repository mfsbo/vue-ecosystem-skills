---
number: 6552
title: Is there any way to have an offset for hash scrolling?
category: Q&A
created: 2026-01-30
url: "https://github.com/TanStack/router/discussions/6552"
upvotes: 1
comments: 1
answered: true
---

# Is there any way to have an offset for hash scrolling?

I would like to offset the scroll to hash by approximately the size of my sticky header, but couldn't seem to find a solution for this here. Is there some sort of configuration that I have missed or is there some sort of CSS solution to this?

---

## Accepted Answer

yeah scroll-padding-top is one of those CSS properties that flew under the radar for years while everyone was writing JS scroll offset hacks. works great with sticky headers since the browser handles the math natively. mind marking this as answered so it shows up for others with the same setup?