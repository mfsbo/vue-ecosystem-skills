---
id: ImageGenerationResult
title: ImageGenerationResult
---

# Interface: ImageGenerationResult

Defined in: types.ts:998

Result of image generation

## Properties

### id

```ts
id: string;
```

Defined in: types.ts:1000

Unique identifier for the generation

***

### images

```ts
images: GeneratedImage[];
```

Defined in: types.ts:1004

Array of generated images

***

### model

```ts
model: string;
```

Defined in: types.ts:1002

Model used for generation

***

### usage?

```ts
optional usage: object;
```

Defined in: types.ts:1006

Token usage information (if available)

#### inputTokens?

```ts
optional inputTokens: number;
```

#### outputTokens?

```ts
optional outputTokens: number;
```

#### totalTokens?

```ts
optional totalTokens: number;
```
