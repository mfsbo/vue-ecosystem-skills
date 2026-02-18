---
number: 170
title: createServerFnTool mentioned in README does not exist in the package
type: other
state: closed
created: 2025-12-22
url: "https://github.com/TanStack/ai/issues/170"
reactions: 0
comments: 2
---

# createServerFnTool mentioned in README does not exist in the package

### TanStack AI version

0.1.0

### Framework/Library version

React  19.2

### Describe the bug and the steps to reproduce it

The README at line 82 references a function called createServerFnTool from @tanstack/ai-react:

import { createServerFnTool } from '@tanstack/ai-react'

// Define once, get AI tool AND server function (TanStack Start only)
const getProducts = createServerFnTool({
  name: 'getProducts',
  inputSchema: z.object({ query: z.string() }),
  execute: async ({ query }) => db.products.search(query),
})

// Use in AI chat
chat({ tools: [getProducts.server] })

...