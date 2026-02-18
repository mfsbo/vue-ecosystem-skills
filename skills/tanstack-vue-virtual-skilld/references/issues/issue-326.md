---
number: 326
title: "TypeScript: useVirtualizer returns any"
type: other
state: closed
created: 2022-06-23
url: "https://github.com/TanStack/virtual/issues/326"
reactions: 13
comments: 1
---

# TypeScript: useVirtualizer returns any

### Describe the bug

When using TypeScript, the `useVirtualizer` hook returns a type of `any`. So there's no type checking on `getVirtualItems()` and other methods.

It seems that `@tanstack/react-virtual` imports code from `@tanstack/virtual-core` but that package is not listed in its dependencies nor peer dependencies. Actually `@tanstack/virtual-core` seems to be bundled with `@tanstack/react-virtual`, with internal module resolution resolving to the bundled version. But the types still make references to `@tanstack/virtual-core`.

A workaround that worked for me was to install `@tanstack/virtual-core`.

### Your minimal, reproducible example

https://stackblitz.com/edit/github-p5unvt-6pqefn?file=src%2Fmain.tsx

### Steps to reproduce

1. Open the reproduction on StackBlitz
2. Open the `src/main.tsx` file
3. Move your mouse over the result of `useVirtualizer`, the type is `any`

### Expected behavior

I was expecting to have the type definitions for the library working.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

- OS: MacOs
- Browser: Brave/Chrome
- IDE: Visual Studio Code

### tanstack-virtual version

3.0.0-beta.2

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.