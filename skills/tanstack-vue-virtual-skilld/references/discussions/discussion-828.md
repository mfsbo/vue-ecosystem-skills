---
number: 828
title: Reason to use `translateY(${virtualRow.start}px)`
category: Q&A
created: 2024-09-03
url: "https://github.com/TanStack/virtual/discussions/828"
upvotes: 1
comments: 2
answered: true
---

# Reason to use `translateY(${virtualRow.start}px)`

I'm trying to integrate library in the big project and found some problems with click event coordinates using `translateY(${virtualRow.start}px)` and changed it to just `top: `${virtualRow.start}px`.

What is the motivation of using translateY in official docs? browser rendering performance?

---

## Accepted Answer

**@piecyk** [maintainer]:

Yes, performance reasons. I think you can use getBoundingClientRect to calculate correct position, or use `top` as you mentioned.