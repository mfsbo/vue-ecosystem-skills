---
number: 1092
title: React v3.13.13 causes infinite re-renders after setting `getItemKey()`
type: other
state: closed
created: 2025-12-12
url: "https://github.com/TanStack/virtual/issues/1092"
reactions: 8
comments: 20
---

# React v3.13.13 causes infinite re-renders after setting `getItemKey()`

### Describe the bug

As title. Only happens after going from v3.13.12 to v3.13.13.

### Your minimal, reproducible example

See below.

### Steps to reproduce

Run the following code, which is grabbed from the example with just an `getItemKey()` addition
```diff
import { useVirtualizer } from '@tanstack/react-virtual';

function App() {
  // The scrollable element for your list
  const parentRef = React.useRef(null)

  // The virtualizer
  const rowVirtualizer = useVirtualizer({
    count: 10000,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 35,
+    getItemKey: (index) => index,
  })

  return (
    <>
      {/* The scrollable element for your list */}
      <div
        ref={parentRef}
        style={{
          height: `400px`,
          overflow: 'auto', // Make it scroll!
        }}
      >
        {/* The large inner element to hold all of the items */}
        <div
          style={{
            height: `${rowVirtualizer.getTotalSize()}px`,
            width: '100%',
            position: 'relative',
          }}
        >
          {/* Only the visible items in the virtualizer, manually positioned to be in view */}
          {rowVirtualizer.getVirtualItems().map((virtualItem) => (
            <div
              key={virtualItem.key}
              style={{
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                height: `${virtualItem.size}px`,
                transform: `translateY(${virtualItem.start}px)`,
              }}
            >
              Row {virtualItem.index}
            </div>
          ))}
        </div>
      </div>
    </>
  )
}
```...

---

## Top Comments

**@j-marty** (+7):

Move inline function for getItemKey to a callback function as a workaround. Like this:
`const getItemKey = useCallback((idx: number) => {...}, []);`

**@RaenonX** (+1):

> Now with this release it's now unclear what functions should be memoised, and which not.
> 
> Eg, in the first post example:
> 
> ```ts
>     getScrollElement: () => parentRef.current,
>     estimateSize: () => 35,
>     getItemKey: (index) => index,
> ```
> 
> it was mentioned that `getItemKey` must be memoised, but what about other two? Is it possible to know which must be memoised from documentation?
> 
> I came to this report because I also have the same problem, but I do not use `getItemKey` and desperately try to find which of the options to blame 🤷 
> 

...

**@RaenonX**:

> Even with React Compiler, I still have to wrap it up inside useCallback?

Using default strategy (syntax inferred or something), if you are not wrapping the function in a `use*` hook then yes
