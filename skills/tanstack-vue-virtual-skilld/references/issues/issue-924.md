---
number: 924
title: "Error: Maximum update depth exceeded"
type: other
state: open
created: 2025-02-08
url: "https://github.com/TanStack/virtual/issues/924"
reactions: 9
comments: 11
---

# Error: Maximum update depth exceeded

### Describe the bug

I want to display the table in the dropdown。

I used the antd UI library

But they had a problem

### Your minimal, reproducible example

https://codesandbox.io/p/devbox/infallible-smoke-8tc6d6?file=%2Fsrc%2Fmain.tsx%3A104%2C32

### Steps to reproduce

click select

Don't use rowVirtualizer measureElement is normal

### Expected behavior

Normal table rendering

### How often does this bug happen?

None

### Screenshots or Videos

_No response_

### Platform

- OS: [ macOS 14.6.1 ] - Browser: [Chrome  132.0.6834.160 ] 


### tanstack-virtual version

^3.12.1

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@stv8** (+3):

@piecyk 

We encountered a similar issue in our app. Oddly enough passing the function reference directly into the `ref` attribute solved the problem.

@Atw-Lee I was able to confirm the same fix worked for your sandbox by changing your code to do this

```jsx
// change this to a function
    measureElement: (element) => {
      return typeof window !== 'undefined' &&
      navigator.userAgent.indexOf('Firefox') === -1
        ? element => element?.getBoundingClientRect().height
        : undefined
    },

// pass the function reference directly in rather than wrapped in an anonymous function
ref={rowVirtualizer.measureElement} 

...

**@piecyk** [maintainer]:

> The way we workaround it for now is by providing custom measureElement function, that will fallback to estimateSize when measuring of target item fails.

Yes, the issue here is that on the first render, the elements are positioned off-screen or hidden. Without a defined height, the virtualizer will continue rendering items in the list until they fit within the viewport.

One way to fix this is by checking if the element has a valid height and width. If it does, return the measured size; otherwise, fallback to the cached value:

...

**@piecyk** [maintainer] (+1):

@stv8 you should not wrap the ref with an function as it's known Caveats with callback refs

> If the ref callback is defined as an inline function, it will get called twice during updates, first with null and then again with the DOM element. This is because a new instance of the function is created with each render, so React needs to clear the old ref and set up the new one. You can avoid this by defining the ref callback as a bound method on the class, but note that it shouldn’t matter in most cases.

