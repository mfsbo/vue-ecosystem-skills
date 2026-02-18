---
number: 3997
title: Performance is horrible when using recommended Authentication patterns
type: other
state: open
created: 2025-04-15
url: "https://github.com/TanStack/router/issues/3997"
reactions: 46
comments: 22
---

# Performance is horrible when using recommended Authentication patterns

### Which project does this relate to?

Router

### Describe the bug

When using the recommended patterns for authentication, particularily in tanstack start, the performance of the app is garbage. 

because onBefore load for _root or _authed routes runs on every page navigation, even when you are clientside, it necessitates a sever round trip before being able to navigate resulting in incredibly unresponsive apps. (even if the auth service was processing in 1ms the server trip is usally about 200 -300 ms for most people)

With tanstack router there were some solutions to this by storing the authstate in a react context or hook outside of the inner app and so the state would persist as normal across transitions without a server trip and you could refresh you session tokens as normal when needed. 

With tanstack start this is no longer an option as it does not appear as if its possible to have a global state that is persisted across route transitions, (ie client side behaviour that we love, that makes the apps fast). 

This is quite obviously not in line with the promise of tanstack start from their very own landing page: 

> While other frameworks continue to compromise on the client-side application experience we've cultivated as a front-end community over the years, TanStack Start stays true to the client-side first developer experience, while providing a full-featured server-side capable system that won't make you compromise on user experience.

There should be some VERY clear documentation on how to avoid this performance issue, and patterns and practices on how to achieve client first performance. 


### Your Example Website or App

https://github.com/tanstack/router/tree/main/examples/react/start-clerk-basic

### Steps to Reproduce the Bug or Issue

use any of the authenticated template starters and attempt to navigate

### Expected behavior

...

---

## Top Comments

**@schiller-manuel** (+59):

we are working on adding another lifecycle method that will be cached in the same way as the loader but will execute serially just like beforeLoad. stay tuned!

**@Firephoenix25** (+22):

any updates?

**@pleunv** (+9):

I've been running into a few similar surprises mostly related to the `beforeLoad`/`loader` behavior on a pathless `_authed` wrapper route.

Observations:
 
- `beforeLoad` and `loader` of the `_authed` wrapper route are triggered on every child route navigation.
- `beforeLoad` and `loader` of the `_authed` wrapper route are triggered on every child route preload, with the `preload` param received as `false`, for some reason. This especially threw me off.
- No amount of `staleTime`, `preloadStaleTime`, `gcTime` or `preloadGcTime` configuration seem to have any impact on how frequently the `befor...