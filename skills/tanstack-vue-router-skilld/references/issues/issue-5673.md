---
number: 5673
title: "ReferenceError: Cannot access '__vite_ssr_import_2__' before initialization"
type: other
state: closed
created: 2025-10-28
url: "https://github.com/TanStack/router/issues/5673"
reactions: 21
comments: 33
---

# ReferenceError: Cannot access '__vite_ssr_import_2__' before initialization

### Which project does this relate to?

Start

### Describe the bug

When starting our tanstack start application in development environment, we sometimes get the following error in the terminal:

```
ReferenceError: Cannot access '__vite_ssr_import_2__' before initialization
    at Module.getRouter (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/src/router.tsx:7:9)
    ... 2 lines matching cause stack trace ...
    at async eval (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/node_modules/@tanstack/start-server-core/src/createStartHandler.ts:243:32) {
  cause: ReferenceError: Cannot access '__vite_ssr_import_2__' before initialization
      at Module.getRouter (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/src/router.tsx:7:9)
      at getRouter (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/node_modules/@tanstack/start-server-core/src/createStartHandler.ts:123:55)
      at async handleServerRoutes (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/node_modules/@tanstack/start-server-core/src/createStartHandler.ts:358:18)
      at async eval (/Users/ulrichstark/Desktop/tanstack-vite-cannot-access-vite-ssr-import-before-initalization/node_modules/@tanstack/start-server-core/src/createStartHandler.ts:243:32),
  status: 500,
  statusText: undefined,
  headers: undefined,
  data: undefined,
  body: undefined,
  unhandled: true
}
```

And the opened application in the browser only shows:
```json
{"status":500,"unhandled":true,"message":"HTTPError"}
```

When reloading the page, the error goes away and our application is shown.

### Your Example Website or App

https://github.com/ulrichstark/tanstack-vite-cannot-access-vite-ssr-import-before-initalization

### Steps to Reproduce the Bug or Issue

...

---

## Top Comments

**@flodaniel** (+7):

Also facing the same issue. I believe it is due to a circular dependency between `router.tsx` importing `routeTree`, and `routeTree.gen` imports `router.tsx`

router-->routeTree->router

**@flodaniel** (+1):

Sorry no, it happens again and again everytime we start the vite dev server. However from my recollection it does not happen every time but pretty frequently. 

**@nickwang0808**:

I'm actually stuck with the error and unsure how to get past it