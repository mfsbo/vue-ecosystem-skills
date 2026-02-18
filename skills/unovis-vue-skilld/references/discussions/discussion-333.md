---
number: 333
title: Is there a good way to keep a continuous line without a fallback value in the case of missing data?
category: Q&A
created: 2024-02-06
url: "https://github.com/f5/unovis/discussions/333"
upvotes: 1
comments: 1
answered: true
---

# Is there a good way to keep a continuous line without a fallback value in the case of missing data?

My datasets are time series and for some charts there can potentially be quite a lot of missing data points, and ideally I'd like the line to simply continue to the next available data point instead of breaking. A small slice of the data might look like:

```js
[
  {
    "timestamp": 1707093300,
    "avgHighPrice": null,
    "avgLowPrice": 1689316073,
  },
  {
    "timestamp": 1707093600,
    "avgHighPrice": 1689316059,
    "avgLowPrice": 1688222222,
  },
  {
    "timestamp": 1707093900,
    "avgHighPrice": 1694000000,
    "avgLowPrice": null,
  }
]
```


*without a `fallbackValue`*

I don't like the idea of using a fallbackValue because it ends up showing an inaccurate picture...

---

## Accepted Answer

@c-kirkeby The easiest way to solve this with the current version of Unovis is to split your data array into two, filter out `null` data points, and have two separate `VisLine` components (you can provide data to components individually instead of providing data to `VisXYContainer`).