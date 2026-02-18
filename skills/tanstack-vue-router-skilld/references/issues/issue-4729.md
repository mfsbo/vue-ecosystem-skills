---
number: 4729
title: "@tanstack/start-storage-context seem wrong bundled in client side code that cause a node:async_hooks.AsyncLocalStorage bug"
type: other
state: closed
created: 2025-07-21
url: "https://github.com/TanStack/router/issues/4729"
reactions: 22
comments: 22
---

# @tanstack/start-storage-context seem wrong bundled in client side code that cause a node:async_hooks.AsyncLocalStorage bug

### Which project does this relate to?

Router, react-start

### Describe the bug

New version update will cause a bug that node:async_hooks.AsyncLocalStorage is bundle in client side code. 
i have reproduce it in a sandbox. you could see it's happend on /posts route 
this screen shot is after i add a `optimizeDeps: {
    exclude: ['@tanstack/start-storage-context', 'node:async_hooks'],
  },
  ssr: {
    noExternal: ['@tanstack/start'],
    external: ['node:async_hooks'],
  },` in vite config 
<img width="1126" height="205" alt="Image" src="https://github.com/user-attachments/assets/e89580fa-e9e3-438d-b5db-77be8dd98bc7" />

### Your Example Website or App

https://codesandbox.io/p/sandbox/rough-snow-tqngv6

### Steps to Reproduce the Bug or Issue

1. Create a middleware `import { createMiddleware } from '@tanstack/react-start';
async function serverHandler({ next, context }: any) {
  const result = await next();
  return result;
}
export const getUserContextMiddleware = createMiddleware({
  type: 'function',
}).server(serverHandler);
`
2. use it in a server function `export const fetchPosts = createServerFn({ method: 'GET' }).middleware([getUserContextMiddleware]).handler(
  async () => {
    console.info('Fetching posts...')
    return axios
      .get<Array<PostType>>('https://jsonplaceholder.typicode.com/posts')
      .then((r) => r.data.slice(0, 10))
  },
)`


### Expected behavior

`Module "node:async_hooks" has been externalized for browser compatibility. Cannot access "node:async_hooks.AsyncLocalStorage" in client code `  will not be occurred

### Screenshots or Videos

<img width="708" height="552" alt="Image" src="https://github.com/user-attachments/assets/67abfe51-1eb6-456b-a3bd-365a1d4b7d4f" />

### Platform

- Router / Start Version: 1.129.0
- OS: macOs
- Browser: Chrome
- Bundler: vite


### Additional context

_No response_