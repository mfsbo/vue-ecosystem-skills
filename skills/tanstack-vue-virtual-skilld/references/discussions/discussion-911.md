---
number: 911
title: how to scroll to bottom of a list at init
category: Q&A
created: 2025-01-08
url: "https://github.com/TanStack/virtual/discussions/911"
upvotes: 5
comments: 2
answered: false
---

# how to scroll to bottom of a list at init

I'm using useVirtualizer, dynamic mode
Like a chat message list, i want to start at the bottom of the scroller
I currently do this, but the result is not at the bottom, i guess i shoud do this when the measument is end, but there isn't a event
`
  useEffect(() => {
    rowVirtualizer.scrollToIndex(data.length - 1)
  }, [])
`

---

## Top Comments

**@Yaropolki4** (+3):

You can use something like this
```ts
const items = rowVirtualizer.getVirtualItems();
const isMountedScrollToBottomRef = useRef(false);
const scrollToBottom = useCallback(
    ({ behavior = "smooth" }: { behavior?: ScrollToOptions["behavior"] } = {}) => {
     requestAnimationFrame(() => {
        rowVirtualizer.scrollToIndex(footerIndex, {
        align: "end",
        behavior,
      });
     })
    },
    [rowVirtualizer, footerIndex],
  );

  useLayoutEffect(() => {
    if (!isMountedScrollToBottomRef.current && items.length > 0) {
      isMountedScrollToBottomRef.current = true;
      scrollToBottom({ behavior: "auto" });
    }
  }, [items, scrollToBottom]);
```...

**@WebKieth**:

This is a bug, which provided by lib from creation. A lot of issues was closed with MRs, which wasnt fix anything.  
So it has only one solution. Scroll it in a loop again and again and stop scrolling when real ref element scrollTop + offsetHeight property will equals total size of scroll belt.
...