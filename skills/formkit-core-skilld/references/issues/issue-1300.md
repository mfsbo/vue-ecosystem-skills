---
number: 1300
title: Components that wrap named-slotted components don't resolve with `autoImport`
type: bug
state: open
created: 2024-04-09
url: "https://github.com/formkit/formkit/issues/1300"
reactions: 4
comments: 9
labels: "[ bug,  priority-3]"
---

# Components that wrap named-slotted components don't resolve with `autoImport`

### Reproduction

https://stackblitz.com/edit/github-2lhz68-avdhcd?file=components%2FMyWrapperComponent.vue

### Describe the bug

Hey,

I'm having some issues with enabling `autoImport` in our nuxt project. The issue that I'm currently having is that (admittedly kind of specific) it looks like if we have a component that wraps another component that has named slots defined, it ends-up not rendering at all. 

Looking at the Vue dev tools, as far as I understand, the FormKit scheme provider does not resolve. 

I also linked a reproduction which should hopefully make things more clear :)

Thanks! :)

### Environment

• OS: MacOS
• Browser: Chrome
• Version: 123.0.6312.107 (Official Build) (arm64)


---

## Top Comments

**@justin-schroeder** [maintainer] (+2):

being worked on

**@OlaAlsaker** (+3):

Can confirm that some weird stuff is going in with slots when `autoImport` is enabled.

If I use `<FormKit />` inside of a slot, another random slot will just stop rendering.

**@justin-schroeder** [maintainer] (+1):

Interesting edge case. Thanks for the report.