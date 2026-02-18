---
number: 42
title: Chart colors for label with axis and y axis,  colors does not seem to work as configured.
category: Q&A
created: 2024-06-28
url: "https://github.com/graphieros/vue-data-ui/discussions/42"
upvotes: 1
comments: 2
answered: true
---

# Chart colors for label with axis and y axis,  colors does not seem to work as configured.

While testing at the Chart Builder, 
it seems to work at https://vue-data-ui.graphieros.com/chart-builder

- While applying "Dark Mode", chart axis's label is not working as configured,  
- My changes : theme is applied. - 
```
theme: isDarkMode.value ? 'hack' : 'zen', // 'hack', // zen, hack , concrete
```
- Picture


Thank you advanced.


---

## Accepted Answer

**@graphieros** [maintainer]:

Ok I see what you mean now.
It is totally normal: the "zen" theme is designed to be displayed without axis labels (zen = no interference ^^)

This should be mentioned in the documentation.

What you can do for your theme is :

`theme: isDarkMode.value ? "hack" : "" `

You can adapt the config so that when it is not in dark mode, you can apply your preferred colors.
You can also set config.customPalette to the colors used for the zen mode, so they are applied when isDarkMode is false:

```js
// Color palette of zen mode
customPalette : [
        "#B9B99D",
        "#E0CFC3",
        "#DFCA99",
        "#DCB482",
        "#C09E85",
        "#8F837A",
        "#858480",
        "#B0B9A8",
        "#606C5A",
        "#5E5E5E",
        "#4F5B75",
        "#647393",
        "#818EA9",
        "#9FA9BE",
        "#BBC4D3",
        "#DCDFE7",
        "#928A98",
        "#8A9892",
        "#B1A7AD",
        "#C5B8A7",
        "#EBD6CC",
        "#D7E0D2",
        "#E0D2D7",
        "#E0DBD2",
        "#D2E0DB",
        "#DBD2E0",
        "#C1B7A5",
        "#A5AFC1",
        "#E0DBD2",
        "#D2D7E0",
        "#F7EDE2",
        "#97ACB7",
        "#C4CBBC",
        "#C3C5C5",
        "#A0AC94"
    ]
```...