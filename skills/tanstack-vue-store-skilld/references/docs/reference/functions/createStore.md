---
id: createStore
title: createStore
---

# Function: createStore()

## Call Signature

```ts
function createStore<T>(getValue): ReadonlyStore<T>;
```

Defined in: store.ts:55

### Type Parameters

#### T

`T`

### Parameters

#### getValue

(`prev?`) => `T`

### Returns

[`ReadonlyStore`](../classes/ReadonlyStore.md)\<`T`\>

## Call Signature

```ts
function createStore<T>(initialValue): Store<T>;
```

Defined in: store.ts:58

### Type Parameters

#### T

`T`

### Parameters

#### initialValue

`T`

### Returns

[`Store`](../classes/Store.md)\<`T`\>
