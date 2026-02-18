---
number: 517
title: Type Error in Nested Donut Example
type: other
state: open
created: 2024-12-30
url: "https://github.com/f5/unovis/issues/517"
reactions: 0
comments: 3
---

# Type Error in Nested Donut Example

I notice that in

```
packages/dev/src/examples/misc/nested-donut/basic-nested-donut/index.tsx
```

there is a type error:

```
Type 'number' is not assignable to type 'string'.
```

at this line:

```js
<VisNestedDonut
  data={data}
  centralLabel='Central Label'
  centralSubLabel='Sub-label'
  layers={[
    (d: NestedDatum) => d.group,
    (d: NestedDatum) => d.subgroup,
    (d: NestedDatum) => d.value, // <--- Type error on this line here
  ]}
```

I'm using this as a reference for implementing a Treemap, and I'm skeptical if I should copy this API over to the new component, or if there is something wrong with the example implementation.