---
number: 6646
title: How to show NotFound component when route param validation fails?
category: Q&A
created: 2026-02-13
url: "https://github.com/TanStack/router/discussions/6646"
upvotes: 1
comments: 0
answered: false
---

# How to show NotFound component when route param validation fails?

I'm using TanStack Start with Zod validation for route params, and I want to show a NotFound component (or throw a notFound error) when param validation fails.

Here's my setup:

```tsx
import {createFileRoute, notFound} from '@tanstack/react-router'
import {zodValidator} from '@tanstack/zod-adapter'
import z from 'zod'

import NotFound from './components/NotFound'

const ALLOWED_TERMS = ['privacy', 'service', 'marketing'] as const

export const Route = createFileRoute('/$term')({
    component: RouteComponent,
    params: zodValidator(
        z.object({
            term: z.enum(ALLOWED_TERMS),
        }),
    ),
    // ... other options
})
```

**What I want to achieve:**
When a user navigates to /agreement/invalid-term (where "invalid-term" is not in the allowed...