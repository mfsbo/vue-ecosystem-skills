---
number: 103
title: Broken stream type exports from @tanstack/ai
type: other
state: closed
created: 2025-12-06
url: "https://github.com/TanStack/ai/issues/103"
reactions: 0
comments: 1
---

# Broken stream type exports from @tanstack/ai

### TanStack AI version

v0.0.2

### Framework/Library version

Vanilla

### Describe the bug and the steps to reproduce it

Due to a bug in `@tanstack/vite-config`, a type error has gone undetected.

The current `index.ts` file exports from `'./stream'`. This export does not exist, and should map to `./stream/index.ts`. For some reason, this is instead generating the following:

<img width="1002" height="84" alt="Image" src="https://github.com/user-attachments/assets/5cb31171-debd-48f6-810b-b8014c83b617" />

This can be fixed by instead exporting from `'./stream/index'`:

<img width="488" height="74" alt="Image" src="https://github.com/user-attachments/assets/a7ddcefd-6317-4fac-9718-8ad08d29732b" />

...