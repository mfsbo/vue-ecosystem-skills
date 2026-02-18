---
id: Subscribable
title: Subscribable
---

# Interface: Subscribable\<T\>

Defined in: types.ts:20

## Extends

- [`InteropSubscribable`](InteropSubscribable.md)\<`T`\>

## Extended by

- [`Readable`](Readable.md)
- [`BaseAtom`](BaseAtom.md)
- [`InternalBaseAtom`](InternalBaseAtom.md)

## Type Parameters

### T

`T`

## Properties

### subscribe

```ts
subscribe: (observer) => Subscription & (next, error?, complete?) => Subscription;
```

Defined in: types.ts:21

#### Overrides

[`InteropSubscribable`](InteropSubscribable.md).[`subscribe`](InteropSubscribable.md#subscribe)
