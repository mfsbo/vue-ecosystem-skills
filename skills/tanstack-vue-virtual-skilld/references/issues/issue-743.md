---
number: 743
title: React 19 issue with useWindowVirtualizer
type: other
state: open
created: 2024-06-27
url: "https://github.com/TanStack/virtual/issues/743"
reactions: 25
comments: 6
---

# React 19 issue with useWindowVirtualizer

### Describe the bug

Sorry for the drive by issue… 

We ran into a problem with react 19 today that was a pita to track down. So dropping it here incase it's useful to anyone.

We had a simple useWindowVirutalizer in a client component in next.js w/ react 19 (like this):

```js
const virtualizer = useWindowVirtualizer({
  count: branches.length,
  estimateSize: () => 66,
  overscan: 5,
  scrollMargin: listRef.current?.offsetTop ?? 0,
});
```

and virtualizerRef.getVirtualItems() was being hoisted / memo'd by the compiler in such a way that it was always returning 0 for `getVirutalItems`.

To fix it we just dropped the virtualizer in a ref…

```js
	const virtualizer = useWindowVirtualizer({
		count: branches.length,
		estimateSize: () => 66,
		overscan: 5,
		scrollMargin: listRef.current?.offsetTop ?? 0,
	});

	// we do this because react 19 was optimzing it away
	const virtualizerRef = useRef(virtualizer);
	
	…
	
	virtualizerRef.current.getVirtualItems() // etc…
```

### Your minimal, reproducible example

n/a

### Steps to reproduce

Don't have time to spin up a test case sorry! 

### Expected behavior

Expected getVirtualItems() to return items.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

macos, chrome, react 19

### tanstack-virtual version

3.7.0

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@zeorin** (+8):

I work around this with the following hook:

```typescript
const useNoMemo = <const T>(factory: () => T): T => {
  'use no memo';
  return factory();
}
```
which I then use like this:
```typescript
  const virtualItems = useNoMemo(() => virtualizer.getVirtualItems());
```
This de-opts _just_ the call to `virtualizer.getVirtualItems` without de-opting the rest of the component.

See https://github.com/facebook/react/issues/33057#issuecomment-2894450792

**@cacabo** (+4):

+1, I am seeing this with:

```json
{
    "@tanstack/react-virtual": "^3.11.1",
    "react": "^18.3.1",
    "react-compiler-runtime": "^19.0.0-beta-63b359f-20241101",
    "react-dom": "^18.3.1",
}
```

Putting a hook in the component after `.getVirtualItems` appears to be another workaround

Another option is "use no memo"

https://react.dev/learn/react-compiler#something-is-not-working-after-compilation

**@izakfilmalter** (+2):

Running into the same issue. `useRef` seems to work for now for us.