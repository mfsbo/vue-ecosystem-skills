---
number: 4010
title: "Error \"Invariant failed: Could not find match for from\" when layout + file-based routing is used"
type: other
state: closed
created: 2025-04-17
url: "https://github.com/TanStack/router/issues/4010"
reactions: 36
comments: 46
---

# Error "Invariant failed: Could not find match for from" when layout + file-based routing is used

### Which project does this relate to?

Router

### Describe the bug

When trying to use the layout routing file, the routes created are correct but when trying to open one of the route using <Link /> component, it fails to load or when trying to refresh the page which is already on the failed route.



### Your Example Website or App

https://stackblitz.com/edit/tanstack-invariant-bug

### Steps to Reproduce the Bug or Issue

1. Click on About or Dashboard link
2. Error is thrown

### Expected behavior

I should be able to properly add a layout routing file and the nested components should work correctly.

For example below routes:

app/home
app/about
app/dashboard

I have route.tsx (default pattern for layout file) file inside app folder which contains the nav bar, then /home, /about and /dashboard should have the nav bar present in them.

### Screenshots or Videos



### Platform

"@tanstack/react-router": "^1.116.0"
"@tanstack/router-plugin": "^1.116.1"

### Additional context

_No response_

---

## Top Comments

**@GGAlanSmithee** (+5):

Also hitting this. In my case, I want to run preload, is there any way around this? 

**@sep2** (+1):

I just downgrade to `1.102.5`, noted that in package.json you have to add exact version of the following three package otherwise it won't downgrade.

```
            "@tanstack/react-router": "1.102.5",
            "@tanstack/router-plugin": "1.102.5",
            "@tanstack/router-generator": "1.102.5"
```

> Is there any specific change in the latest version cause the same code works for v1.102.5? If I remove the basepath, is there any way to directly redirect to /app always?



**@schiller-manuel**:

your example has a basepath 'app' configured AND your routes are inside an `app` folder.
So the runtime URL would be /app/app/..
Probably not what you want?
Either remove the basepath or move the routes outside of the app folder
