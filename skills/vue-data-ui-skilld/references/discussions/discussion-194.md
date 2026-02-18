---
number: 194
title: How to reversed yAxis in  VueUiXy
category: Q&A
created: 2025-05-25
url: "https://github.com/graphieros/vue-data-ui/discussions/194"
upvotes: 1
comments: 2
answered: true
---

# How to reversed yAxis in  VueUiXy

How to reversed yAxis in  VueUiXy 

---

## Accepted Answer

**@graphieros** [maintainer]:

@jougisljs 
Thank you for the screenshot.
Try setting all your dataset values to negative, and using formatters to display values as positive:

```js
const config = ref({
    // ...rest of your config
    chart: {
        grid: {
            labels: {
                yAxis: {
                    formatter: ({ value }) => {
                        return Math.abs(value)
                    }
                }
            }
        },
        tooltip: {
            customFormat: ({ datapoint }) => {
                let html = "";
                datapoint.forEach(d => {
                    html += `<li>${d.name}: ${Math.abs(d.value)}</li>`
                })
                return `<ul>${html}</ul>`
            }
        }
    },
    line: {
        labels: {
            formatter: ({ value }) => {
                return Math.abs(value)
            }
        }
    },
})
```

