---
number: 176
title: Server tool results missing from tool-call output field in UIMessage
type: other
state: open
created: 2025-12-23
url: "https://github.com/TanStack/ai/issues/176"
reactions: 1
comments: 2
---

# Server tool results missing from tool-call output field in UIMessage

### TanStack AI version

0.2.0

### Framework/Library version

react 18.2.0

### Describe the bug and the steps to reproduce it

**Summary:** Server-side tool results don't update the `tool-call` part's `output` field, causing inconsistent UI state between server and client tool execution.

**Expected behavior:** Both server-executed tools and client-executed tools should have their results visible on the `tool-call` part's `output` field, and the state should transition to `'complete'`.

**Actual behavior:** 
- Client tools: `tool-call` part shows `state: 'complete'` with `output` populated
- Server tools: `tool-call` part shows `state: 'input-complete'` with no `output` (result only exists in a separate `tool-result` part)

...