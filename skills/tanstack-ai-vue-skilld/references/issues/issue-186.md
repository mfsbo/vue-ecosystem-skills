---
number: 186
title: OpenAI structure output union
type: other
state: closed
created: 2025-12-25
url: "https://github.com/TanStack/ai/issues/186"
reactions: 0
comments: 10
---

# OpenAI structure output union

### TanStack AI version

0.2.0

### Framework/Library version

vanilla 0.2.0

### Describe the bug and the steps to reproduce it

Structured output doesn't support for unions:

```ts
chat({
  adapter: openaiText("gpt-4o-mini"),
  messages: [{ role: "user", content: "..." }],
  outputSchema: z.object({
    u: z.union([
      z.object({ a: z.string() }), 
      z.object({ b: z.number() })
    ]),
  }),
});

// throw {
//   message: "Invalid schema for response_format 'structured_output': In context=('properties', 'u', 'anyOf', '0'), 'additionalProperties' is required to be supplied and to be false.",
//   type: "invalid_request_error",
//   param: "text.format.schema",
//   code: "invalid_json_schema",
// }
```

...