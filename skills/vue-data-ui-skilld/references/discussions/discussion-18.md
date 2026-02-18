---
number: 18
title: Performance
category: Q&A
created: 2023-12-19
url: "https://github.com/graphieros/vue-data-ui/discussions/18"
upvotes: 2
comments: 1
answered: true
---

# Performance

Hello,

I'm looking for an alternative of chart.js because with more than 100 data point, it start struggling.

Does you lib goes well with 1000 data points and big charts in general?

Thanks 

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi,

chart.js uses canvas to render charts, so you are looking at the best possible performance here in terms of DOM operations, for a JS library. Vue Data UI uses svg to render charts, creating as many DOM nodes as there are datapoints, so on very large datasets, you would probably have performance issues related to DOM rendering. In both cases however, large datasets tend to reach Javascript's performance limitations, because of all the necessary array operations it has to run to convert and manipulate datasets.

I could run some tests, if you know what type of chart you need (line, bar, etc), and the shape of your data (not the actual data).