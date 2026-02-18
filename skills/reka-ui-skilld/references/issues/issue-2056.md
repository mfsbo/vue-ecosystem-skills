---
number: 2056
title: "[Bug]: Listbox always autofocuses an item on mount"
type: bug
state: open
created: 2025-07-15
url: "https://github.com/unovue/reka-ui/issues/2056"
reactions: 8
comments: 6
labels: "[bug]"
---

# [Bug]: Listbox always autofocuses an item on mount

### Environment

```bash
Developement/Production OS: Windows 10 19043.1110
Node version: 16.0.0
Package manager: pnpm@8.6.0
Reka UI version: 2.0.0
Vue version: 3.0.0
Nuxt version: 3.0.0
Nuxt mode: universal
Nuxt target: server
CSS framework: tailwindcss@3.3.3
Client OS: Windows 10 19043.1110
Browser: Chrome 90.0.4430.212
```

### Link to minimal reproduction

https://reka-ui.com/docs/components/listbox#listbox

### Steps to reproduce

Open the page
Check the focused element

### Describe the bug

Listbox focuses the first item element on mount

### Expected behavior

Listbox shouldn't automatically focus any items unless a prop like `autofocus` is provided. In a dropdown menu or combobox, this is typically expected. For a listbox that is permanently on the page this causes problems by moving the focus cursor to somewhere unexpected.

### Context & Screenshots (if applicable)

_No response_

---

## Top Comments

**@kricsleo** [maintainer]:

Sounds reasonable to add an `autofocus` prop.

**@kricsleo** [maintainer]:

Hi, just confirming, the `Listbox` doesn't seem to be focused when mounted, only highlighted. Could you provide a minimal reproduction of the focus issue?

**@nicooprat**:

I think I found a dirty workaround: the idea is to trigger the `onLeave` function: https://github.com/unovue/reka-ui/blob/a49f311d91a0591236d75428120b92fd5e2fdb87/packages/core/src/Listbox/ListboxRoot.vue#L242

So I dispatched a fake `pointerleave` event:

```ts
// el should be a child of ListboxRoot
const el = useTemplateRef('el');

onMounted(async () => {
  await nextTick();
  await nextTick();

  el.value?.dispatchEvent(new Event('pointerleave', { bubbles: true }));
});
```

Yes, I had to wait for two `nextTick` for some reason. I was able to use the same trick for combobox by the way.

...