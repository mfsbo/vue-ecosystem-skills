---
number: 172
title: Gradient color in VueUI XyCanvas
category: Q&A
created: 2025-03-03
url: "https://github.com/graphieros/vue-data-ui/discussions/172"
upvotes: 1
comments: 1
answered: true
---

# Gradient color in VueUI XyCanvas

Hi there! I am using "VueUi XyCanvas" component and I am providing only one dataset to the component. the problem I am facing is I am able to provide colour to the component but it is showing the gradient. I want the bars to be of solid colour for which I can't see any option available if anyone knows how to configure this. Please let me know.



---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @SurajGoswami98 

Please upgrade to v2.6.9 where you will find config attributes to opt out of the default gradient for bars:

```ts
config.style.chart.bar.gradient.show: boolean; // default: true
```