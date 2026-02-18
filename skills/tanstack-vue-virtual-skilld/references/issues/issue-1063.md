---
number: 1063
title: Measurements of virtual items don't get re-calculated when lanes are changed (with `measureElement`)
type: other
state: open
created: 2025-10-11
url: "https://github.com/TanStack/virtual/issues/1063"
reactions: 7
comments: 0
---

# Measurements of virtual items don't get re-calculated when lanes are changed (with `measureElement`)

### Describe the bug

There is a similar issue here: #1036 

When using measureElement with useVirtualizer, changing the number of lanes dynamically causes the layout to break.

In my case, some of the virtual items returned by `getVirtualItems()` still have the old measurements as they don't get re-calculated. For example if I change lanes to a smaller number, some items still have the old larger lane, causing layout to break.

My debugging suggests the problem might be the minimum `pendingMeasuredCacheIndexes`, it wrongly skipped some of the items that should be visible, so their measurements are not re-calcualted.

### Your minimal, reproducible example

https://github.com/hmpthz/another-react-responsive-masonry/tree/main/packages/example

### Steps to reproduce

I actually created a repo trying to showcase and solve this. You can see the example above. Basically, the problem happens like this:

```typescript
const { currentBreakpoint } = useBreakpoint(breakpointColumns);
const lanes = currentBreakpoint.nCol; // changing lanes dynamically

const rowVirtualizer = useWindowVirtualizer({
  lanes: currentBreakpoint.nCol,
  ...others
});

const virtualItems = rowVirtualizer.getVirtualItems();

const columns = useMemo(() => {
  const arr = Array.from({ length: lanes }, () => [] as VirtualItem[]);
  for (const item of virtualItems) {
    arr[item.lane].push(item); // you'll get error as lane is out of bound
  }
  return arr;
}, [virtualItems, lanes]);
```

### Expected behavior

...