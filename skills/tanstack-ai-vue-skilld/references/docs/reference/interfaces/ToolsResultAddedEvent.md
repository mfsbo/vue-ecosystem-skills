---
id: ToolsResultAddedEvent
title: ToolsResultAddedEvent
---

# Interface: ToolsResultAddedEvent

Defined in: event-client.ts:209

Emitted when a client tool result is added.

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

### output

```ts
output: unknown;
```

Defined in: event-client.ts:212

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

Defined in: event-client.ts:38

#### Inherited from

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

### state

```ts
state: "output-available" | "output-error";
```

Defined in: event-client.ts:213

***

### streamId?

```ts
optional streamId: string;
```

Defined in: event-client.ts:39

#### Inherited from

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

### toolCallId

```ts
toolCallId: string;
```

Defined in: event-client.ts:210

***

### toolName

```ts
toolName: string;
```

Defined in: event-client.ts:211

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
