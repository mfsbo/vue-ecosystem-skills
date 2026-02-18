---
number: 1495
title: Nested repeater causes recursive updates
type: bug
state: closed
created: 2024-09-05
url: "https://github.com/formkit/formkit/issues/1495"
reactions: 2
comments: 5
labels: "[ bug,  priority-2]"
---

# Nested repeater causes recursive updates

### Reproduction

https://formkit.link/a083cd47eaf0d0c6d81ac247f535d854

### Describe the bug

When having nested repeaters, it causes an error after about 7 objects in the array to log:

```js
Uncaught (in promise) Maximum recursive updates exceeded in component <FormKit>. This means you have a reactive effect that is mutating its own dependencies and thus recursively triggering itself. Possible sources include component template, render function, updated hook or watcher source function.
```

When having many more, it crashes my app entirely.

### Environment

• OS: macOS
• Browser: Arc (Chrome)
• Version: 1.57.2
