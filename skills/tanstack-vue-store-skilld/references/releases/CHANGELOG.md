# @tanstack/vue-store

## 0.9.1

### Patch Changes

- Updated dependencies [`77c872f`]:
  - @tanstack/store@0.9.1

## 0.9.0

### Minor Changes

- ## Breaking changes (#265)
  - `new Store()` is now `createStore()`
  - `new Derived()` is now a derived `createStore()`:
    ```ts
    const derived = createStore(() => store.state * 2)
    ```
  - `new Effect()` removed in favor of `store.subscribe()`:
    ```ts
    const { unsubscribe } = store.subscribe(() => {
      console.log(store.state)
    })
    ```
  - Uses alien-signals under the hood for efficient reactivity

### Patch Changes

- Updated dependencies [`dace25f`]:
  - @tanstack/store@0.9.0

## 0.8.1

### Patch Changes

- Updated dependencies [`3096bf2`]:
  - @tanstack/store@0.8.1
