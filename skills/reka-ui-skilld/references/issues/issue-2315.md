---
number: 2315
title: "[Bug]: Tapping Number Field buttons triggers input focus and opens virtual keyboard"
type: bug
state: closed
created: 2025-11-30
url: "https://github.com/unovue/reka-ui/issues/2315"
reactions: 5
comments: 0
labels: "[bug]"
---

# [Bug]: Tapping Number Field buttons triggers input focus and opens virtual keyboard

### Environment

```bash
Reka UI version: 2.6.0
Client OS: iPhone 26.1
Browser: Safari 26
```

### Link to minimal reproduction

https://www.reka-ui.com/docs/components/number-field#number-field

### Steps to reproduce

1. Open the reproduction link (Reka UI's documentation page for `<NumberField>`).
2. Navigate to the first demo.
3. Click on the increment/decrement button.

### Describe the bug

Clicking on the increment/decrement button of the `<NumberField>` component increments/decrements the value and focuses the input, which could cause the virtual keyboard to open up on touch devices.

### Expected behavior

Clicking on the increment/decrement button of the `<NumberField>` component shouldn't focus the input (at least not on touch devices) or we should be able to opt out of this behavior, as it could open up the virtual keyboard and negatively affect user experience.

### Context & Screenshots (if applicable)

_No response_