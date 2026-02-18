---
number: 285
title: "[ERROR] No matching export in \"../../node_modules/.bun/solid-js@1.9.11/node_modules/solid-js/web/dist/server.js\" for import \"use\""
type: other
state: open
created: 2026-02-11
url: "https://github.com/TanStack/ai/issues/285"
reactions: 0
comments: 0
---

# [ERROR] No matching export in "../../node_modules/.bun/solid-js@1.9.11/node_modules/solid-js/web/dist/server.js" for import "use"

### TanStack AI version

latest

### Framework/Library version

v19

### Describe the bug and the steps to reproduce it

When I use the tanstack cli with `npx @tanstack/cli@latest create web --tailwind --add-ons cloudflare,clerk,convex,start,store,ai,form,table,tanstack-query,sentry,oRPC,compiler,t3env,biome` to bootstrap my app, I get the following error when trying to run it:

```
✘ [ERROR] No matching export in "../../node_modules/.bun/solid-js@1.9.11/node_modules/solid-js/web/dist/server.js" for import "setStyleProperty"

    ../../node_modules/.bun/@tanstack+ai-devtools-core@0.3.2+ef8ba510a99729f5/node_modules/@tanstack/ai-devtools-core/dist/esm/components/list/ConversationRow.js:1:77:
      1 │ ...lassName, setAttribute, setStyleProperty, delegateEvents } from ...
        ╵                            ~~~~~~~~~~~~~~~~


✘ [ERROR] No matching export in "../../node_modules/.bun/solid-js@1.9.11/node_modules/solid-js/web/dist/server.js" for import "use"

...