---
number: 2845
title: Router searchParameter gets reset to default value (of zod schema) after navigations (and using retainSearchParams)
type: other
state: open
created: 2024-11-24
url: "https://github.com/TanStack/router/issues/2845"
reactions: 17
comments: 15
---

# Router searchParameter gets reset to default value (of zod schema) after navigations (and using retainSearchParams)

### Which project does this relate to?

Router

### Describe the bug

Using retained searchParams, if we change the retained param `x` form `a` to `b` on some route (lets say route-a) and we navigate to route-b, which doesn't change param `x`, param `x` will revert back to its default value.

This is a regression because it works on using older versions.

Same code older versions:
stackblitz
Same code latest versions:
stackblitz




### Your Example Website or App

-see desc

### Steps to Reproduce the Bug or Issue

1. click on Home route (see Auth defaults to true)
2. click on Settings route (see Auth remains true)
3. click on About route (see now Auth is false)
4. click on Home route:
4.a older version: Auth remains as false (which is expected)
4.b newer version: Auth changes back to true (which is unexpected) 

### Expected behavior

after chaning the retained searchParams, it should stay unchanged after navigations, and only change if explicitly said so.
* some other weird thing here is that even without using this middle params stay on URL, kinda making retainSearchParams useless, unless im not grasping the use of it correctly. 

### Screenshots or Videos

_No response_

### Platform

- OS: [e.g. macOS, Windows, Linux]
- Browser: [e.g. Chrome, Safari, Firefox]
- Version: [e.g. 91.1]


### Additional context

_No response_