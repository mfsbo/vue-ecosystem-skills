---
number: 6243
title: How to implement standalone modal routes?
category: Q&A
created: 2025-12-29
url: "https://github.com/TanStack/router/discussions/6243"
upvotes: 4
comments: 0
answered: false
---

# How to implement standalone modal routes?

I'm trying to accomplish the following.

I want to add a route to my application (`/settings`). It's got subroutes, layout logic etc; A proper, serious route like any other.

There is one thing which is special about it:
The uppermost layout component of this route makes it a _modal_. It's a little silly if the background behind a model disappears when it opens, so I'd like to keep the background in place.

Essentially, I'd like to have two routes rendered at the same time:
- The live route
- The previous route, if one exists

If no previous route exists, nothing should be rendered in the background.

I can come up with all sorts of workarounds but none are great. Ideally, this modal route is an actual, true self-standing route.
[A similar discussion](https://github.com/TanSt...