---
number: 92
title: "Bug: gpt-5-nano and gpt-5-mini missing OpenAIReasoningOptions in type definitions"
type: other
state: closed
created: 2025-12-05
url: "https://github.com/TanStack/ai/issues/92"
reactions: 0
comments: 2
---

# Bug: gpt-5-nano and gpt-5-mini missing OpenAIReasoningOptions in type definitions

### TanStack AI version

v0.0.1

### Framework/Library version

typescript v5.9.3

### Describe the bug and the steps to reproduce it

The `gpt-5-nano` and `gpt-5-mini` models support reasoning tokens according to OpenAI's documentation, but `@tanstack/ai-openai` type definitions don't include `OpenAIReasoningOptions` for these models, causing TypeScript errors.

### OpenAI Documentation

- https://platform.openai.com/docs/models/gpt-5-nano
- https://platform.openai.com/docs/models/gpt-5-mini

### Steps to Reproduce

```typescript
import { chat, toStreamResponse } from "@tanstack/ai";
import { openai } from "@tanstack/ai-openai";

...