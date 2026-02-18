---
number: 633
title: Is there a way to force an XYContainer to redraw?
type: other
state: open
created: 2025-09-09
url: "https://github.com/f5/unovis/issues/633"
reactions: 2
comments: 4
---

# Is there a way to force an XYContainer to redraw?

I've built a l little Unovis chart debugger, with UI inputs that plug into XYContainer, StackedBar and Axis, props.

However, it seems that some attributes (such as `tickPadding`) don't seem to update dynamically, and I have to remove and re-add the chart to see changes.

Is this by design, am I missing something, or is there a way to tell the chart / components to redraw after an attribute changes?

I'm using Vue-flavoured Unovis.