---
number: 835
title: "Is \"flushSync\" necessary for react-virtual?"
category: Q&A
created: 2024-09-10
url: "https://github.com/TanStack/virtual/discussions/835"
upvotes: 1
comments: 1
answered: false
---

# Is "flushSync" necessary for react-virtual?

When developing a text editor with react-virtual, I experienced a weird problem: when scrolling it is very slow and even unusable, but after patching the code:

https://github.com/TanStack/virtual/blob/661a9563f6abe15bb3b638751ae1f492b8f1fc84/packages/react-virtual/src/index.tsx#L27-L37

```  
// EDIT: remove flushSync
const resolvedOptions: VirtualizerOptions<TScrollElement, TItemElement> = {
    [...options,](url)
    onChange: (instance, sync) => {
      rerender()
      options.onChange?.(instance, sync)
    },
  }
 ```
 
It fixed the issue. Can anyone explain why "flushSync" must be used? Because the React docs also mentions that "flushSync" can hurt the performance.

Similar issue: https://github.com/ueberdosis/tiptap/issues/4492

---

## Top Comments

**@piecyk** [maintainer]:

> Can anyone explain why "flushSync" must be used?

It was added to reduce lag in react 18 https://github.com/TanStack/virtual/issues/549 when position elements.