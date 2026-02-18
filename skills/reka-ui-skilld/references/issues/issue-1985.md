---
number: 1985
title: "[Bug]: Select performance bad because SelectContent's content is written to a fragment even when not visible"
type: bug
state: open
created: 2025-06-11
url: "https://github.com/unovue/reka-ui/issues/1985"
reactions: 7
comments: 2
labels: "[bug, performance]"
---

# [Bug]: Select performance bad because SelectContent's content is written to a fragment even when not visible

### Environment

```bash
Reka UI version: 3.2.1
Vue version: latest
```

### Link to minimal reproduction

https://stackblitz.com/edit/otfpzs5h?file=src%2FApp.vue,package.json

### Steps to reproduce

Open the example and toggle the selects using the button and see the console for the time/perf logs.

### Describe the bug

The performance of the `Select` component is bad due to the fact that `SelectContent` still renders everything inside it, even when the content is not visible.

This causes the component to perform very badly, especially when there are multiple `Select` components on the page.

I see that when the `Select` is not open, there is logic to render everything to a fragment, but that fragment is not really used anywhere. Is there any specific reason this is done?

This causes a drastic decrease in performance, and it performs much better if I remove this `v-else-if`.

https://github.com/unovue/reka-ui/blob/4a136f724b064981bd9a59f98cbb38547a738eb2/packages/core/src/Select/SelectContent.vue#L57-L63

Can someone please explain the need to render to fragment, and if it's not vital can we introduce a prop to disable this behavior to gain some performance, or if it is a vital thing - can we somehow improve it to win some performance points?

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

<img width="789" alt="Image" src="https://github.com/user-attachments/assets/45268a4a-f36e-4168-a2ad-14ac89397b78" />