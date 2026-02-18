---
number: 219
title: Clickable/Linkable Ticks
category: Q&A
created: 2023-06-02
url: "https://github.com/f5/unovis/discussions/219"
upvotes: 1
comments: 1
answered: true
---

# Clickable/Linkable Ticks

Hello, I have a stacked horizontal bar chart showing some metrics for different 'sites', which are along the y-axis (the ticks). I'd like to make those sites clickable to go to particular pages, or maybe trigger a custom 'on click' event. Is this possible?

---

## Accepted Answer

@errantmind You can set up events for Axis components just like for any other component. Here's how to do it for a click event:

```tsx
import { VisAxis,  ... } from '@unovis/react'
import { Axis } from '@unovis/ts'

...
<VisAxis
  ...
  events={{
    [Axis.selectors.tick]: {
      click: (tickValue: number) => console.log(tickValue),
    },
  }}
/>
```