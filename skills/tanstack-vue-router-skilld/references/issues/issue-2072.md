---
number: 2072
title: Router context invalidate Promise resolve does not invalidate context
type: other
state: open
created: 2024-08-01
url: "https://github.com/TanStack/router/issues/2072"
reactions: 27
comments: 24
---

# Router context invalidate Promise resolve does not invalidate context

### Describe the bug

In the code below, which was suppose to invalidate the context and navigate to the following route. for context i'm following the example given in tanstack authenticated routes example. Even after navigation the context isn't invalidated which I can see in console log. It results in redirect to login page not working properly after clicking logout and just stuck in the "/" page.  

`router.invalidate().finally(() => {
          navigate({ to: "/" });
        });`

It only invalidates or I can see it invalidates when I manually reload the page, which means during the navigation the context doesn't invalidate.

PS: I do have an api request in the logout function.

### Your Example Website or App

...

### Steps to Reproduce the Bug or Issue

Following the tanstack example locally.

https://stackblitz.com/edit/tanstack-router-4achrw?file=src%2Froutes%2F_auth.tsx

### Expected behavior
Router context should've been already invalid in .finally or .then even before navigating.

### Screenshots or Videos

_No response_

### Platform

- OS: [e.g. macOS, Windows, Linux]
- Browser: [e.g. Chrome, Safari, Firefox]
- Version: [e.g. 91.1]


### Additional context

_No response_