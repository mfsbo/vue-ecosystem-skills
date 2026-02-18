---
number: 6391
title: Handling Auth with TanStack Start and TanStack Router
category: Q&A
created: 2026-01-16
url: "https://github.com/TanStack/router/discussions/6391"
upvotes: 3
comments: 1
answered: false
---

# Handling Auth with TanStack Start and TanStack Router

**Preface:**
I'm trying to handle authentication on my front-end using TanStack Start and TanStack Router, protected routes, user data, etc. I am running my own Node.JS back-end that, when authenticates a user, sets two HttpOnly cookies (refresh token and access token).

I'd like to be able to have protected routes and know which user is currently logged in in my front-end, however, I'm not sure what the correct approach might be. I'd like to be able to utilize the `beforeLoad()` functionality, but I've not found a solution that will allow me to use it. I've tried using a React context (an auth context), and I've tried using server functions provided by TanStack Start. 

When trying to use a context, I run into the issue where I can't properly set the context so that it is usable in a...