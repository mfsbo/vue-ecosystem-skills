---
number: 261
title: "[FEATURE REQUEST] Add methods to programmatically show and hide series"
type: feature
state: closed
created: 2025-10-28
url: "https://github.com/graphieros/vue-data-ui/issues/261"
reactions: 2
comments: 5
labels: "[ enhancement]"
---

# [FEATURE REQUEST] Add methods to programmatically show and hide series

**Is your feature request related to a problem? Please describe.**
I need to programmatically control the visibility of series in some of the components I am using (vue-ui-xy, vue-stackbar) from a parent component. Currently, there's no way to show or hide specific series by name without manually triggering the legend click events or manipulating internal state.

**Describe the solution you'd like**
I would like to add two new methods to the component. (starting with vue-ui-xy, vue-stackbar): showSeries(name) and hideSeries(name). These methods would allow parent components to programmatically control series visibility by passing the series name as a parameter. The methods should:

...