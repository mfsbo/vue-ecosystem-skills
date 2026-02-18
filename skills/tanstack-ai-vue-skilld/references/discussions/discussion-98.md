---
number: 98
title: Middleware support
category: General
created: 2025-12-05
url: "https://github.com/TanStack/ai/discussions/98"
upvotes: 2
comments: 1
answered: false
---

# Middleware support

Would love to see a middleware or plugin system that allows intercepting and transforming the chat flow.

So I'm building a memory integration package for Tanstack AI (already have for Vercel AI SDK using `wrapLanguageModel`). The goal is to:

1. Query relevant memories before each chat request
2. Inject them into the system prompt
3. Trigger memory extraction after the response completes

Without middleware, developers would need to manually orchestrate multiple steps but with middleware support, it could be as simple as:

```
const stream = chat({
  adapter: openai(),
  messages: modelMessages,
  middleware: [recallMiddleware()],
});
```

This would enable building integrations for cross-cutting concer...

---

## Top Comments

**@AlemTuzlak**:

What exactly would you want to transform and when? Would like to add this, but make it right and flexible for all use-cases