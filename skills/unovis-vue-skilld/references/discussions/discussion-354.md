---
number: 354
title: Y axis tick label cut on top in stacked bar chart
category: Q&A
created: 2024-03-18
url: "https://github.com/f5/unovis/discussions/354"
upvotes: 2
comments: 1
answered: true
---

# Y axis tick label cut on top in stacked bar chart

Hello, 

the last Y axis tick label is cut . Anyone have resolve this issue ?






---

## Accepted Answer

@kgaulin You can fix it by adding a small `top` margin to the XY Container: https://unovis.dev/docs/containers/XY_Container/#margin