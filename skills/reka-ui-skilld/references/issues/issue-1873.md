---
number: 1873
title: "[Bug]: Combobox search term should not be set on mounted with `ignore-filter`"
type: bug
state: open
created: 2025-05-02
url: "https://github.com/unovue/reka-ui/issues/1873"
reactions: 6
comments: 3
labels: "[bug]"
---

# [Bug]: Combobox search term should not be set on mounted with `ignore-filter`

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

https://stackblitz.com/edit/hn2yox-kycn1tbz?file=src%2FApp.vue

### Steps to reproduce

Open the combobox, you'll see the list only displays `Orange`.

### Describe the bug

The list should not be filtered and the `searchTerm` not set on mounted based on the modelValue.

@zernonia You mentioned in one of our discussion I shouldn't use `v-model` on the `ComboboxInput` to do this but this is how it's described on https://reka-ui.com/docs/components/combobox#custom-filtering and also we have no other way to listen for input changes since `@update:model-value` is the only event.

I'm not sure but isn't is somehow related to the `resetSearchTermOnSelect` prop and this watch? 
https://github.com/unovue/reka-ui/blob/v2/packages/core/src/Combobox/ComboboxInput.vue#L85

When we set `:reset-search-term-on-select="false"`, the list shows all items but this breaks the display of the input.

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

_No response_