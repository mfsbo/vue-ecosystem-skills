---
number: 91
title: Unable to Pass API Key Directly to all Adapters
type: other
state: closed
created: 2025-12-05
url: "https://github.com/TanStack/ai/issues/91"
reactions: 0
comments: 3
---

# Unable to Pass API Key Directly to all Adapters

### TanStack AI version

@tanstack/ai v^0.0.1

### Framework/Library version

React v18.2.0

### Describe the bug and the steps to reproduce it

# Bug Report: Unable to Pass API Key Directly to Gemini Adapter

## Description

When attempting to pass the `apiKey` directly to the `gemini()` adapter function as shown in the documentation, TypeScript throws an error indicating that `apiKey` is not a valid property.

## Error Message

```
Object literal may only specify known properties, and 'apiKey' does not exist in type 'Omit<GeminiAdapterConfig, "apiKey">'.(2353)
(property) apiKey: string
```

## Code Example

```typescript
import { chat } from '@tanstack/ai';
import { gemini } from '@tanstack/ai-gemini';
import { NextResponse } from 'next/server';

const adapter = gemini({
  apiKey: process.env.GEMINI_API_KEY!, // Error occurs here
});

...