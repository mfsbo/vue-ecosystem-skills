---
number: 176
title: Line graph is weird - what am I doing wrong?
category: Q&A
created: 2023-04-01
url: "https://github.com/f5/unovis/discussions/176"
upvotes: 1
comments: 1
answered: true
---

# Line graph is weird - what am I doing wrong?

Recently, my line charts changed from being normal to looking like this:

(don't mind the scale of the x-axis; that's something I need to work on)

The component I'm rendering the graph with is VisitsChart.svelte:
...

---

## Accepted Answer

@aleksrutins The first thing I would do is check whether the data is sorted chronologically. Unovis doesn't sort data by itself.