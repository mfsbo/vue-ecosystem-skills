---
number: 591
title: my issues with useVirtualizer with tanstack/react-table to sticky <thead>
type: other
state: open
created: 2023-09-25
url: "https://github.com/TanStack/virtual/issues/591"
reactions: 13
comments: 1
---

# my issues with useVirtualizer with tanstack/react-table to sticky <thead>

### Describe the bug

Describe the bug:
iam using useVirtualizer with tanstack/react-table to sticky <thead>, but iam scrolling to index 90 sticky not work

 <thead style={{ position: "sticky", zIndex: 999, top: 0, margin: 0 }}>

Demo live: 
https://codesandbox.io/p/sandbox/keen-moser-k3g48j?embed=1&file=%2Fsrc%2Fmain.tsx%3A7%2C14

### Your minimal, reproducible example

https://codesandbox.io/p/sandbox/keen-moser-k3g48j?embed=1&file=%2Fsrc%2Fmain.tsx%3A7%2C14

### Steps to reproduce

step -> scrolling to index 90 sticky <thead> not work 

### Expected behavior

 Expected behavior : when scrolling sticky <thead> work

### How often does this bug happen?

None

### Screenshots or Videos

_No response_

### Platform

OS: Macos 
Chorme:  116.0.5845.187 (Official Build) (arm64)

### tanstack-virtual version

    "@tanstack/react-virtual": "3.0.0-beta.60",

### TypeScript version

_No response_

### Additional context

  "@tanstack/react-table": "^8.7.9",
    "@tanstack/react-virtual": "3.0.0-beta.60",

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@evayde** (+1):

Probably duplicate of https://github.com/TanStack/virtual/issues/585