---
number: 226
title: `shallow` doesn't compare symbol properties
type: other
state: closed
created: 2025-08-28
url: "https://github.com/TanStack/store/issues/226"
reactions: 0
comments: 0
---

# `shallow` doesn't compare symbol properties

### Describe the bug

While investigating an issue in Apollo Client (https://github.com/apollographql/apollo-client/issues/12885) for a feature that integrates with `@tanstack/react-router`, we found that an old object was returned from the `loader` function when changing params. Apollo Client has a `preloadQuery` API that makes it possible to begin fetching in a `loader` function and use the returned object to then receive additional cache updates.

...