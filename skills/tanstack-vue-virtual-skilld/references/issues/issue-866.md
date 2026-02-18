---
number: 866
title: Svelte 5 support
type: other
state: open
created: 2024-10-28
url: "https://github.com/TanStack/virtual/issues/866"
reactions: 14
comments: 15
---

# Svelte 5 support

### Describe the bug

It's working fine in Svelte 4. I'm currently trying out the library in Svelte 5 and found my use case doesn't work.
I got an empty table with the same code. I suspect it cannot keep track of the initial element binding of the scroll element, because it works if I manually make a `mounted` state and call `$virtualizer._willUpdate()`.

### Your minimal, reproducible example

https://www.sveltelab.dev/github.com/rayrw/svelte5-tanstack-virtual

### Steps to reproduce

I've made a minimal reproduction repo.
Please note that we have to manually run `npm i --force && npm run dev` before #863 is merged.
With the hack from L19-L27, it seems to work. However, when I commented out it, I got an empty table.
I suspect it cannot keep track of the initial element binding of the scroll element?

### Expected behavior

I hope we can get rid of the manual mounting/element binding check and call of `$virtualizer._willUpdate()`.

### How often does this bug happen?

None

### Screenshots or Videos

_No response_

### Platform

macOS, Arc browser Version 1.65.0 (54911)
Chromium Engine Version 130.0.6723.59

### tanstack-virtual version

3.10.8

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@jithujoshyjy** (+15):

Here's how I made it work in svelte 5, mimicking the existing  **@tanstack/virtual-solid** package:

...

**@gyzerok** (+8):

Hello @tannerlinsley!

Svelte 5 was released some time ago, do you think we can get an update to support it? Do you have any internal discussions in the team regarding this? Would be highly appreciated!

**@lachlancollins** [maintainer]:

> Here's how I made it work in svelte 5, mimicking the existing **@tanstack/virtual-solid** package:

Hi @jithujoshyjy , would you be interested in submitting a PR with your work?