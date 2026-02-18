---
number: 1974
title: "[Bug]: Some components cause lag when vue devtools is active"
type: bug
state: open
created: 2025-06-04
url: "https://github.com/unovue/reka-ui/issues/1974"
reactions: 8
comments: 4
labels: "[bug]"
---

# [Bug]: Some components cause lag when vue devtools is active

### Environment

```bash
Developement/Production OS: Mac OS 15.5 (Sequoia)
Node version: 22.16.0
Package manager: pnpm@9.15.0
Reka UI version: 2.3.0
Vue version: 3.5.13
Nuxt version: 3.0.0
Nuxt mode: universal
Nuxt target: server
CSS framework: tailwindcss@3.4.17
Client OS: Mac OS 15.5 (Sequoia)
Browser: Chrome 137.0.7151.56
```

### Link to minimal reproduction

https://reka-ui.com/docs/components/select

### Steps to reproduce

 **_Note: Reproduction link not possible since this issue happens during development while the Vue devtools extension is the active tab in the Chrome devtools panel_**

Example:
- Use a Reka-UI `Select` component during development while compiling with Vite, making sure that the Vue devtools are **_NOT_** the active pane in the Chrome devtools panel
  - Notice the select open and close immediately, quick and responsive
- Now select Vue devtools as the active tab in Chrome's devtools
  - Notice the lag opening and closing the `Select` component while Vue devtools are active

Tested with Vue devtools 7 (latest) as well as Vue devtools 6 (legacy)

### Describe the bug

Various components cause excessive lag when using them while the Vue devtools browser extension is the active tab in Chrome devtools.
This happens during development while compiling the code with Vite.

The components that seems to cause this issue are the ones with popovers like:
- Select
- Combobox
- Context Menu
- Menubar
- Dropdown Menu


### Expected behavior

...

---

## Top Comments

**@SpeakInCode** (+1):

@J-Michalek I had thought as well, so I tested it by using a single MenuBar component straight from the docs in fresh empty Vue app and it still happens. 

I've gone back and forth on whether it's a Reka issue or a Vue devtools issue and the only thing that makes sense with all the testing I've done is it must be how Reka is handling those popover components. There must be a bug, or memory leak, or something happening that causes this within those components, that is then watched by the devtools and creates the lag. 

...

**@SpeakInCode**:

@J-Michalek I also tested the `floating-ui` package by itself, which those components use, and I couldn't find an issue there. My thought is it's somewhere in the component logic, but I'm not too well versed in Vue's composition API (I've mostly worked on options api apps). I appreciate you taking the time to look into this. Please let me know if I can be of any help.

**@J-Michalek**:

I think this is more of a performance issue on the side of Vue devtools, but not sure. RekaUI creates a lot of component instances especially the components that you have listed create many component instances, keeping track of all of them may be overwhelming for the devtools.