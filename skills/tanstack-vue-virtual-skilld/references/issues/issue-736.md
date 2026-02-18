---
number: 736
title: "React Compiler: useVirtual results are cached at their initial values"
type: other
state: open
created: 2024-05-23
url: "https://github.com/TanStack/virtual/issues/736"
reactions: 21
comments: 9
---

# React Compiler: useVirtual results are cached at their initial values

### Describe the bug

An usage of `useVirtual` gets compiled by React Compiler into something like this:

```
const virtualizer = (0,
_tanstack_react_virtual__WEBPACK_IMPORTED_MODULE_9__.useVirtualizer)(t3);
let t4;
if ($[9] !== virtualizer) {
  t4 = virtualizer.getVirtualItems();
  $[9] = virtualizer;
  $[10] = t4;
} else {
  t4 = $[10];
}
```

Since the virtualizer ref never changes, the virtual items never get updated.

Not sure if this should be a Tanstack Virtual issue or React Compiler needs to apply less assumptions when caching values, but thought that would be good to flag the problem here.

Wrapping `useVirtual` into something like this fixes the issue:

```js
const useVirtualWrapper = (...args) => {
  'use no memo';
  return { ...useVirtual(...args) };
}
```

### Your minimal, reproducible example

https://codesandbox.io/p/devbox/runtime-dew-9rlvm7

### Steps to reproduce

1. Open the example (forked from https://tanstack.com/virtual/latest/docs/framework/react/examples/fixed)
2. The virtual lists are rendering no items


### Expected behavior

The UI should be the same as https://tanstack.com/virtual/latest/docs/framework/react/examples/fixed



### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

- MacOS, Chrome and Firefox

### tanstack-virtual version

3.5.0

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@piecyk** [maintainer] (+4):

'use no memo' seems like a reasonable temporary workaround! https://react.dev/learn/react-compiler#something-is-not-working-after-compilation

**@nicolo-danzi-ok** (+6):

got same problem, very annoying when using react-compiler. My workaround was to save an instance of virtualizer as state when the onChange function is saved, and use that instance in my component instead of the instance returned by the hook.
```
    const [virtualizer, setVirtualizer] = useState<Virtualizer<HTMLDivElement, Element> | null>(null);

    useVirtualizer({
        count: data.getCount(),
        estimateSize: () => 30,
        getScrollElement: () => scrollableRef.current,
        onChange: (i) => setVirtualizer(i),
    });

   ....
    <>
       virtualizer?.getVirtualItems().map(v => {
          ....
       }
    </>
```...

**@lgrones** (+4):

Here's a solution that works with TS and pretty strict eslint rules (e.g. where spreading classes is forbidden)

```ts
const useVirtual = (options: Parameters<typeof useVirtualizer>[0]) => {
  'use no memo';

  const { getVirtualItems, getTotalSize } = useVirtualizer(options);

  return { virtualItems: getVirtualItems(), totalSize: getTotalSize(), /*...and whatever else you need*/ };
};
```

...