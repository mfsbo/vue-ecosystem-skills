---
number: 173
title: Cannot use bold prop for labels in VueUI XyCanvas
category: Q&A
created: 2025-03-04
url: "https://github.com/graphieros/vue-data-ui/discussions/173"
upvotes: 1
comments: 1
answered: true
---

# Cannot use bold prop for labels in VueUI XyCanvas

Hi there! I am using VueUI Xycanvas and want to make the label text bold. but in the documentation the prop is not available. It would be really helpful if someone would let me know how to make labels bold. Also is it possible to use font size for text instead of aspect ratio.



---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @SurajGoswami98 

You can upgrade to v2.6.11 to use the new bold attribute for labels:

```ts
config.style.chart.grid.y.axisLabels.bold: boolean; // default: false
config.style.chart.grid.y.timeLabels.bold: boolean; // default: false
config.style.chart.dataLabels.bold: boolean; // default: false
```
Font size will remain based on `fontSizeRatio`, as it would be a breaking change to modify, and a major is not in the cards for now.
