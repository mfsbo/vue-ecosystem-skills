---
number: 659
title: Scrolling up with dynamic heights stutters and jumps
type: other
state: closed
created: 2024-02-01
url: "https://github.com/TanStack/virtual/issues/659"
reactions: 29
comments: 36
---

# Scrolling up with dynamic heights stutters and jumps

### Describe the bug

I have a feed of dynamic items, like iframes, photos, and text. When I scroll downward, everything works great and the scrolling is smooth, as measured items that increase in height push the other items down out of sight. However, when I scroll upwards, the performance is super stuttery and the items jump all over the place:

https://github.com/TanStack/virtual/assets/7350670/655b0a0b-4562-47e2-aa96-cb72daf8ad37



### Your minimal, reproducible example

Code below:

### Steps to reproduce

Create the virtualizer as normal:
```
const rowVirtualizer = useVirtualizer({
    count: itemCount,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 100,
    overscan: 2
  })
```
Then the feed:
```
const mainFeed = () => {
    return (
      <div
        style={{
          height: `${rowVirtualizer.getTotalSize()}px`,
          width: '100%',
          position: 'relative',
        }}
      >
        {rowVirtualizer.getVirtualItems().map((virtualRow) => {
          const post = loadedPosts[virtualRow.index]
          return (
            <div
              key={virtualRow.key}
              data-index={virtualRow.index}
              ref={rowVirtualizer.measureElement}
              style={{
                position: 'absolute',
                top: 0,
                left: 0,
                width: '100%',
                transform: `translateY(${virtualRow.start - rowVirtualizer.options.scrollMargin}px)`,
                display: 'flex',
              }}
            >
              <div style={{ width: '100%' }}>
                <FeedItem post={post} />
              </div>
            </div>
          )
        })}
      </div>
    )
  }
```

### Expected behavior

Scrolling upwards should be as smooth as scrolling downwards.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

macOS, Chrome

### tanstack-virtual version

...

---

## Top Comments

**@ReidCampbell** (+7):

Experiencing this too but only in iOS Safari.`react-virtuoso` suffers from this issue too.

**@piecyk** [maintainer] (+2):

hmm that is interesting, the scroll backward is bit tricky, we are measuring and adjusting scroll position to remove this jumping, and it was working great for us.

Also keep in mind that when jumping to place in the list where we didn't scroll, when scrolling backward we only have estimated size that will break if we don't measure. 

**@OrmEmbaar** (+3):

I've got it kind of working with the following code. There are still rendering artefacts on mobile as elements are resized, but for our use case it's better than having no virtualisation. It needs a reasonably large overscan (i've got 20) to prevent empty space appearing at the top of the list on certain viewport widths. It's also necessary to kill the cache entirely. The better you can make your `estimateSize` method, the fewer rendering artefacts you'll get. 

...