---
number: 2298
title: "[Accordion] How to expand all items without hard coded `default-value`?"
category: Q&A
created: 2025-11-21
url: "https://github.com/unovue/reka-ui/discussions/2298"
upvotes: 1
comments: 0
answered: false
---

# [Accordion] How to expand all items without hard coded `default-value`?

I'm building a new ui-lib on top of reka-ui.
I'm wondering maybe we can just add a prop like `defaultExpandAll` to expand all items without hard coded `default-value` prop.

## Doc
https://reka-ui.com/docs/components/accordion#expanded-by-default

## Source Code
https://github.com/unovue/reka-ui/blob/1e0670da1d9cf9652cb4cf89aa2015265dbd60d0/packages/core/src/Accordion/AccordionItem.vue#L13

Maybe we don't omit `defaultOpen`?

```
  :defaultOpen="rootContext.defaultExpandAll"
```
