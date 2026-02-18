---
number: 4473
title: "Start: Full support by `@cloudflare/vite-plugin`"
type: other
state: closed
created: 2025-06-19
url: "https://github.com/TanStack/router/issues/4473"
reactions: 24
comments: 5
---

# Start: Full support by `@cloudflare/vite-plugin`

### Which project does this relate to?

Start

### Describe the bug

### Problem
Tanstack Start and `@cloudflare/vite-plugin` are not fully compatible with one another. For example, using virtual imports like `cloudflare:workflows` and `cloudflare:workers` causes issues; these can be marked external in vite but doing so will cause other issues during either build or deployment.

### Solution
@schiller-manuel mentioned he's talking with Cloudflare to improve Tanstack Start compatibility with `@cloudflare/vite-plugin`.

Creating a tracking issue so we can follow progress without bugging core team for status updates in Discord.

### Your Example Website or App

n/a

### Steps to Reproduce the Bug or Issue

..

### Expected behavior

Dev should be able to add `cloudflare()` from `@cloudflare/vite-plugin` to plugins in `vite.config.ts` to have access to all of the miniflare environment. It should automatically prevent issues when using cloudflare virtual imports from `cloudflare:workflows` and `cloudflare:workers`. Etc.

### Screenshots or Videos

_No response_

### Platform

- OS: macOS
- Browser: n/a
- Version: 
```json
"@cloudflare/vite-plugin": "^1.7.2",
"wrangler": "^4.20.3",
"@tanstack/react-query": "^5.80.10",
"@tanstack/react-router": "1.121.27",
"@tanstack/react-router-with-query": "1.121.27",
"@tanstack/react-start": "^1.121.27",
"@tanstack/router-core": "1.121.27",
"@tanstack/router-devtools-core": "1.121.27",
"@tanstack/router-generator": "1.121.27",
"@tanstack/router-plugin": "1.121.27",
```


### Additional context

_No response_

---

## Top Comments

**@schiller-manuel** (+6):

done now



https://tanstack.com/start/latest/docs/framework/react/hosting#cloudflare-workers--official-partner


**@Folyd** (+3):

The cloudflare host docs is outdated: 
https://tanstack.com/start/latest/docs/framework/react/hosting#cloudflare-pages

**@juliomuhlbauer** (+3):

Created an issue: https://github.com/TanStack/router/issues/4500