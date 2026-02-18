---
number: 219
title: Configurable 'clean url' in client router
type: other
state: closed
created: 2021-02-03
url: "https://github.com/vuejs/vitepress/issues/219"
reactions: 12
comments: 4
---

# Configurable 'clean url' in client router

**Is your feature request related to a problem? Please describe.**

In production it may be desirable to strip the `.html` extension in urls. Of course this isn't a direct concern of vitepress, and typically static hosts provide a turnkey setting to do this e.g; https://vercel.com/docs/configuration#project/clean-urls

However the client side router will append `.html` to the history push state when navigating:

- https://github.com/vuejs/vitepress/blob/master/src/client/app/router.ts#L47

This will result in an extra server redirects when e.g. sharing urls, doing hard reloads; that ideally could be avoided.

**Describe the solution you'd like**

To be able to configure this `.html` appending behaviour on the client router :)