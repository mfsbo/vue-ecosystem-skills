---
number: 3462
title: Error thrown from `beforeLoad` and handled through `errorComponent` is ignored on initial request
type: other
state: closed
created: 2025-02-17
url: "https://github.com/TanStack/router/issues/3462"
reactions: 28
comments: 5
---

# Error thrown from `beforeLoad` and handled through `errorComponent` is ignored on initial request

### Which project does this relate to?

Start

### Describe the bug

When an error is thrown from `beforeLoad` and handled through`errorComponent` it only works  as expected on client navigation. When the page is reloaded/first requested the return for `errorComponent` is ignored and `component`/rest of the tree is rendered. This breaks many auth setups currently.

### Your Example Website or App

https://tanstack.com/start/latest/docs/framework/react/examples/start-basic-auth

### Steps to Reproduce the Bug or Issue

This can be reproduced using the Start Basic Auth example.

1. Navigate to "Posts" – the login is shown  
2. Now reload the "Posts" page – error is shown instead of login 

This error is shown:

> posts is not iterable

You can also add a `console.log` to `app/routes/_authed/posts.tsx`. This shows it tries to render the component, even though we are still unauthenticated and `beforeLoad` in `app/routes/_authed.tsx` throws an error which is handled by `errorComponent`, which should prevent rendering of the posts/`component`.


### Expected behavior

When throwing an error from `beforeLoad` and handling it within `errorComponent` the `component` should not be rendered – even on intial request handled by the server without client side navigation.

### Screenshots or Videos

https://github.com/user-attachments/assets/8fe225d8-be5b-4ef8-9e4b-8d6731ffa785

### Platform

- OS: macOS
- Browser: Chromium
- Version: 133


### Additional context

_No response_

---

## Top Comments

**@KiwiKilian** (+8):

Until the bug is fixed our workaround looks like this:
- `redirect` to `/login` instead of throwing an error
- Move the `Login` component to that `/login` page
- Append the path the user actually wanted to access as a search param
- Redirect back to the search param path on successful login.

**@Grimthul**:

Having the exact same issue. It happens even on more trivial case, where I try to redirect in beforeLoad function. 
```
export const Route = createFileRoute("/_auth")({
    beforeLoad: ({ context }) => {
        console.log("auth before load", context, !context.user);
        if (!context.user) {
            throw redirect({ to: "/login", search: { redirect: location.href } });
        }
    },
});
```
Even when the user is null, it does not redirect but goes directly to the page that should be under authentication. 
Also it logs Hydration failed errors to the console.  


**@Grimthul**:

One more thing, in the demo, when I try to change the beforeLoad function in _authed:
```
export const Route = createFileRoute('/_authed')({
  beforeLoad: ({ context }) => {
    if (!context.user) {
      throw new Error('Not authenticated')
    }
  },
  errorComponent: ({ error }) => {
    if (error.message === 'Not authenticated') {
      return <Login />
    }

    throw error
  },
})
```
to loader function:
```
export const Route = createFileRoute("/_authed")({
  loader: ({ context }) => {
    if (!context.user) {
      throw new Error("Not authenticated");
    }
  },
  errorComponent: ({ error }) => {
    if (error.message === "Not authenticated") {
      return <Login />;
    }

...