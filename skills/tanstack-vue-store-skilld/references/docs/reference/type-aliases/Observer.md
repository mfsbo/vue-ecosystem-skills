---
id: Observer
title: Observer
---

# Type Alias: Observer\<T\>

```ts
type Observer<T> = object;
```

Defined in: types.ts:10

## Type Parameters

### T

`T`

## Properties

### complete()?

```ts
optional complete: () => void;
```

Defined in: types.ts:13

#### Returns

`void`

***

### error()?

```ts
optional error: (err) => void;
```

Defined in: types.ts:12

#### Parameters

##### err

`unknown`

#### Returns

`void`

***

### next()?

```ts
optional next: (value) => void;
```

Defined in: types.ts:11

#### Parameters

##### value

`T`

#### Returns

`void`
