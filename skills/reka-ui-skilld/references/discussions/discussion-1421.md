---
number: 1421
title: How to close some but not all popovers when nested
category: Q&A
created: 2024-11-14
url: "https://github.com/unovue/reka-ui/discussions/1421"
upvotes: 2
comments: 1
answered: false
---

# How to close some but not all popovers when nested

Hi folks! 

Great stuff you doing here. I have a question that you might be able to help me with. 

I have a use case where I can open a popover from inside a popover, which could go Infinitiv. 

The issue I have is that when someone opens popover up to a nesting level of 3-4 and the clicks into the popover content of the second opened popover (e.g. to dismiss 3,4 and inspect content of number 2), all popover closes. What I would have expected is that number 3 and 4 close but 1 and 2 are still open.
 I tried the "modal" option on the `PopoverRoot` but that forces me to close every popover one by one until I reach the desired one, which could be really stressful. 

Do you have any idea how I can achieve this? Or what I might doing wrong?

Here is a stackblitz to visualise what I ...

---

## Top Comments

**@senaria**:

Hey guys any news about this? I tried it today with upgrading to 2.2.0 but the problem still occurs. 