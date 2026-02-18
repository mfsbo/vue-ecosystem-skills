---
number: 173
title: gpt 5 chat model names are incorrect
type: other
state: closed
created: 2025-12-22
url: "https://github.com/TanStack/ai/issues/173"
reactions: 0
comments: 1
---

# gpt 5 chat model names are incorrect

### TanStack AI version

v0.2.0

### Framework/Library version

hono 1.19.6

### Describe the bug and the steps to reproduce it

Try 
```ts
  const adapter = openaiText("gpt-5.2-chat", {
    apiKey: process.env.OPENAI_API_KEY,
  })
```
but it fails saying the model is not available.

```
>>> chatStream: Fatal error during response creation <<<
>>> Error message: 400 The requested model 'gpt-5.2-chat' does not exist.
>>> Error stack: Error: 400 The requested model 'gpt-5.2-chat' does not exist.
    at APIError.generate (/Users/b/c/flightcontrol2/node_modules/.pnpm/openai@6.15.0_ws@8.17.1_zod@4.2.1/node_modules/openai/src/core/error.ts:72:14)
    at OpenAI.makeStatusError (/Users/b/c/flightcontrol2/node_modules/.pnpm/openai@6.15.0_ws@8.17.1_zod@4.2.1/node_modules/openai/src/client.ts:478:28)
    at OpenAI.makeRequest (/Users/b/c/flightcontrol2/node_modules/.pnpm/openai@6.15.0_ws@8.17.1_zod@4.2.1/node_modules/openai/src/client.ts:728:24)
    at process.processTicksAndRejections (node:internal/process/task_queues:103:5)
    at async OpenAITextAdapter.chatStream (/Users/b/c/flightcontrol2/node_modules/.pnpm/@tanstack+ai-openai@0.2.0_@tanstack+ai@0.2.0_ws@8.17.1_zod@4.2.1/node_modules/@tanstack/ai-openai/src/adapters/text.ts:109:24)
```...