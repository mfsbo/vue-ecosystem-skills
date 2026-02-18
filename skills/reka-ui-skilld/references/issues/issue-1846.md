---
number: 1846
title: "[Bug]: Browser freeze when multiple combobox opened"
type: bug
state: closed
created: 2025-04-23
url: "https://github.com/unovue/reka-ui/issues/1846"
reactions: 9
comments: 3
labels: "[bug]"
---

# [Bug]: Browser freeze when multiple combobox opened

### Environment

```bash
Developement/Production OS: Windows 10 19043.1110
Node version: 16.0.0
Package manager: pnpm@8.6.0
Reka UI version: 2.0.0
Vue version: 3.0.0
Nuxt version: 3.0.0
Nuxt mode: universal
Nuxt target: server
CSS framework: tailwindcss@3.3.3
Client OS: Windows 10 19043.1110
Browser: Chrome 90.0.4430.212
```

### Link to minimal reproduction

https://stackblitz.com/edit/hn2yox-7kbvxpje?file=src%2FApp.vue

### Steps to reproduce

Just tab focus the input, when focusing the second one the browser freezes.

### Describe the bug

Having two opened Combobox at the same time makes browser completely crash.

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

_No response_

---

## Top Comments

**@kricsleo** [maintainer] (+1):

Maybe same issue with https://github.com/unovue/reka-ui/issues/1743

**@sadeghbarati** [maintainer]:

Here is another example from originui-vue 

- Scroll to **Multiselect** example
- Focus the Combobox and hit **arrow down** to open up the list
- While you are remaining focused on the Combobox, click on the **View code** (**<>** icon) Dialog