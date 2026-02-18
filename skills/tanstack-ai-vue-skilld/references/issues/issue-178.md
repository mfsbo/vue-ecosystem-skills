---
number: 178
title: Unable to assign JSON Schema to toolDefinition
type: other
state: closed
created: 2025-12-23
url: "https://github.com/TanStack/ai/issues/178"
reactions: 0
comments: 1
---

# Unable to assign JSON Schema to toolDefinition

### TanStack AI version

0.2.0

### Framework/Library version

TypeScript, Node

### Describe the bug and the steps to reproduce it

Hi, 

I have come across a small type related issue when assigning JSON Schema to tool definitions via factory function. The issue appears to be caused by the `JSONSchema` type used to constrain `toolDefinition` signature. Reproduction code below.

[Reproduction | Example](https://www.typescriptlang.org/play/?target=99&module=7#code/JYWwDg9gTgLgBAbzjCEA2ARApgM2AO2BmAnzgF84coIQ4ByAARgEN8BnVgYwGsB6FsHoAoYXz5wAtNJmy58hYqXLpYiQGEW7LHACCALjgBRKDShqpKq9ZvzhWAB6RYcAjCxQcLLjoAaAZRgoAgBzRGE4ZABPMCxDek5g-BCRcmEcAFd8LmJSOETQgAoASkMAoNDwyKgsGAyoMiQYGLiGAuT6CmE0rlJOPTgAXmRUTFwCIhJ8QqRxBnKklNd2OHwIeC12YBD8FgAjNB0UaNiGfy4ACywQFgBJfDAM+AAfOCyAE3H8LHf6ADoIq4Hk9zlcboZ2iESgAaQG...