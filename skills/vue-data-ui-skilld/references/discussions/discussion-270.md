---
number: 270
title: Provide a Consistent Way to Control Overall Chart Height and Base Font Size
category: Q&A
created: 2025-11-14
url: "https://github.com/graphieros/vue-data-ui/discussions/270"
upvotes: 1
comments: 1
answered: true
---

# Provide a Consistent Way to Control Overall Chart Height and Base Font Size

 First of all, thank you very much for developing the vue-data-ui library! It’s a pleasure to use.

I would like to ask if there are any best practices for uniformly configuring the size and font size of different charts so that they look more consistent. Below is a simple example containing three charts, each placed inside a card with a fixed height of 320px. To highlight the issue, I added a red border to each .vue-data-ui-component div.

Height Inconsistency:
If a chart has a height setting, I can only manually adjust the height of each chart so that it fits within the parent container. However, the behavior seems different for each component. For example, for the first chart, I set the height to 300, and it fits perfectly within the parent container. For the third chart, even with the ...

---

## Accepted Answer

**@graphieros** [maintainer]:

@zcodecn 

Thank you for the encouraging message, it is much appreciated!

For your use case, try setting `responsive: true` only on VueUiXy and VueUiDonut, and also replace

```css
.chart-body {
  flex: 1;
}
```

by

```css
.chart-body {
  height: 100%;
}
```

As for the font-size, I'm afraid you will have to find the sweet spot manually; since SVG dimensions are different. There is no way around this for the moment.
