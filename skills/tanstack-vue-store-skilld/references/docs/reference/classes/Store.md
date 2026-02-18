---
id: Store
title: Store
---

# Class: Store\<T\>

Defined in: store.ts:4

## Type Parameters

### T

`T`

## Constructors

### Constructor

```ts
new Store<T>(getValue): Store<T>;
```

Defined in: store.ts:6

#### Parameters

##### getValue

(`prev?`) => `T`

#### Returns

`Store`\<`T`\>

### Constructor

```ts
new Store<T>(initialValue): Store<T>;
```

Defined in: store.ts:7

#### Parameters

##### initialValue

`T`

#### Returns

`Store`\<`T`\>

## Accessors

### state

#### Get Signature

```ts
get state(): T;
```

Defined in: store.ts:18

##### Returns

`T`

## Methods

### get()

```ts
get(): T;
```

Defined in: store.ts:21

#### Returns

`T`

***

### setState()

```ts
setState(updater): void;
```

Defined in: store.ts:15

#### Parameters

##### updater

(`prev`) => `T`

#### Returns

`void`

***

### subscribe()

```ts
subscribe(observerOrFn): Subscription;
```

Defined in: store.ts:24

#### Parameters

##### observerOrFn

[`Observer`](../type-aliases/Observer.md)\<`T`\> | (`value`) => `void`

#### Returns

[`Subscription`](../interfaces/Subscription.md)
