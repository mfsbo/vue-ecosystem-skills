---
number: 6379
title: Nitro useStorage not working
category: Q&A
created: 2026-01-13
url: "https://github.com/TanStack/router/discussions/6379"
upvotes: 1
comments: 0
answered: false
---

# Nitro useStorage not working

Hi everyone, today I was trying to use from inside a serveFn a function the Nitro machinery, in particular `useStorage` for the server-side asset import.
Here an example repository made today from tanstack-start: https://github.com/eisterman/bug-usestorage
It seems that it's not possible to use some Nitro features from inside Tanstack Start.

During my investigation I found the following things:
- Using `"nitro": "latest"` make the program simply crash at the import of `useStorage()`. Using instead `"nitro": "npm:nitro-nightly@latest" fix the crash.
- Even with the cash fixed, calling useStorage just doesn't work returning null and raising a warning in console about missing Nitro builder or plugin.
- I have tried swapping the order of `nitro()` and `tanstackStart()` Vite plugins, bu...