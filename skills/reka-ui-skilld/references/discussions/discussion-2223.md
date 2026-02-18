---
number: 2223
title: How to stop Dialog from adding pointer-events to <body>
category: Q&A
created: 2025-10-12
url: "https://github.com/unovue/reka-ui/discussions/2223"
upvotes: 2
comments: 1
answered: false
---

# How to stop Dialog from adding pointer-events to <body>

Hey everyone,

I've noticed the Dialog component adds `pointer-events: none` to the `<body>`. When this happens, if I want to display a toast notification using the Toast component, I can't interact with toasts while the Dialog is open.

How can I disable the addition of the `pointer-events: none` to the `<body>`?

Thanks!

---

## Top Comments

**@SantoJambit**:

pointer-events is not final, so you could just add pointer-events: auto to your toasts or toast container.