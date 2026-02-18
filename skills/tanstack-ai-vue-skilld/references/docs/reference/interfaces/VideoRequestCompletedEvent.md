---
id: VideoRequestCompletedEvent
title: VideoRequestCompletedEvent
---

# Interface: VideoRequestCompletedEvent

Defined in: event-client.ts:367

Emitted when a video request completes.

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

### duration

```ts
duration: number;
```

Defined in: event-client.ts:377

***

### error?

```ts
optional error: string;
```

Defined in: event-client.ts:376

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

### jobId?

```ts
optional jobId: string;
```

Defined in: event-client.ts:372

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

Defined in: event-client.ts:370

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

### progress?

```ts
optional progress: number;
```

Defined in: event-client.ts:374

***

### provider

```ts
provider: string;
```

Defined in: event-client.ts:369

#### Overrides

```ts
BaseEventContext.provider
```

***

### requestId

```ts
requestId: string;
```

Defined in: event-client.ts:368

#### Overrides

```ts
BaseEventContext.requestId
```

***

### requestType

```ts
requestType: "url" | "create" | "status";
```

Defined in: event-client.ts:371

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

### status?

```ts
optional status: "pending" | "processing" | "completed" | "failed";
```

Defined in: event-client.ts:373

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

***

### url?

```ts
optional url: string;
```

Defined in: event-client.ts:375
