---
number: 54
title: "Documentation says library is compatible with React 16.8.0, but peerDependencies is `{ \"react\": \"^17.0.0 || ^18.0.0\", \"react-dom\": \"^17.0.0 || ^18.0.0\" }`"
type: other
state: closed
created: 2024-03-12
url: "https://github.com/TanStack/store/issues/54"
reactions: 0
comments: 1
---

# Documentation says library is compatible with React 16.8.0, but peerDependencies is `{ "react": "^17.0.0 || ^18.0.0", "react-dom": "^17.0.0 || ^18.0.0" }`

### Describe the bug

From package.json of 0.3.1:

```
"peerDependencies": {
    "react": "^17.0.0 || ^18.0.0",
    "react-dom": "^17.0.0 || ^18.0.0"
  },
```

### Steps to Reproduce the Bug or Issue

- Try to install the library in a project that has react 16 (> 16.8.0):

```
npm ERR! Could not resolve dependency:
npm ERR! peer react@"^17.0.0 || ^18.0.0" from @tanstack/react-store@0.3.1
npm ERR! node_modules/@tanstack/react-store
npm ERR!   @tanstack/react-store@"*" from the root project
```

### Expected behavior

As per README, I'd expect the package to be installed without peer dependencies conflict.

### Screenshots or Videos

_No response_

### Platform

- OS: Windows
- Browser: N/A, this is a dependency issue
- Version: N/A, this is a dependency issue


...