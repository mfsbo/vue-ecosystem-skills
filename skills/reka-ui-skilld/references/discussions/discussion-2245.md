---
number: 2245
title: How to programmatically open ContextMenu
category: Q&A
created: 2025-10-27
url: "https://github.com/unovue/reka-ui/discussions/2245"
upvotes: 1
comments: 0
answered: false
---

# How to programmatically open ContextMenu

Hey,

Is there a way to programmatically open a ContextMenu?
Using `v-model:open` doesn’t seem to work, and dispatching an event on the trigger element doesn’t either. https://github.com/unovue/reka-ui/issues/701

It would be great if the v-model could also take the mouse position into account when the trigger element is located elsewhere. (outside of ContextMenuTrigger)

Why do I need this?
I want to use a single ContextMenu component for a list of elements, without having to loop and render one menu per item — to keep the DOM clean and lightweight.
Each list item should be able to trigger the same ContextMenu by emitting an event and passing its data, so the menu content can adapt accordingly.

This approach works perfectly with the Dialog component using `v-model`, but with C...