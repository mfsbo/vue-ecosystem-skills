---
number: 656
title: Expanding rows in a virtualized table will cause it to scroll to top
type: other
state: open
created: 2024-01-26
url: "https://github.com/TanStack/virtual/issues/656"
reactions: 8
comments: 5
---

# Expanding rows in a virtualized table will cause it to scroll to top

### Describe the bug

When implementing expandable rows in a virtualized table, toggling an expandable row will immediately cause the table to scroll to top regardless of where the the current scroll offset is.

### Your minimal, reproducible example

https://stackblitz.com/edit/tanstack-virtual-xdmecx?file=src%2FApp.svelte

### Steps to reproduce

1. Scroll down table.
2. Toggle on/off an expandable row.
3. Table will immediately scroll to top.

### Expected behavior

I expect to be able to toggle an expandable row and still be able to see it in it's current scroll position. Instead, It scrolls all the way to the top.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

MacOS, Brave browser v1.62.153

### tanstack-virtual version

3.0.2

### TypeScript version

^5.0.2

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.