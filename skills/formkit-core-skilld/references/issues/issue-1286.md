---
number: 1286
title: "Nuxt autoImport: true makes it necessary to import FormKitSchema"
type: bug
state: closed
created: 2024-03-29
url: "https://github.com/formkit/formkit/issues/1286"
reactions: 3
comments: 2
labels: "[ bug,  priority-3]"
---

# Nuxt autoImport: true makes it necessary to import FormKitSchema

### Reproduction

https://stackblitz.com/edit/nuxt-starter-khnmgv?file=nuxt.config.ts

### Describe the bug

The `FormKitSchema` component is globally available in Nuxt and ready to use like the `FormKit` component when `autoImport: false`.

When setting `autoImport: true` this doesn't work anymore and the component needs to be imported manually.

**What I would expect:**

I would expect that `FormKitSchema` is still available like `FormKit` is too.



### Environment

------------------------------
- Operating System: Linux
- Node Version:     v18.18.0
- Nuxt Version:     3.11.1
- CLI Version:      3.11.1
- Nitro Version:    2.9.5
- Package Manager:  npm@10.2.3
- Builder:          -
- User Config:      devtools, modules, formkit
- Runtime Modules:  @nuxtjs/tailwindcss@6.1...

---

## Top Comments

**@justin-schroeder** [maintainer] (+1):

You are 100% correct 

**@Tragio**:

Hi @justin-schroeder  

Just bringing this up. Do you think would be possible to see this in an upcoming release?  

Thank you for the awesome work!  

---

PS: Upon further look, I think my main issue is related to https://github.com/formkit/formkit/issues/1300