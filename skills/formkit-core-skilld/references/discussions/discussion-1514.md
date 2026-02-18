---
number: 1514
title: Accessing live form values in TypeScript
category: General
created: 2024-10-02
url: "https://github.com/orgs/formkit/discussions/1514"
upvotes: 2
comments: 0
answered: false
---

# Accessing live form values in TypeScript

What's the best practise for accessing current form values in a type-safe way? 

This raises an error since everything in `FormKitGroupValue` is `unknown`.
```
<FormKit v-slot="{ value }" type="form" :value="{ amount: 0 }">
  <FormKit type="number" name="amount" />
  <pre>{{ Number.parseInt(value?.amount) * 2 }}</pre>
</FormKit>
```

Is it to include an explicit type cast in `v-slot`?
```
<FormKit
  v-slot="{ value }: { value?: Partial<{ amount: number }> & FormKitGroupValue; }"
  type="form"
  :value="{ amount: 0 }"
>
  <FormKit type="number" name="amount" />
  <pre>{{ Number.parseInt(value?.amount) * 2 }}</pre>
</FormKit>
```