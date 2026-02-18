---
number: 1013
title: shouldAdjustScrollPositionOnItemSizeChange logic for infinite upwards scroll / messaging UI
category: Q&A
created: 2025-06-08
url: "https://github.com/TanStack/virtual/discussions/1013"
upvotes: 1
comments: 1
answered: true
---

# shouldAdjustScrollPositionOnItemSizeChange logic for infinite upwards scroll / messaging UI

I'm building a text messaging-like functionality into my web app. It has a pretty standard layout, most recent messages at the bottom, and scrolling up to the top of the container fetches the next page (older messages).

When doing reverse infinite scroll, some logic is required to handle the scrollbar, otherwise you'll see a big jump. This is the primary logic that fires when elements are prepended to the list.
```
const deltaScrollHeight =
          scrollContainerRef.current.scrollHeight - prevScrollHeightRef.current
        scrollContainerRef.current.scrollTop = deltaScrollHeight
```

It works like a charm some of the time, but other times elements get measurements updated after scrollTop is updated, causing a jump in scroll position relative to where the user was.

If I set...

---

## Accepted Answer

**@piecyk** [maintainer]:

This shouldAdjustScrollPositionOnItemSizeChange is there to override the default logic that tries to fix scroll jumping issues. For example, when you jump into the middle of the list and start scrolling upward to the beginning, if the actual row sizes differ significantly from the estimated ones, the scroll height can change, causing the list to jump. 

In general, it makes sense to adjust the scroll position when scrolling up most cases, we have a PR to make it default https://github.com/TanStack/virtual/pull/1002