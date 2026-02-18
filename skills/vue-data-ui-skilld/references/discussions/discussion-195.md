---
number: 195
title: How to set X,Y value in VueUiXy
category: Q&A
created: 2025-05-26
url: "https://github.com/graphieros/vue-data-ui/discussions/195"
upvotes: 1
comments: 2
answered: true
---

# How to set X,Y value in VueUiXy

Currently, VueUiXy only allows setting Y values. How can I set the X values?

for example :  [ 10, 45] ,[19,80] , [53,78],[ 101.9 , 57]

---

## Accepted Answer

**@graphieros** [maintainer]:

@jougisljs 

In VueUiXy, X values are defined in the config, and all dataset items share the same scale. This is the 'time' axis.

```js
const config = ref({
    chart: {
        grid: {
            labels: {
                xAxisLabels: {
                    values: [] // Set your x axis values here
                }
            }
        }
    }
})
```