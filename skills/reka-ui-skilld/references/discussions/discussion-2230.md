---
number: 2230
title: ToastRoot breaks Vue TransitionGroup (height always 0, invisible animation)
category: Q&A
created: 2025-10-17
url: "https://github.com/unovue/reka-ui/discussions/2230"
upvotes: 1
comments: 0
answered: false
---

# ToastRoot breaks Vue TransitionGroup (height always 0, invisible animation)

Hey everyone 

I am trying to make Radix-Vue toasts work together with Vue’s <TransitionGroup> so that when a toast closes, the other ones move up smoothly (like reorder animation).

The problem is that it seems impossible to animate them, because ToastRoot doesnt render the real DOM node inside the group it teleports the toast into the <ToastViewport>.

Here’s an example ...

...