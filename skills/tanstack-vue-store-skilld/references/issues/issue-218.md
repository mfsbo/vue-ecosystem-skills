---
number: 218
title: `shallow` doesn't correctly compare different object instances if they only have property getters
type: other
state: open
created: 2025-07-22
url: "https://github.com/TanStack/store/issues/218"
reactions: 2
comments: 0
---

# `shallow` doesn't correctly compare different object instances if they only have property getters

### Describe the bug

I'm using `@tanstack/react-form`, but traced the issue back to the store here. Specifically, I'm trying to store `Temporal.Duration` values, but store updates are not being received via `useStore` because `shallow` returns true when both objects have no `keys`, i.e. `Object.keys(objA)` return `[]`, instead of comparing referential equality at that point.

### Steps to Reproduce the Bug or Issue

This, and any object factory that use getters instead of static properties return true.
```ts
shallow(Temporal.Duration.from({ hours: 1 }), Temporal.Duration.from({ days: 2 }));
```

### Expected behavior

Expect to see false, since they are different values, different objects.

### Screenshots or Videos

_No response_

### Platform

...