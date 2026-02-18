---
number: 216
title: "Gemini 3 Flash: Function call is missing a thought_signature in functionCall parts"
type: other
state: open
created: 2026-01-08
url: "https://github.com/TanStack/ai/issues/216"
reactions: 0
comments: 1
---

# Gemini 3 Flash: Function call is missing a thought_signature in functionCall parts

### TanStack AI version

0.2.2

### Framework/Library version

tanstack/ai@0.2.2 @tanstack/ai-gemini@0.3.2

### Describe the bug and the steps to reproduce it

hi there!

When I switch from gemini 2.5 flash to gemini 3.0 I encounter the following error:

```
error: {"error":{"code":400,"message":"Function call is missing a thought_signature in functionCall parts. This is required for tools to work correctly, and missing thought_signature may lead to degraded model performance. Additional data, function call `default_api:sum_tool` , position 2. Please refer to https://ai.google.dev/gemini-api/docs/thought-signatures for more details.","status":"INVALID_ARGUMENT"}}
```

I am running it via bun 1.3.5 on a MBA1 on macos 26.2

Sample reproduction code:

...