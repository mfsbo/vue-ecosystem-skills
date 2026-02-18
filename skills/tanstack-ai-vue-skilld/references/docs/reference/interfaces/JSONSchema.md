---
id: JSONSchema
title: JSONSchema
---

# Interface: JSONSchema

Defined in: types.ts:25

JSON Schema type for defining tool input/output schemas as raw JSON Schema objects.
This allows tools to be defined without schema libraries when you have JSON Schema definitions available.

## Indexable

```ts
[key: string]: any
```

## Properties

### $defs?

```ts
optional $defs: Record<string, JSONSchema>;
```

Defined in: types.ts:35

***

### $ref?

```ts
optional $ref: string;
```

Defined in: types.ts:34

***

### additionalItems?

```ts
optional additionalItems: boolean | JSONSchema;
```

Defined in: types.ts:56

***

### additionalProperties?

```ts
optional additionalProperties: boolean | JSONSchema;
```

Defined in: types.ts:55

***

### allOf?

```ts
optional allOf: JSONSchema[];
```

Defined in: types.ts:37

***

### anyOf?

```ts
optional anyOf: JSONSchema[];
```

Defined in: types.ts:38

***

### const?

```ts
optional const: unknown;
```

Defined in: types.ts:31

***

### default?

```ts
optional default: unknown;
```

Defined in: types.ts:33

***

### definitions?

```ts
optional definitions: Record<string, JSONSchema>;
```

Defined in: types.ts:36

***

### description?

```ts
optional description: string;
```

Defined in: types.ts:32

***

### else?

```ts
optional else: JSONSchema;
```

Defined in: types.ts:43

***

### enum?

```ts
optional enum: unknown[];
```

Defined in: types.ts:30

***

### examples?

```ts
optional examples: unknown[];
```

Defined in: types.ts:62

***

### exclusiveMaximum?

```ts
optional exclusiveMaximum: number;
```

Defined in: types.ts:47

***

### exclusiveMinimum?

```ts
optional exclusiveMinimum: number;
```

Defined in: types.ts:46

***

### format?

```ts
optional format: string;
```

Defined in: types.ts:51

***

### if?

```ts
optional if: JSONSchema;
```

Defined in: types.ts:41

***

### items?

```ts
optional items: JSONSchema | JSONSchema[];
```

Defined in: types.ts:28

***

### maximum?

```ts
optional maximum: number;
```

Defined in: types.ts:45

***

### maxItems?

```ts
optional maxItems: number;
```

Defined in: types.ts:53

***

### maxLength?

```ts
optional maxLength: number;
```

Defined in: types.ts:49

***

### maxProperties?

```ts
optional maxProperties: number;
```

Defined in: types.ts:60

***

### minimum?

```ts
optional minimum: number;
```

Defined in: types.ts:44

***

### minItems?

```ts
optional minItems: number;
```

Defined in: types.ts:52

***

### minLength?

```ts
optional minLength: number;
```

Defined in: types.ts:48

***

### minProperties?

```ts
optional minProperties: number;
```

Defined in: types.ts:59

***

### not?

```ts
optional not: JSONSchema;
```

Defined in: types.ts:40

***

### oneOf?

```ts
optional oneOf: JSONSchema[];
```

Defined in: types.ts:39

***

### pattern?

```ts
optional pattern: string;
```

Defined in: types.ts:50

***

### patternProperties?

```ts
optional patternProperties: Record<string, JSONSchema>;
```

Defined in: types.ts:57

***

### properties?

```ts
optional properties: Record<string, JSONSchema>;
```

Defined in: types.ts:27

***

### propertyNames?

```ts
optional propertyNames: JSONSchema;
```

Defined in: types.ts:58

***

### required?

```ts
optional required: string[];
```

Defined in: types.ts:29

***

### then?

```ts
optional then: JSONSchema;
```

Defined in: types.ts:42

***

### title?

```ts
optional title: string;
```

Defined in: types.ts:61

***

### type?

```ts
optional type: string | string[];
```

Defined in: types.ts:26

***

### uniqueItems?

```ts
optional uniqueItems: boolean;
```

Defined in: types.ts:54
