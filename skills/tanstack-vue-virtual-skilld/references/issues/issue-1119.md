---
number: 1119
title: "eslint-plugin-react-hooks v7 warning for useVirtualizer: Compilation Skipped: Use of incompatible library"
type: other
state: open
created: 2026-01-25
url: "https://github.com/TanStack/virtual/issues/1119"
reactions: 11
comments: 3
---

# eslint-plugin-react-hooks v7 warning for useVirtualizer: Compilation Skipped: Use of incompatible library

### Describe the bug

I see warning 

```sh
~/projects/kkvivbzvmm.github 1s
❯ eslint
Warning: React version not specified in eslint-plugin-react settings. See https://github.com/jsx-eslint/eslint-plugin-react#configuration .

/home/projects/kkvivbzvmm.github/src/main.tsx
  14:23  warning  Compilation Skipped: Use of incompatible library

This API returns functions which cannot be memoized without leading to stale UI. To prevent this, by default React Compiler will skip memoizing this component/hook. However, you may see issues if values from this API are passed to other components/hooks that are memoized.

/home/projects/kkvivbzvmm.github/src/main.tsx:14:23
  12 |   const listRef = React.useRef<HTMLDivElement | null>(null);
  13 |
> 14 |   const virtualizer = useVirtualizer({
     |                       ^^^^^^^^^^^^^^ TanStack Virtual's `useVirtualizer()` API returns functions that cannot be memoized safely
  15 |     getScrollElement: () => window as any as Element,
  16 |     // const virtualizer = useWindowVirtualizer({
  17 |     count: 10000,  react-hooks/incompatible-library
```

### Your minimal, reproducible example

https://stackblitz.com/edit/tanstack-virtual-dvrcspge?file=eslint.config.ts

### Steps to reproduce

...

---

## Top Comments

**@piecyk** [maintainer] (+1):

Thanks for the ping, I’ll take a look at this.

**@kade-robertson** (+1):

The diagnostics come from here: https://github.com/facebook/react/blob/e8c6362678c8bc86a02b8444d2c3f597b3dc4e22/compiler/packages/babel-plugin-react-compiler/src/HIR/DefaultModuleTypeProvider.ts#L63
Added in this PR: https://github.com/facebook/react/pull/34493
Which cites this issue on this repo: https://github.com/TanStack/virtual/issues/736#issuecomment-3065658277

**@vitonsky**:

I have the same problem.

@tannerlinsley @piecyk do you have any ideas why this warning is shown?