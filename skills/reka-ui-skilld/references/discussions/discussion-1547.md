---
number: 1547
title: "Can I opt-out of `pointer-events: none` to body when Select is open?"
category: Q&A
created: 2025-01-08
url: "https://github.com/unovue/reka-ui/discussions/1547"
upvotes: 5
comments: 3
answered: false
---

# Can I opt-out of `pointer-events: none` to body when Select is open?

When I open a Select component, it prevents clicks outside of its domain by attaching `pointer-events: none` to the body element. Maybe it does something else to make that happen but anyways.

I want to know if I can opt out of that behavior. If I can't, please share which part of the source code does that.

---

## Top Comments

**@SoslanZS**:

> When I open a Select component, it prevents clicks outside of its domain by attaching `pointer-events: none` to the body element. Maybe it does something else to make that happen but anyways.
> 
> I want to know if I can opt out of that behavior. If I can't, please share which part of the source code does that.


Hi 🏻
I also ran into this problem. Did you manage to solve it?

**@A-kirami**:

For those encountering a similar issue, you can set both `bodyLock` and `disableOutsidePointerEvents` to `false` on the SelectContent component. This will prevent the automatic addition of `pointer-events: none; overflow: hidden;` on the body element. Note that **both must be set to `false`**—setting only one will not work.

**@czzplnm**:

You can manually control this behavior:

Change it:
  document.body.style.pointerEvents = 'auto'

Remove it:
  document.body.removeAttribute('style')