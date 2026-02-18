---
number: 6483
title: @tanstack/router-is-server not published to npm - breaks 1.157.0 installs
type: other
state: closed
created: 2026-01-24
url: "https://github.com/TanStack/router/issues/6483"
reactions: 22
comments: 7
---

# @tanstack/router-is-server not published to npm - breaks 1.157.0 installs

`@tanstack/router-core@1.157.0` depends on `@tanstack/router-is-server@1.127.3`, but this package was never published to npm:

```
bun info @tanstack/router-is-server
404 Not Found: https://registry.npmjs.org/@tanstack%2frouter-is-server

 - '@tanstack/router-is-server@latest' does not exist in this registry
```

- v1.157.0 was released today (Jan 24) via #4648
- `router-is-server` exists in the monorepo (`packages/router-is-server`) but isn't on npm
- Any fresh install of TanStack Router 1.157.0 fails with a 404

Pinning to 1.156.0 right now. Assuming this is a publishing delay?

---

## Top Comments

**@Rizwan-Hasan**:

Facing the same problem

```shell
> bun install                                                                  
bun install v1.3.5-canary.1 (fa5a5bbe)
error: GET https://registry.npmjs.org/@tanstack%2frouter-is-server - 404
error: @tanstack/router-is-server@1.127.3 failed to resolve
```

**@vannamphuc**:

Same

**@kainbryanjones**:

Same here  