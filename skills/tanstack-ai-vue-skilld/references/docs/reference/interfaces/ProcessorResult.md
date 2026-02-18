---
id: ProcessorResult
title: ProcessorResult
---

# Interface: ProcessorResult

Defined in: activities/chat/stream/types.ts:51

Result from processing a stream

## Properties

### content

```ts
content: string;
```

Defined in: activities/chat/stream/types.ts:52

***

### finishReason?

```ts
optional finishReason: string | null;
```

Defined in: activities/chat/stream/types.ts:55

***

### thinking?

```ts
optional thinking: string;
```

Defined in: activities/chat/stream/types.ts:53

***

### toolCalls?

```ts
optional toolCalls: ToolCall[];
```

Defined in: activities/chat/stream/types.ts:54
