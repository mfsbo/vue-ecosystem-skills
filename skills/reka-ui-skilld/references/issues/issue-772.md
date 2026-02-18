---
number: 772
title: "[Feature]: Allow more types for modelValue in `Select`"
type: other
state: closed
created: 2024-03-19
url: "https://github.com/unovue/reka-ui/issues/772"
reactions: 18
comments: 13
labels: "[v2]"
---

# [Feature]: Allow more types for modelValue in `Select`

### Describe the feature

Currently, the only supported value is a string, which can be limiting. It would be beneficial to expand this functionality to accommodate additional types, akin to how it's implemented in a Combobox.

### Additional information

- [X] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.

---

## Top Comments

**@zernonia** [maintainer] (+7):

As this is highly requested feature, and it involves breaking changes. This will be included in v2

**@wouterlms** (+5):

This is my workaround for those who are interested:

`SelectItem` is quite straightforward

```vue
<SelectItem :value="JSON.Stringify(value)">
  <slot />
</SelectItem>
```

And `SelectRoot`

```vue
<script setup lang="ts" generic="TValue">
import { SelectRoot } from 'radix-vue'
import { computed } from 'vue'

const props = defineProps<{
  modelValue: TValue | undefined
}>()

const emit = defineEmits<{
  'update:modelValue': [value: TValue |  undefined]
}>()

const model = computed<string | undefined>({
  get: () => {
    return JSON.stringify(props.modelValue)
  },
  set: (value) => {
    if (value === undefined) {
      emit('update:modelValue', undefined)
      return
    }

    emit('update:modelValue', JSON.parse(value))
  },
})
</script>

<template>
  <SelectRoot v-model="model" >
    <slot />
  </SelectRoot>
</template>
```...

**@wouterlms** (+1):

@kylemilloy, casting the type to `any` wouldn't suffice because the logic for checking if a value is selected is structured like this:

`const isSelected = computed(() => rootContext.modelValue?.value === props.value)`

However, I managed to "fix" it by wrapping the `SelectRoot` and `SelectItem` in custom components where the value is being stringified before passing it.