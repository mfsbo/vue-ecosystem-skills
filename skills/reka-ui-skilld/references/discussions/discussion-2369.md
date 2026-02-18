---
number: 2369
title: "Tree with checkbox example: onToggle prevents opening via arrow left/right"
category: Q&A
created: 2026-01-01
url: "https://github.com/unovue/reka-ui/discussions/2369"
upvotes: 1
comments: 0
answered: false
---

# Tree with checkbox example: onToggle prevents opening via arrow left/right

I've just implemented the tree with checkbox example and found that the arrow left/right keys don't work when the onToggle prevents the default.

I'm wondering if it should be removed completely or would it need a white-list like this?
```ts
const onToggle = (event: TreeItemToggleEvent<T>) => {
    if (event.detail.originalEvent.type === "keydown") {
        const { key } = event.detail.originalEvent as KeyboardEvent;
        if (key !== "ArrowRight" && key !== "ArrowLeft") {
            event.preventDefault();
        }
    }
};
```

And if so, if there are other keys I'm not aware of that should be white-listed

sidenote: A button doesn't have a change event, should probably be a click event.

```ts
      <button
        tabindex="-1"
        @click.stop="handleSelect"
      >
```...