---
number: 860
title: Sluggish scroll on chromium based browsers when using many columns
type: other
state: open
created: 2024-10-21
url: "https://github.com/TanStack/virtual/issues/860"
reactions: 7
comments: 42
---

# Sluggish scroll on chromium based browsers when using many columns

### Describe the bug

Trying to render a Tanstack table with around 50 columns and I want to avoid using column virtualization and just stick with row virtualization. Seems like in Edge/Chrome I am getting pretty low FPS (~20 fps or so) once I start adding more and more columns. Weird thing is that this is even the case when I use a small dataset (200 rows) and overscan all of the items. On Firefox however I am getting good performance (~60fps).

Also I noticed that if I convert my code to useWindowVirtualizer() the scrolling performs way better, but unfortunately that doesn't suit my use case.

### Your minimal, reproducible example

https://stackblitz.com/edit/tanstack-virtual-2gupur?file=src%2Fmain.tsx

### Steps to reproduce

1. add 20+ columns to the table (I did already in the StackBlitz
2. Start scrolling in a chromium based browser

### Expected behavior

1. 60fps-ish scrolling

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

Windows 11, Edge v130

### tanstack-virtual version

v3.10.8

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.