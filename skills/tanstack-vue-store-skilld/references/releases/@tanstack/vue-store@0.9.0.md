---
tag: @tanstack/vue-store@0.9.0
version: 0.9.0
published: 2026-02-17
---

# @tanstack/vue-store@0.9.0

### Minor Changes

-   ## Breaking changes (#265)
    -   `new Store()` is now `createStore()`
    -   `new Derived()` is now a derived `createStore()`:
        ```ts
        const derived = createStore(() => store.state * 2)
        ```
    -   `new Effect()` removed in favor of `store.subscribe()`:
        ```ts
        const { unsubscribe } = store.subscribe(() => {
          console.log(store.state)
        })
        ```
    -   Uses alien-signals under the hood for efficient reactivity

### Patch Changes

-   Updated dependencies \[`dace25f`]:
    -   @tanstack/store@0.9.0
