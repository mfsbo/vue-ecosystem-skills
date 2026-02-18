---
number: 265
title: Anthropic adapter passes `null` tool input when model produces empty tool_use block, causing agent loop to stall
type: other
state: open
created: 2026-02-06
url: "https://github.com/TanStack/ai/issues/265"
reactions: 0
comments: 0
---

# Anthropic adapter passes `null` tool input when model produces empty tool_use block, causing agent loop to stall

### TanStack AI version

v0.3.0

### Framework/Library version

React v19.2.4

### Describe the bug and the steps to reproduce it

### TanStack AI version

0.3.0 (`@tanstack/ai` and `@tanstack/ai-anthropic`)

### Framework/Library version

React 19.2.4, Cloudflare Workers (Hono 4.11)

### Describe the bug

When Claude occasionally produces a `tool_use` content block with no `input_json_delta` events (or with `"null"` as the partial JSON), the Anthropic adapter's `content_block_stop` handler passes `null` as the parsed input instead of defaulting to `{}`.

...