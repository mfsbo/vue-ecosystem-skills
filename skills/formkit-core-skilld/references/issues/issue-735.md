---
number: 735
title: "[0.17.2] Input blur event cause \"Cannot read properties of null (reading 'store')\""
type: bug
state: closed
created: 2023-05-23
url: "https://github.com/formkit/formkit/issues/735"
reactions: 3
comments: 10
labels: "[ bug,  research required]"
---

# [0.17.2] Input blur event cause "Cannot read properties of null (reading 'store')"

### Reproduction

https://stackblitz.com/edit/vitejs-vite-mbv6sq?file=src%2Fpages%2FForm2.vue

### Describe the bug

When leaving a page with a Formkit input focused (using browser navigation to avoid blur before leaving), the blur event occur but the node is already destroyed and it throw this error :



This issue is likely due to the absence of verification for the existence of the node in this code.




### Environment

• OS: MacOS Ventura (Apple Silicon), Debian 11
• Browser: Chrome
• Version: 113


---

## Top Comments

**@parafeu** (+3):

Hello ! 

I tried to update to v0.17.3, and I'm still having the issue. 
I suppose it's because you are checking if node is `undefined`, but on this issue the node is `null`.

**@frasza** (+2):

@GustavoFenilli @justin-schroeder  I have created reproduction in Nuxt App -> https://github.com/frasza/formkit-bug
Might be very specific reproduction, as I have found issue in nested pages

Edit: Seems to be present after version 0.17 -- there is not error in 1.16.1

**@darthf1** (+1):

I'm having the same issue. Would be great if this can be resolved.



