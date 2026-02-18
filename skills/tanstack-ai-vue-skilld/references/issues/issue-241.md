---
number: 241
title: Websocket example type error
type: other
state: open
created: 2026-01-22
url: "https://github.com/TanStack/ai/issues/241"
reactions: 0
comments: 0
---

# Websocket example type error

### TanStack AI version

v0.2.2

### Framework/Library version

v0.2.2

### Describe the bug and the steps to reproduce it

The documentation shows an example websocket adapter here: https://tanstack.com/ai/latest/docs/guides/connection-adapters#websocket-adapter-example

However, when i attempt that it produces a type error since the `stream` utility expects the factory function to return an `AsyncIterable<StreamChunk>`, not a readable stream.

I'm using this in a react router app where the typescript compilerOptions target is ES2022 which i think has something to do with the problem. I get no error in the typescript playground if i leave it on the default value of ES2017

...