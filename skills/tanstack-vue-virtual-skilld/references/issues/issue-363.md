---
number: 363
title: Dynamically updating count seems to not trigger an update
type: other
state: closed
created: 2022-08-03
url: "https://github.com/TanStack/virtual/issues/363"
reactions: 12
comments: 12
---

# Dynamically updating count seems to not trigger an update

### Describe the bug

When `dataCount` changes from 0 to 1000, the list is not updated.
```javascript
const rowVirtualizer = useVirtualizer({
  count: dataCount,
  getScrollElement: () => tableContainer.current,
  estimateSize: () => 21,
  overscan: 5
});
```


### Your minimal, reproducible example

https://codesandbox.io/s/react-virtual-only-one-item-is-rendered-at-first-bfoj5r?file=/src/main.tsx

### Steps to reproduce

Checkout following sandbox:
https://codesandbox.io/s/react-virtual-only-one-item-is-rendered-at-first-bfoj5r?file=/src/main.tsx
At first glance only one row will be visible. This is because on first render `dataCount` is 0, but then it changes to 1000, but the list is not updated.

### Expected behavior

All items, which fit in the `tableContainer`, should be rendered.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

-OS Linux Ubuntu Browser: Firefox 103.0b9 (64-bit)

### tanstack-virtual version

3.0.0-beta.14

### TypeScript version

_No response_

### Additional context

#353 

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.