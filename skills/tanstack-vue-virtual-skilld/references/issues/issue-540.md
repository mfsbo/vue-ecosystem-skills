---
number: 540
title: Infinite re-render issue on specific scroll position 
type: other
state: closed
created: 2023-04-18
url: "https://github.com/TanStack/virtual/issues/540"
reactions: 20
comments: 5
---

# Infinite re-render issue on specific scroll position 

### Describe the bug

At some particular scroll position, the `useVirtual` hook returned `virtualItems` changes indefinitely

e.g. the returned value indexes are from 20 to 44, the object changes to 21-45 and again 20-44 and that never ends

### Your minimal, reproducible example

https://codesandbox.io/s/github/tanstack/table/tree/main/examples/react/virtualized-rows?from-embed

### Steps to reproduce

1. Create a virtualized table or go to the TanStack Virtualized Rows  example

2. scroll 10-20 items

3. open inspect(Devtools Elements Tab) or react profiler (you need to see the `tbody`)

4. scroll in small steps more 3-5 items

You will catch the case where `tbody` is rendered indefinitely.


### Expected behavior

It should not be re-rendered and the `useVirtual` hook should return the same link since nothing has changed.

### How often does this bug happen?

Every time

### Screenshots or Videos

2877cadd-591e-4a83-8999-e8184b0e60b2_tYU7isWz.webm


### Platform

OS: macOS, Browser: Chrome 112

### tanstack-virtual version

2.10.4

### TypeScript version

4.4.3

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@piecyk** [maintainer] (+3):

Yep, overall `overflow-anchor` is not a hack we need to mention that in docs, that better is disable it. 

I think what happen here, is that our adjustment of scroll position mixed with browser, making the element un-mount in loop.

**@guanyu-y** (+2):

I have also encountered a similar issue. As a quick hack, I was able to prevent the component from re-rendering by disabling the browser's overflow-anchor as follows:
```typescript
...
<div
  style={{ height: tableHeight, overflow: 'auto', overflowAnchor: 'none' }}
  onScroll={(e) => handleScrollOnBottomReached(e.target as HTMLDivElement)}
  ref={tableContainerRef}
>
  <table style={{ tableLayout: 'fixed', width: '100%', borderCollapse: 'collapse' }}>
    <thead
      style={{
        position: 'sticky',
        zIndex: 999,
        top: 0,
        margin: 0
      }}
    >
...
```...

**@alishi973** (+3):

Yes, but the mentioned comment was from 2-3 years ago, and he provided an example for this one here

So it is supposed to work.

Maybe we need @tannerlinsley's help here.
