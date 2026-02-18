---
number: 53
title: change center of VueUiQuadrant graph
category: Q&A
created: 2024-08-24
url: "https://github.com/graphieros/vue-data-ui/discussions/53"
upvotes: 1
comments: 2
answered: true
---

# change center of VueUiQuadrant graph

Hello,
I love this library.
I wanted to know if I can move the axes in the VueUiQuadrant graph, so that the center is not at (0,0)
For example, the center is at (10,20)
to graph only positive values

Thank you very much and greetings to all

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @elnerto !
Thank you very much :)

The purpose of a quadrant chart is to position datapoints on 4 sides, to identify the quality of a datapoint, and have it classified on one of 4 sides.

The intersection of both axes is derived from the dataset, it is only 0,0 if extremes are inverse (-n , n). If all your datapoints are positive on both x and y, they are all classified in the same portion of the quadrant, that's what it's designed to do.

I think you might consider using `VueUiScatter` for your use case. The scatter chart's axes will behave as you expect.

Cheers, and thanks for trying out the lib :)