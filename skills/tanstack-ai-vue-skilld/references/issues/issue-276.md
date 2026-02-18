---
number: 276
title: `convertSchemaToJsonSchema` works incorrectly for arktype
type: other
state: open
created: 2026-02-08
url: "https://github.com/TanStack/ai/issues/276"
reactions: 0
comments: 0
---

# `convertSchemaToJsonSchema` works incorrectly for arktype

### TanStack AI version

v0.4.2

### Framework/Library version

React v19.2.0, Arktype v2.1.28

### Describe the bug and the steps to reproduce it

`convertSchemaToJsonSchema` returns a function instead of object. I ran into this while trying to use the openrouter adapter. The openrouter sdk does it's own validation and did not accept the tool schema.

```ts
import { type } from "arktype";
import { convertSchemaToJsonSchema } from "@tanstack/ai";

describe("convertSchemaToJsonSchema", () => {
  it("returns an object", () => {
    const schema = type({
      foo: "boolean",
    });
    const jsonschema = convertSchemaToJsonSchema(schema);
    expect(typeof jsonschema).toEqual("object");
    // Expected: "object"
    // Received: "function"
  });
});
```

...