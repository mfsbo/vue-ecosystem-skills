---
number: 325
title: Latest version 3.0.0-beta.4 is not published to npm
type: other
state: closed
created: 2022-06-23
url: "https://github.com/TanStack/virtual/issues/325"
reactions: 13
comments: 6
---

# Latest version 3.0.0-beta.4 is not published to npm

### Describe the bug

The `package.json`'s version of `packages/react-virtual` was bumped to `3.0.0-beta.4` but that version is not published to npm (the latest version published to npm is `3.0.0-beta.2`).

### Your minimal, reproducible example

https://stackblitz.com/github/TanStack/virtual/tree/beta/examples/react/fixed

### Steps to reproduce

1. Clone a specific example
2. Install the dependencies
3. An error is raised as the version can't be found in the registry

### Expected behavior

I was expecting the versions referenced in the examples to be published.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

- OS: MacOS
- Browser: Brave

### tanstack-virtual version

3.0.0-beta.4

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.