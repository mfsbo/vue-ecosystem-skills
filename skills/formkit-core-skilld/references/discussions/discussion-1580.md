---
number: 1580
title: How to access and store FormKit's internal form state in a ref?
category: General
created: 2024-12-19
url: "https://github.com/orgs/formkit/discussions/1580"
upvotes: 1
comments: 1
answered: false
---

# How to access and store FormKit's internal form state in a ref?


I'm trying to track FormKit's form state (valid/invalid/dirty) in a Vue ref to use it in other parts of my component. For example, If I want to know if the entire form is valid or no (boolean).

### Current Setup
```vue
<script setup lang="ts">
const formState = ref() // How should I type and populate this?

</script>

<template>
  <FormKit
    type="form"
    v-model="formData"
    :plugins="[zodPlugin]"
    id="form-user"
  >
    <FormKit type="group" name="someGroup">
      
    </FormKit>
  </FormKit>
</template>
```

### What I've Tried
1. Using v-slot to access state:
```vue
<FormKit v-slot="{ state }">
```
This works in the template but I need to store/access this state in the script.

2. Using node prop:
```typescript
const handleNode = (node: FormKitNode) => {
  const node = getNode('form-user')
}
```...

---

## Top Comments

**@justin-schroeder** [maintainer]:

I would recommend using `useFormKitContextById`: https://formkit.com/inputs/form#useformkitcontextbyid

Then you can access it pretty simply: context.state