---
number: 819
title: "Vue - adding bigint to Key broke :key bindings"
type: other
state: open
created: 2024-08-29
url: "https://github.com/TanStack/virtual/issues/819"
reactions: 10
comments: 0
---

# Vue - adding bigint to Key broke :key bindings

### Describe the bug

The recent change to VirtualItem.Key breaks the `:key` bindings in `v-for` loops.

Example:






### Your minimal, reproducible example

https://github.com/tanstack/virtual/tree/main/examples/

### Steps to reproduce

Setup a virtualizer that uses a key that's not the index e.g.

```
const rowVirtualizer = useVirtualizer(
  computed(() => {
    return {
      count: props.items.length,
      getScrollElement: () => virtualizerRef.value,
      getItemKey: (index) => props.items[index].id, // <--- id here is string 
      estimateSize: () => 64,
      overscan: 10,
      debug: false,
    };
  })
);
```

### Expected behavior

As a user I expected the `:key` bindings to not break in Vue `v-for` loops.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

macOS, Linux

### tanstack-virtual version

3.10.6

### TypeScript version

5.5.4

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.