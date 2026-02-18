---
number: 1480
title: Is there a way to close the datepicker overlay when the date is chosen?
category: Q&A
created: 2024-12-05
url: "https://github.com/unovue/reka-ui/discussions/1480"
upvotes: 1
comments: 1
answered: true
---

# Is there a way to close the datepicker overlay when the date is chosen?

The system datepicker calendar closes when a date is chosen.

Radix's does not.

How do we achieve this?

Right now I am adding a ref and "fake" clicking it:

```ts
// ref to hidden close component
const close = ref<DatePickerClose>(null)

// later
close.value.$el.click()
```

---

## Accepted Answer

**@zernonia** [maintainer]:

Responded in https://github.com/unovue/radix-vue/discussions/1479#discussioncomment-11486991 