---
number: 233
title: "aiEventClient fails to emit events (e.g., usage:tokens) in Node.js/Server environments"
type: other
state: closed
created: 2026-01-17
url: "https://github.com/TanStack/ai/issues/233"
reactions: 0
comments: 0
---

# aiEventClient fails to emit events (e.g., usage:tokens) in Node.js/Server environments

### TanStack AI version

v0.2.2

### Framework/Library version

React v19.2.3

### Describe the bug and the steps to reproduce it

The global aiEventClient singleton in @tanstack/ai does not seem to emit events when the chat function is executed. Subscribing to events via aiEventClient.on() or aiEventClient.onAllPluginEvents() yields no output, even though the AI stream is successfully consumed and returns content.

...