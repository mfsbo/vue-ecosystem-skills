---
number: 2252
title: "[Bug]: @vueuse/core does not provide an export named 'toValue'"
type: bug
state: closed
created: 2025-10-29
url: "https://github.com/unovue/reka-ui/issues/2252"
reactions: 7
comments: 5
labels: "[bug]"
---

# [Bug]: @vueuse/core does not provide an export named 'toValue'

### Environment

```bash
Developement/Production OS: Ubuntu 24.04.3 LTS
Node version: v22.18.0
Package manager: bun@1.3.1
Reka UI version: 2.6.0
Vue version: 3.5.22
Nuxt version: 4.2.0
Nuxt mode: universal
Nuxt target: server
CSS framework: none
Client OS: Ubuntu 24.04.3 LTS
Browser: Chrome 140.0.7339.127
```

### Link to minimal reproduction

https://github.com/christianlmc/rekaui-vueuse-issue

### Steps to reproduce

- `bun dev`
- Open browser
- Look in the console:
  - Uncaught (in promise) SyntaxError: The requested module '[path to you project]/node_modules/@vueuse/core/dist/index.js?v=e94e1874' does not provide an export named 'toValue'

### Describe the bug

reka-ui is trying to `import { toValue } from "@vueuse/core";`  in `/reka-ui/dist/shared/useFormControl.js`. If you have `"@vueuse/nuxt": "14.0.0"` installed it causes the error mentioned in the Steps to reproduce section.

This issue does not happen in "@vueuse/nuxt" version 13 

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

_No response_

---

## Top Comments

**@niusia-ua** (+2):

This issue is already addressed in #2250.
For now, you can simply override the `@vueuse/core` version for `reka-ui` to 12.5.0. This is what I have done for my project.

**@francoism90** (+4):

Any ETA on a new release? :)

I still have this error on the latest version.

**@niusia-ua** (+2):

@zernonia, since #2250 is merged, you can close this issue.