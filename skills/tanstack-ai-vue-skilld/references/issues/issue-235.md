---
number: 235
title: tool definition does not infer types in .server and .client
type: other
state: open
created: 2026-01-18
url: "https://github.com/TanStack/ai/issues/235"
reactions: 3
comments: 5
---

# tool definition does not infer types in .server and .client

### TanStack AI version

v0.2.2

### Framework/Library version

v19.2.3

### Describe the bug and the steps to reproduce it

Tanstack ai docs mention that tool definition is fully typesafe.

But the client function shows input as unknown.

<img width="935" height="667" alt="Image" src="https://github.com/user-attachments/assets/dea691ee-dff2-49b4-b4d1-504856591bb6" />

Minimal repro:
```
import { toolDefinition } from '@tanstack/ai'
import z from 'zod'

export const saveToLocalStorageDef = toolDefinition({
  name: 'save_to_local_storage',
  description: 'Save data to browser local storage',
  inputSchema: z.object({
    key: z.string().describe('Storage key'),
    value: z.string().describe('Value to store'),
  }),
  outputSchema: z.object({
    saved: z.boolean(),
  }),
})

...

---

## Top Comments

**@nauvalazhar**:

What framework are you using? I can infer the type in TanStack Start, though.

<img width="690" height="475" alt="Image" src="https://github.com/user-attachments/assets/73c19f64-471a-407e-9f9d-e1f9faa77456" />

**@satvikreddy**:

I am using tanstack start.

You can check out this codesandbox as well. Same issue in this.


**@eastack**:

Have you installed @standard-schema/spec?

https://github.com/TanStack/ai/discussions/191

<img width="869" height="455" alt="Image" src="https://github.com/user-attachments/assets/e9bc2e3b-dc7d-45af-bfa2-e9a409308b5e" />