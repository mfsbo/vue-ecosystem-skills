---
number: 989
title: "Naked `disabled` attribute on FormKit component does not set `data-disabled=\"true\"` attribute on `.formkit-outer` wrapper"
type: bug
state: closed
created: 2023-10-12
url: "https://github.com/formkit/formkit/issues/989"
reactions: 3
comments: 4
labels: "[ bug,  release-ready,  priority-2]"
---

# Naked `disabled` attribute on FormKit component does not set `data-disabled="true"` attribute on `.formkit-outer` wrapper

### Reproduction

https://github.com/Archetipo95/FormKit-Tailwind-Nuxt

### Describe the bug

I encountered an issue with using FormKitVariants in Nuxt 3 with Tailwind CSS. The expected behavior is not occurring, and I suspect it might be related to the integration of FormKitVariants with Nuxt 3 and Tailwind CSS.

For example the formkit-disabled:bg-[red] is not applying to the disabled input


### Environment

MacOs latest
Macbook pro M1
Latest chrome

---

## Top Comments

**@andrew-boyd** [maintainer] (+2):

Yeah, this is actually a bug — thanks for the check. We'll get it working with naked `disabled` but for now set it to `disabled="true"` and you should be set.

**@andrew-boyd** [maintainer]:

Thanks for the reproduction. I played around with it and you need to use `disabled="true"` not just naked `disabled` to get the outer attribute set on FormKit. Works when you make that change.

https://stackblitz.com/edit/github-ahat4n?file=app.vue

**@Archetipo95**:

I have also a stackblitz example linked to the repo: https://stackblitz.com/github/Archetipo95/FormKit-Tailwind-Nuxt?file=package.json