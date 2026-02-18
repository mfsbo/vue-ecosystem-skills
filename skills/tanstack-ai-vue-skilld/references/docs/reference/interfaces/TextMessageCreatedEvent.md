---
id: TextMessageCreatedEvent
title: TextMessageCreatedEvent
---

# Interface: TextMessageCreatedEvent

Defined in: event-client.ts:85

Emitted when a message is created (user/assistant/system/tool).

## Extends

- `BaseEventContext`

## Extended by

- [`TextMessageUserEvent`](TextMessageUserEvent.md)

## Properties

### clientId?

```ts
optional clientId: string;
```

Defined in: event-client.ts:41

#### Inherited from

```ts
BaseEventContext.clientId
```

***

### content

```ts
content: string;
```

Defined in: event-client.ts:90

***

### hasTools?

```ts
optional hasTools: boolean;
```

Defined in: event-client.ts:50

#### Inherited from

```ts
BaseEventContext.hasTools
```

***

### messageCount?

```ts
optional messageCount: number;
```

Defined in: event-client.ts:49

#### Inherited from

```ts
BaseEventContext.messageCount
```

***

### messageId

```ts
messageId: string;
```

Defined in: event-client.ts:88

#### Overrides

```ts
BaseEventContext.messageId
```

***

### messageIndex?

```ts
optional messageIndex: number;
```

Defined in: event-client.ts:93

***

### model?

```ts
optional model: string;
```

Defined in: event-client.ts:44

#### Inherited from

```ts
BaseEventContext.model
```

***

### modelOptions?

```ts
optional modelOptions: Record<string, unknown>;
```

Defined in: event-client.ts:47

#### Inherited from

```ts
BaseEventContext.modelOptions
```

***

### options?

```ts
optional options: Record<string, unknown>;
```

Defined in: event-client.ts:46

#### Inherited from

```ts
BaseEventContext.options
```

***

### parts?

```ts
optional parts: MessagePart[];
```

Defined in: event-client.ts:91

***

### provider?

```ts
optional provider: string;
```

Defined in: event-client.ts:43

#### Inherited from

```ts
BaseEventContext.provider
```

***

### requestId?

```ts
optional requestId: string;
```

Defined in: event-client.ts:86

#### Overrides

```ts
BaseEventContext.requestId
```

***

### role

```ts
role: "user" | "assistant" | "tool" | "system";
```

Defined in: event-client.ts:89

***

### source?

```ts
optional source: "client" | "server";
```

Defined in: event-client.ts:42

#### Inherited from

```ts
BaseEventContext.source
```

***

### streamId?

```ts
optional streamId: string;
```

Defined in: event-client.ts:87

#### Overrides

```ts
BaseEventContext.streamId
```

***

### streaming?

```ts
optional streaming: boolean;
```

Defined in: event-client.ts:51

#### Inherited from

```ts
BaseEventContext.streaming
```

***

### systemPrompts?

```ts
optional systemPrompts: string[];
```

Defined in: event-client.ts:45

#### Inherited from

```ts
BaseEventContext.systemPrompts
```

***

### timestamp

```ts
timestamp: number;
```

Defined in: event-client.ts:37

#### Inherited from

```ts
BaseEventContext.timestamp
```

***

### toolCalls?

```ts
optional toolCalls: ToolCall[];
```

Defined in: event-client.ts:92

***

### toolNames?

```ts
optional toolNames: string[];
```

Defined in: event-client.ts:48

#### Inherited from

```ts
BaseEventContext.toolNames
```
