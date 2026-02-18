---
number: 1969
title: "[Bug]: Add touch support option for mobile devices"
type: bug
state: open
created: 2025-06-02
url: "https://github.com/unovue/reka-ui/issues/1969"
reactions: 6
comments: 1
labels: "[bug]"
---

# [Bug]: Add touch support option for mobile devices

### Environment

```bash
- Operating System: Darwin
- Node Version:     v22.12.0
- Nuxt Version:     3.17.4
- CLI Version:      3.25.1
- Nitro Version:    2.11.12
- Package Manager:  pnpm@10.11.0
```

### Link to minimal reproduction

https://codesandbox.io/p/devbox/reka-ui-hovercard-forked-877wgd?file=/src/App.vue

### Steps to reproduce

- Click on the trigger of a HoverCard on mobile
- Observe that the card does not open

### Describe the bug

We're using HoverCard in Nuxt UI with a mode prop that switches between Popover and HoverCard. When using hover mode (HoverCard), it works perfectly on desktop but can't be triggered on mobile devices.
We understand this is by design since HoverCard is meant for mouse hover interactions, but it would be helpful to have an option to enable touch support so we can maintain our unified mode API while still providing mobile functionality.
Currently, users can't open hover-mode popovers on mobile devices, which breaks the user experience.
Would it be possible to add an optional touch fallback mechanism to HoverCard?

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

Relate issues:
- https://github.com/nuxt/ui/issues/2346
- https://github.com/unovue/reka-ui/issues/802