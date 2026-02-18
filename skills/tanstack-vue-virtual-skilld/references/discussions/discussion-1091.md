---
number: 1091
title: How to keep lane order in masonry grid for items based on their original index
category: Q&A
created: 2025-12-11
url: "https://github.com/TanStack/virtual/discussions/1091"
upvotes: 1
comments: 1
answered: true
---

# How to keep lane order in masonry grid for items based on their original index

Hi. I use **useWindowVirtualizer** for masonry grid, and I have a problem: my items are not ordered in the same way as they are placed in the original array. For example:

lanes is set to 4.
```
{virtualizer.getVirtualItems().map((virtualRow) => {
    virtualRow.index // shows 4
    virtualRow.lane // shows 1 (but I want it to be 0)
...

return <div
              key={virtualRow.index}
              data-index={virtualRow.index}
              ref={virtualizer.measureElement}
              className={clx(
                'absolute top-0 flex flex-col items-center justify-center',
                'gap-s pt-s',
                'md:gap-ss md:pt-ss md:pl-ss',
                'lg:gap-sm lg:pt-sm lg:pl-sm',
              )}
              style={{
                left: `calc(${virtualRow.lane} * (100% / ${cols}))`,
                width: `calc(100% / ${cols})`,
                transform: `translateY(${virtualRow.start - virtualizer.options.scrollMargin}px)`,
              }}
            >
          ... 
         </div>
}
```...

---

## Accepted Answer

I could not find a solution without modifying the library itself, so I patched it. Now I'm always returning this index check:
https://github.com/TanStack/virtual/blob/80723487e329ad8a72a27f5dd9cc995310e0fb61/packages/virtual-core/src/index.ts#L605

This can cause large gaps at the end of the grid when some rows are much taller than others (if some cards vary significantly in height), but in my case it works fine.