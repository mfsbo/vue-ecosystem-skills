---
id: TextRequestCompletedEvent
title: TextRequestCompletedEvent
---

# Interface: TextRequestCompletedEvent

Defined in: event-client.ts:70

Emitted when a text request completes with final output.

## Extends

- `BaseEventContext`

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

Defined in: event-client.ts:75

***

### duration?

```ts
optional duration: number;
```

Defined in: event-client.ts:78

***

### finishReason?

```ts
optional finishReason: string;
```

Defined in: event-client.ts:76

***

### hasTools

```ts
hasTools: boolean;
```

Defined in: event-client.ts:81

#### Overrides

```ts
BaseEventContext.hasTools
```

***

### messageCount

```ts
messageCount: number;
```

Defined in: event-client.ts:80

#### Overrides

```ts
BaseEventContext.messageCount
```

***

### messageId?

```ts
optional messageId: string;
```

Defined in: event-client.ts:40

#### Inherited from

```ts
BaseEventContext.messageId
```

***

### model

```ts
model: string;
```

Defined in: event-client.ts:74

#### Overrides

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

### provider

```ts
provider: string;
```

Defined in: event-client.ts:73

#### Overrides

```ts
BaseEventContext.provider
```

***

### requestId

```ts
requestId: string;
```

Defined in: event-client.ts:71

#### Overrides

```ts
BaseEventContext.requestId
```

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

### streamId

```ts
streamId: string;
```

Defined in: event-client.ts:72

#### Overrides

```ts
BaseEventContext.streamId
```

***

### streaming

```ts
streaming: boolean;
```

Defined in: event-client.ts:79

#### Overrides

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

### toolNames?

```ts
optional toolNames: string[];
```

Defined in: event-client.ts:48

#### Inherited from

```ts
BaseEventContext.toolNames
```

***

### usage?

```ts
optional usage: TokenUsage;
```

Defined in: event-client.ts:77
