---
number: 971
title: Type 'bigint' is not assignable to type 'Key | null | undefined' when trying to use virtualItem.key as react component key
type: other
state: open
created: 2025-03-28
url: "https://github.com/TanStack/virtual/issues/971"
reactions: 7
comments: 5
---

# Type 'bigint' is not assignable to type 'Key | null | undefined' when trying to use virtualItem.key as react component key

### Describe the bug

```
<SomeItem key={virtualItem.key} />
```

results in:
```
Type 'Key' is not assignable to type 'Key | null | undefined'.
  Type 'bigint' is not assignable to type 'Key | null | undefined'.ts(2322)

index.d.ts(98, 9): The expected type comes from property 'key' which is declared here on type 'IntrinsicAttributes'
```

I suspect this may be due to being on an older version of React than what the Key type is targeting? But I don't think this should matter.

`const key = String(virtualItem.key);` works fine as a workaround, but it'd be nice if either:
- `Key` type from installed version of React is used
- `Key` type is inferred from `getItemKey`
- `Key` type could be passed to useVirtualizer, like `useVirtualizer<TItemKey>(...)`


As always, great job with this library. I love it!  

### Your minimal, reproducible example

https://stackblitz.com/edit/tanstack-virtual-pksf2gfh?file=src%2Fmain.tsx

### Steps to reproduce

- Open StackBlitz link
- In main.tsx, scroll down to `key={virtualRow.key}` and see the type error

### Expected behavior

Shouldn't get a type error

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

- MacOS 14.4
- VSCode 1.98.2
- TypeScript 4.9.5

### tanstack-virtual version

@tanstack/react-virtual@3.13.5

### TypeScript version

4.9.5

### Additional context

_No response_

### Terms & Code of Conduct

...