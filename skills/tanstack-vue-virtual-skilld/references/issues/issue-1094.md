---
number: 1094
title: flushSync was called from inside a lifecycle method
type: other
state: open
created: 2025-12-13
url: "https://github.com/TanStack/virtual/issues/1094"
reactions: 23
comments: 6
---

# flushSync was called from inside a lifecycle method

### Describe the bug

when i use window virtualization with *TanStack/virtual*, a warning appears in the console:
Warning: flushSync was called from inside a lifecycle method. React cannot flush when React is already rendering. Consider moving this call to a scheduler task or micro task.

The reporter notes that this warning seems to come from a `flushSync` call that was added in a previous change (PR #608) and asks for recommendations to fix it. They also share a local workaround guarding the callback with a mounted check to avoid the error. closed github issue

also we could see the error message in the official document example with the latest version when we reach the end of the scrollable element: 
https://tanstack.com/virtual/latest/docs/framework/react/examples/infinite-scroll

### Your minimal, reproducible example

https://tanstack.com/virtual/latest/docs/framework/react/examples/infinite-scroll

### Steps to reproduce

Run the official document example

### Expected behavior

we should not see the mentioned warning

### How often does this bug happen?

Every time

### Screenshots or Videos

<img width="1280" height="689" alt="Image" src="https://github.com/user-attachments/assets/cee0b513-a86e-420b-8e07-635247351380" />

### Platform

windows 11 - chrome

### tanstack-virtual version

v3.13.13

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@mrbean27123** (+2):

> Were you able to fix it?

by rolling back to v3.13.12

**@piecyk** [maintainer]:

@amorey warning itself doesn’t really affect anything in this case. 

As commented in #1098 the flushSync is intentionally used to synchronously apply the scroll correction during measurement to limit visible white space while scrolling. 

I think we should make this configurable under a flag in @tanstack/react-virtual

**@amorey**:

I tried everything I could think of (`queueMicrotask()`, `requestAnimationFrame()`, `setTimeout()`, `useEffect()`, `scrollend` listener, virtualizer `isScrolling` trigger, rolling back to v3.13.12) and nothing worked. Eventually I decided to try setting `virtualizer.isScrolling = false` before my update and the error seems to have gone away without any downsides . However, it's definitely a hack so use it with caution.

...