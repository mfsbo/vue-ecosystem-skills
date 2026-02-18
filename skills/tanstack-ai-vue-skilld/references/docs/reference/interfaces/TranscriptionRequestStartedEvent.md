---
id: TranscriptionRequestStartedEvent
title: TranscriptionRequestStartedEvent
---

# Interface: TranscriptionRequestStartedEvent

Defined in: event-client.ts:324

Emitted when a transcription request starts.

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

### language?

```ts
optional language: string;
```

Defined in: event-client.ts:328

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

### model

```ts
model: string;
```

Defined in: event-client.ts:327

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

### prompt?

```ts
optional prompt: string;
```

Defined in: event-client.ts:329

***

### provider

```ts
provider: string;
```

Defined in: event-client.ts:326

#### Overrides

```ts
BaseEventContext.provider
```

***

### requestId

```ts
requestId: string;
```

Defined in: event-client.ts:325

#### Overrides

```ts
BaseEventContext.requestId
```

***

### responseFormat?

```ts
optional responseFormat: string;
```

Defined in: event-client.ts:330

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

### toolNames?

```ts
optional toolNames: string[];
```

Defined in: event-client.ts:48

#### Inherited from

```ts
BaseEventContext.toolNames
```
