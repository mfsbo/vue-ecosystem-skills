---
number: 5738
title: Some server-side modules incorrectly bundled into the client?
type: other
state: open
created: 2025-11-03
url: "https://github.com/TanStack/router/issues/5738"
reactions: 16
comments: 21
---

# Some server-side modules incorrectly bundled into the client?

### Which project does this relate to?

Start

### Describe the bug

Starting with `@tanstack/react-start@1.134.7`, I think server-side modules are being incorrectly bundled into the client bundle. For example, in the Clerk SDK, this error shows up in the browser console when running dev server:

```ts
Uncaught (in promise) SyntaxError: The requested module '/node_modules/cookie/dist/index.js?v=d2ee33e7' does not provide an export named 'parse' (at chunk-CEKR2FXD.mjs?v=d2ee33e7:4283:10)Understand this error
client:865 
```

Likely related to https://github.com/TanStack/router/issues/5717

### Your Example Website or App

https://github.com/clerk/clerk-tanstack-react-start-quickstart/pull/6/files

### Steps to Reproduce the Bug or Issue

1. Clone the repo attached
2. Switch to the `cookie-module-leak` branch
3. Run `npm run dev`, see browser console

### Expected behavior

Properly externalize server-side modules in client builds.

### Screenshots or Videos

_No response_

### Platform

- Router / Start Version: 1.134.9
- OS: [e.g. macOS, Windows, Linux]
- Browser: [e.g. Chrome, Safari, Firefox]
- Browser Version: [e.g. 91.1]
- Bundler: Vite
- Bundler Version: [e.g. 7.0.0]


### Additional context

_No response_