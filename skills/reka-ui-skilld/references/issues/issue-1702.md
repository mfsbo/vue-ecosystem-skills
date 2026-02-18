---
number: 1702
title: "[Feature]: Combobox allow showing options on focus"
type: other
state: closed
created: 2025-03-13
url: "https://github.com/unovue/reka-ui/issues/1702"
reactions: 9
comments: 8
---

# [Feature]: Combobox allow showing options on focus

### Describe the feature

I want to use the combobox as a searchable select. To accomplish this, I want the options to show when we focus on the input.

While we can control open with `v-model:open`, this line makes it impossible to do so on focus of the input. If we set `open = true` on focus, we can an infinite loop.

I'm willing to submit a PR for this, but am seeking direction on what kind of solution we want. My first instinct is to add a prop to get around the `.focus()` call, but open to other ideas.

### Additional information

- [ ] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.

---

## Top Comments

**@yanuaraditia** (+3):

> Instead of using the v-model:open, you can use the combobox context. You only need to create a subcomponent for the trigger. For example:
> 
> 
> 
> <template>
> 	<ComboboxInput @focus="handleOnFocus" />
> </template>
> Then use it like this:
> 
> <ComboboxAnchor>
> 	<ComboboxFocusOpenInput />
> </ComboboxAnchor>
> It's not documented, s...

**@zernonia** [maintainer]:

Yo @jack-allocate . What's the issue the `@focus` on input method? 

https://stackblitz.com/edit/t3pwyw6z?file=src%2FApp.vue

**@s-montigny-desautels** (+1):

Instead of using the v-model:open, you can use the combobox context. You only need to create a subcomponent for the trigger. For example:

```vue
<script setup lang="ts">
import { ComboboxInput, injectComboboxRootContext } from "reka-ui";

const rootCtx = injectComboboxRootContext();

function handleOnFocus() {
	if (!rootCtx.open.value) {
		rootCtx.onOpenChange(true);
	}
}
</script>

<template>
	<ComboboxInput @focus="handleOnFocus" />
</template>
```

Then use it like this:
```vue
<ComboboxAnchor>
	<ComboboxFocusOpenInput />
</ComboboxAnchor>
```

It's not documented, so use at your own risk!