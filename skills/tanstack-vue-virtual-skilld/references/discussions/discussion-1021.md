---
number: 1021
title: Why is itemSizeCache private?
category: Q&A
created: 2025-06-15
url: "https://github.com/TanStack/virtual/discussions/1021"
upvotes: 1
comments: 1
answered: false
---

# Why is itemSizeCache private?

Hey there :)
In my virtual list, I display placeholders when the user scrolls quickly.
I want to improve these placeholders so they match the height of the actual data — if that data has already been rendered once.
I was able to easily achieve this using `measurementsCache`, something like:

```tsx
function Placeholder({virtualizer, index}: PlaceholderProps) {
    const cachedHeight = virtualizer.measurementsCache[index]?.size ?? null;

    return <Skeleton.Line height={cachedHeight} />;
}
```

My problem is that this cache uses array indexes rather than item keys. When I add or remove items from my array, I get incorrect placeholders for some items, for the same reason React advises against using `key={index}`.

I noticed that under the hood, `measurementsCache` uses `itemS...

---

## Top Comments

**@itayganor** (+1):

I was able to solve this without using `itemSizeCache`.

In my original attempt, I read `virtualizer.measurementsCache[index]?.size` on the component level, but `index` was not the "internal virtualization index" but my actual data index. I used the Sticky pattern, which creates "fake" list items that are the sticky headers. This made a mess with the indexes, making it impossible for a "row renderer" to know what internal index was used to render it.

Instead of reading the cache in the component, I now only access it while iterating `virtualizer.getVirtualItems()` - where `item.index` is ...