---
number: 6551
title: Something like `buildLocation` on the server
category: Q&A
created: 2026-01-29
url: "https://github.com/TanStack/router/discussions/6551"
upvotes: 3
comments: 0
answered: false
---

# Something like `buildLocation` on the server

There's currently nothing like `buildLocation` on the server side right?

I'm looking for the most ergonomic way to generate `callbackUrl`s on the server, for things like Stripe, that are url rewrite aware etc for a multi tenant app. Ideally I'd have some `buildLocation`/`linkOptions` interface to construct those urls, maybe I'd just prefix the correct tenant's origin 
`linkOptions` is of course available, but just a type helper.

I could also pass the `buildLocation` generated `callbackUrl` from the client to the server function, although I'd need to validate it and still think `buildLocation` would be really helpful on the server and simpler.

Any tips?