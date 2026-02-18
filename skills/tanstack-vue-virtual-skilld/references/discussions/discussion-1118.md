---
number: 1118
title: Sticky + dynamic height for list
category: Q&A
created: 2026-01-14
url: "https://github.com/TanStack/virtual/discussions/1118"
upvotes: 1
comments: 1
answered: true
---

# Sticky + dynamic height for list

Hi, I'm trying to make sticky + dynamic elements height.
I tried to add `ref={rowVirtualizer.measureElement}` to every mapping child, but it always take `estimateSize` value for height and I dunno how to set the real element height.
So below is my example and I'll happy if someone help me
https://codesandbox.io/p/devbox/still-leftpad-gq46gq?workspaceId=ws_BFScjL1MWvxGeoRwWY8dQz


---

## Accepted Answer

I had to add **data-index** atribute and remove **height** attrubute