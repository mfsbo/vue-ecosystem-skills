---
id: UIMessage
title: UIMessage
---

# Interface: UIMessage

Defined in: types.ts:325

UIMessage - Domain-specific message format optimized for building chat UIs
Contains parts that can be text, tool calls, or tool results

## Properties

### createdAt?

```ts
optional createdAt: Date;
```

Defined in: types.ts:329

***

### id

```ts
id: string;
```

Defined in: types.ts:326

***

### parts

```ts
parts: MessagePart[];
```

Defined in: types.ts:328

***

### role

```ts
role: "user" | "assistant" | "system";
```

Defined in: types.ts:327
