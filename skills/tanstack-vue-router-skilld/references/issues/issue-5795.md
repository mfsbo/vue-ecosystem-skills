---
number: 5795
title: "Could not resolve \"#tanstack-router-entry\""
type: other
state: open
created: 2025-11-08
url: "https://github.com/TanStack/router/issues/5795"
reactions: 11
comments: 43
labels: "[information needed]"
---

# Could not resolve "#tanstack-router-entry"

### Which project does this relate to?

Start

### Describe the bug

I'm out of town this weekend but was running into this so wanted to file this bug report sooner than later. 

I'm using alchemy, which wraps `cloudflare-vite` to run tanstack start. I haven't had time to create a clean reproduction but basically what seems to be happening, is that my auth service is created as an `Effect.Service` from `effect-ts`. One of the other deps coming is is my Drizzle postgres client from `'@effect/sql-drizzle/Pg'`. 

As soon as i import `import { auth } from '@repo/core/auth/handler'` into `server.ts` or `routes/api/auth/$.ts` my app blows up with the error below. `handler.ts` imports my Runtime from effect, which has all my app dependencies, which some are required for some of the `hooks` that better auth calls in the Effectful Better Auth instance. 

Possibly related to https://github.com/vitejs/vite/issues/20867#issuecomment-3431250189. I was seeing pre-bundling issues on later versions of vite. 

The web app producing this error is a basic `better-t-stack` templated start app, with the only changes adding in alchemy and dropping in my auth into the server route. Everything starts up fine without the eventual better-auth dependency as described above.

...