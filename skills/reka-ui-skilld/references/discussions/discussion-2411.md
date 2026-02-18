---
number: 2411
title: Popover content element wrapper dynamic transform issues
category: Q&A
created: 2026-01-23
url: "https://github.com/unovue/reka-ui/discussions/2411"
upvotes: 1
comments: 0
answered: false
---

# Popover content element wrapper dynamic transform issues

Hello, I’m having some issues making the popover work as intended by the design.
It seems like the `transform` property on the `[data-reka-popper-content-wrapper]` element is causing gaps in the styling.

This property appears to be calculated dynamically, and the values are not rounded, for example:

`translate(265.5px, 26px)` (like this for example)
Because of this, gaps appear between the shadow pseudo-element and the content container:

<img width="428" height="134" alt="image" src="https://github.com/user-attachments/assets/c489a5d0-88e7-4d38-a880-7048fa3bfa99" />

<img width="709" height="147" alt="image" src="https://github.com/user-attachments/assets/b349d00f-4218-4065-9a6b-ee66985a7008" />

if i changin values for rounded, everything works as it should:

<img width="...