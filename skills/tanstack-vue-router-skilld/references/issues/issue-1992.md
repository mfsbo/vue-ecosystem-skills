---
number: 1992
title: "[TanStack Start] HMR is not working from root route (__root)"
type: other
state: closed
created: 2024-07-19
url: "https://github.com/TanStack/router/issues/1992"
reactions: 37
comments: 47
labels: "[start]"
---

# [TanStack Start] HMR is not working from root route (__root)

### Describe the bug

HMR is not working in root route. only working from normal routes.

### Your Example Website or App

https://github.com/TanStack/router/tree/main/examples/react/start-basic-rsc

### Steps to Reproduce the Bug or Issue

1. Clone (or copy or degit) start-basic-rsc example, install dependencies and run dev server.
2. Open http://localhost:3000
3. Try to edit from `__root.tsx`. I just added a link beside Home.

### Expected behavior

In terminal, dev server printed a log about page has reloaded.
```
[vite] page reload app/routes/__root.tsx
```

but the changes are not reflected in the browser.

### Screenshots or Videos


https://github.com/user-attachments/assets/26aaa1a3-80c1-40af-8dd8-f2403051519e



### Platform

- OS: macOs
- Browser: Arc / Chrome
- Version: 126.0.6478.127


### Additional context

_No response_

---

## Top Comments

**@KiwiKilian** (+19):

To summarize, we see the following HMR problems with file based routing:

## HMR is not triggered when editing
- `routes/__root.tsx`
- `components/Example.tsx` imported into any `routes/**.tsx` file
- `routes/_layout.tsx`

## HMR is triggered when editing
- `routes/index.tsx`
- `routes/example.example.tsx`  (@anulman are you sure this doesn't work for any plain route (no `_` prefix) file?)
- `routes/with-directory/example.tsx`

...

**@anulman** (+9):

I'm experiencing this as well, not just in my root route but in any top-level route.

I also have not been able to separate out `components/Foo.tsx` files and have them hot-reload. The dev console & JS console confirm the HMR event has been emitted and received, but the React JS—even for route sub-components modified in non-route files (e.g. `import { FooPage } from '~/components/FooPage';`) does not re-render the HMR'ed component.

**@ChrisEdgington** (+5):

We just added TanStack router to our vite-based project, and now we are also experiencing this HMR failure. I tried a few different routes, it does seem to only be happening with __root.tsx.