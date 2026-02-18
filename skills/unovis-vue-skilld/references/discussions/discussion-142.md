---
number: 142
title: "Graph API: Zoom, Export"
category: Q&A
created: 2023-02-20
url: "https://github.com/f5/unovis/discussions/142"
upvotes: 1
comments: 1
answered: true
---

# Graph API: Zoom, Export

Hello!

Thank you for awesome library! 

I want to display custom control panel (buttons) for graph, e.g.:


**1. Zoom In / Zoom Out**
How to zoom in/zoom out used graph object?
Can i call something like `graph.zoom()` for zoom in and zoom out? Which API method i can call?

**2. Export to SVG/PNG images**
How to export rendered graph to SVG or PNG image?

Is it possible?

Unfortunately I can't find examples of this in the documentation.
Thanks for any help.

---

## Accepted Answer

Oh, i see - `graph.component.zoomIn();` and `graph.component.zoomOut();` methods!

But what right way to export SVG with all css (default + custom variables)?