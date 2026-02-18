---
number: 4499
title: useMatchRoute not updating when using React Compiler
type: other
state: open
created: 2025-06-22
url: "https://github.com/TanStack/router/issues/4499"
reactions: 11
comments: 5
---

# useMatchRoute not updating when using React Compiler

### Which project does this relate to?

Router

### Describe the bug

When using the function returned by `useMatchRoute` in combination with React Compiler, it looks the result is only evaluated on the initial render.

When using the repro stackblitz, you can remove the react compiler config, which will make the repro case act as I would expect it to.

### Your Example Website or App

https://stackblitz.com/edit/github-jbydd83d?file=src%2Fmain.tsx

### Steps to Reproduce the Bug or Issue

Using the reproduction scenario:

1. Click on the "To About"-link
2. The "Matched route name" doesn't change
3. Refresh
4. The "Matched route name" updates to the correct label

### Expected behavior

The "Matched route name" label changes on each navigation change.

### Screenshots or Videos

_No response_

### Platform

- OS: Linux
- Browser: Chromium
- Version: 137


### Additional context

_No response_