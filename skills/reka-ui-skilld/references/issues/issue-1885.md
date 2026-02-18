---
number: 1885
title: "[Feature]: Virtualization support for ComboboxGroup"
type: other
state: open
created: 2025-05-05
url: "https://github.com/unovue/reka-ui/issues/1885"
reactions: 17
comments: 2
---

# [Feature]: Virtualization support for ComboboxGroup

### Describe the feature

It would be nice to be able to use virtualization with `ComboboxGroup`. Unless I've missed something, the docs only seem to mention using the `ComboboxVirtualizer` with `ComboboxItem`, but not `ComboboxGroup`:

https://reka-ui.com/docs/guides/virtualization#example

### Additional information
- [ ] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.

---

## Top Comments

**@J-Michalek** (+1):

I'm afraid that implementing this is going to be a little tricky as I don't know of a good way to implement virtual scrolling for a nested DOM structure.

Basically we would need to treat `ListboxGroup` as a row instead of a element that wraps other elements, but that would break `ListboxGroupLabel` because of its provide/inject dependency with `ListboxGroup`.

Maybe I'm just not educated enough on the topic of virtualization...

**@enegandev** (+1):

Dear Reka UI team,

I hope this message finds you well.

We are a medium-sized company actively using Nuxt UI 3.0 (with Reka-Ui core) in our internal and client-facing applications, where handling large datasets in USelectMenu components is a common requirement. We understand that the Nuxt UI team is currently awaiting updates from your end regarding an issue related to virtualization support for USelectMenu.

...