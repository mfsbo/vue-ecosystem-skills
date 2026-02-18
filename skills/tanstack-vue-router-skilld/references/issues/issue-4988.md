---
number: 4988
title: vite-plugin-pwa incompatible with tanstack start production builds
type: other
state: open
created: 2025-08-17
url: "https://github.com/TanStack/router/issues/4988"
reactions: 16
comments: 19
---

# vite-plugin-pwa incompatible with tanstack start production builds

### Which project does this relate to?

Start

### Describe the bug

vite-plugin-pwa's build steps (generate assets, generate serviceworker bundle) are seemingly not executed when running `vite build` with VitePWA() and `tanstackStart()` both present.

This is likely because to vite-plugin-pwa not having proper support for the Vite 6 environment API.
There is an open PR to solve this: https://github.com/vite-pwa/vite-plugin-pwa/pull/786, however the current state of this PR has the same issue as the stable version of the package.

No PWA/SW steps are ran in build:

<img width="1978" height="1572" alt="Image" src="https://github.com/user-attachments/assets/e44c44ab-9976-4a4f-a257-43e7a18b5cc7" />

but it works in the vite dev server:

<img width="3339" height="2406" alt="Image" src="https://github.com/user-attachments/assets/08428aeb-a519-42e4-9953-5c27d3855dc8" />

### Your Example Website or App

https://stackblitz.com/edit/github-djpcrmc9?file=src%2Frouter.tsx

### Steps to Reproduce the Bug or Issue

1. `npm install`
2. `npm run build`
3. No PWA/SW steps are ran in build:

### Expected behavior

- Build steps actually run during `vite build`
- Service worker gets built into tanstack start's `client-dist`, so it can also get picked up by nitro `publicAssets[]`
- Any script injection steps such as into <head/> also work(?)

### Screenshots or Videos

_No response_

### Platform

- Start Version: ^1.131.7
- OS: macOS, Stackblitz WebContainer
- Browser: Chrome
- Browser Version: 139.0.7258.66 
- Bundler: Vite
- Bundler Version: ^6.3.5


### Additional context

_No response_