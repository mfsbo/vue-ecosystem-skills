---
id: ProcessorState
title: ProcessorState
---

# Interface: ProcessorState

Defined in: activities/chat/stream/types.ts:61

Current state of the processor

## Properties

### content

```ts
content: string;
```

Defined in: activities/chat/stream/types.ts:62

***

### done

```ts
done: boolean;
```

Defined in: activities/chat/stream/types.ts:67

***

### finishReason

```ts
finishReason: string | null;
```

Defined in: activities/chat/stream/types.ts:66

***

### thinking

```ts
thinking: string;
```

Defined in: activities/chat/stream/types.ts:63

***

### toolCallOrder

```ts
toolCallOrder: string[];
```

Defined in: activities/chat/stream/types.ts:65

***

### toolCalls

```ts
toolCalls: Map<string, InternalToolCallState>;
```

Defined in: activities/chat/stream/types.ts:64
