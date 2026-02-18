---
number: 28
title: Resizing rows in dynamic list
type: other
state: closed
created: 2020-05-19
url: "https://github.com/TanStack/virtual/issues/28"
reactions: 21
comments: 12
---

# Resizing rows in dynamic list

I've given the dynamic list of this great lib a spin and encountered two issues:

1. My rows can expand/collapse on click (i.e. change height), but the virtualized list doesn't adapt the item positions. Could this benefit from a `ResizeObserver` hook such as useMeasure?
2. It would be very nice to have a mechanism where the dynamic list's overall initial height is set such that it doesn't cut off partial rows. See e.g. the first example shown in react-collapse where the height limit is set by the number of visible paragraphs.