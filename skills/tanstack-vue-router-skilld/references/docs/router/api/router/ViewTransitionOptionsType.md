---
id: ViewTransitionOptionsType
title: ViewTransitionOptions type
---

The `ViewTransitionOptions` type is used to define a
viewTransition type.

```tsx
interface ViewTransitionOptions {
  types:
    | Array<string>
    | ((locationChangeInfo: {
        fromLocation?: ParsedLocation
        toLocation: ParsedLocation
        pathChanged: boolean
        hrefChanged: boolean
        hashChanged: boolean
      }) => Array<string> | false)
}
```

## ViewTransitionOptions properties

The `ViewTransitionOptions` type accepts an object with a single property:

### `types` property

- Type: `Array<string> | ((locationChangeInfo: {
  fromLocation?: ParsedLocation
  toLocation: ParsedLocation
  pathChanged: boolean
  hrefChanged: boolean
  hashChanged: boolean
}) => (Array<string> | false))`
- Required
- Either one of:
  - An array of strings that will be passed to the `document.startViewTransition({update, types}) call`
  - A function that accepts `locationChangeInfo` object and returns either:
    - An array of strings that will be passed to the `document.startViewTransition({update, types}) call`
    - or `false` to skip the view transition
