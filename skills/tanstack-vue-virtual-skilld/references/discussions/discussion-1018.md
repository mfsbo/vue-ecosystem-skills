---
number: 1018
title: Best way to preserve scroll position when new items added to beginning of the list
category: Q&A
created: 2025-06-09
url: "https://github.com/TanStack/virtual/discussions/1018"
upvotes: 1
comments: 1
answered: false
---

# Best way to preserve scroll position when new items added to beginning of the list

I'm using the virtualizer to render a list of dynamically sized items, and I was hoping to get some advice on how to preserve the currently visible items when a new item is added to the beginning of the list (particularly when that item is not visible/offscreen).

## Steps to repro
1. Scroll deeply into a virtualized list
2. Add a new item to the beginning of the list

## Expected
Existing scroll position remains the same (from the user's perspective at least)

## Actual
Content shifts down

Ideas
1. detect when new items are added, and try to adjust the scroll position accordingly. this seems difficult to do outside of the library, but happy to hear ideas!
2. build this into the library, seems like this might be a generally useful feature, particularly for lists that can hav...

---

## Top Comments

**@GarrisonBates** (+3):

I've just been working on this for the past week. I've found this thread to be very useful when working on the same problem:
https://github.com/TanStack/virtual/discussions/195

My use case is a messaging interface. Code's a little messy right now but I'll share in case it helps:
...