---
number: 1469
title: Problem in Formkit Schema Text Field
category: General
created: 2024-08-01
url: "https://github.com/orgs/formkit/discussions/1469"
upvotes: 1
comments: 1
answered: false
---

# Problem in Formkit Schema Text Field

- I have to upperCase  Text field of formkit schema how i can do 

below Code i use but its not work 

`<script setup>
import { ref, reactive } from 'vue'
import { FormKitSchema } from '@formkit/vue' // Ensure you have the correct path for FormKitSchema

const workflow = ref('') // Initialize with an empty string or appropriate default value

const schema = [
  {
    $formkit: 'text',
    name: 'workflow',
    bind: '$someAttributes',
  },
]

const data = reactive({
  someAttributes: {
    onInput: (event) => {
      workflow.value = event.target.value
    }
  }
})
</script>

<template>
  <FormKitSchema :schema="schema" :data="data" />
</template>
`

---

## Top Comments

**@sashamilenkovic** [maintainer]:

I would use a plugin and an input hook: https://formkit.link/37dbfaec28ace9c885a33619ba1f50e5

Information on hooks can be found here: https://formkit.com/essentials/architecture#hooks