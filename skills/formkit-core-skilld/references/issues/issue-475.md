---
number: 475
title: Possible memory problem during route switches
type: bug
state: closed
created: 2022-11-16
url: "https://github.com/formkit/formkit/issues/475"
reactions: 5
comments: 25
resolvedIn: 0.17.0
labels: "[ bug,  release-ready,  bronze-sponsor]"
---

# Possible memory problem during route switches

### Reproduction

https://github.com/dominikklein/formkit-possible-memory-problem

### Describe the bug

I found maybe a possible memory leak.
When I switch between two routes the memory is always increasing. So on one route, I have a form with some more fields (so that the memory increase is more visible) and the other route has no fields. Then I'm switching between the routes and see that the memory is always increasing and it will not be reduced when I go back to the route without the form.

Added a test repository with the "Home"-Route which has no FormKit-Form and the "About"-Route which has a bigger form.

### Environment

• OS: [e.g. iOS]
• Browser [e.g. chrome, safari]
• Version [e.g. 22]


---

## Top Comments

**@justin-schroeder** [maintainer]:

These memory issues are fixed in the `@next` tag — will be published with `0.17.0`

**@justin-schroeder** [maintainer]:

> I just updated to latest formkit release via the `next` tag in my reproduction repository: https://github.com/KoenCa/nuxt-formkit-memory-repro . **There is still a memory leak**, please see the following video:

Hmm, you're right. We fixed a server side memory issue and have a backing test for it using `createSSRApp`. Your nuxt app is exhibiting different behavior — I'm not sure what the precise difference is here, but some interaction of FormKit with Nuxt must be causing issues. Looking into it...


**@devoidofgenius** [maintainer]:

Thanks for providing a reproduction of the issue. We'll look into this further.