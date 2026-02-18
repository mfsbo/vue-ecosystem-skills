---
number: 1212
title: Entry transition not working when floating-label=true
type: bug
state: closed
created: 2024-02-20
url: "https://github.com/formkit/formkit/issues/1212"
reactions: 5
comments: 10
resolvedIn: 1.6.1
labels: "[ bug,  release-ready,  priority-3]"
---

# Entry transition not working when floating-label=true

### Reproduction

https://formkit.link/4472a63ff5f2916621a2a2e09e99eebb

### Describe the bug

The vue transition in entrance is not reproduced when floating-label is active.
To reproduce the problem in the playground linked above you just need to refresh the page or submit the form.

In my project I use Formkit v.1.5.9 and Nuxt 3.10.2 with Nitro 2.8.1
In my case, with a form inside a side slide component with visibility toggled by a useState, the entrance transition never works, only the exit one (when  floating-label is set to true ).
In the reproduction above, it works for the attempts after the first.

### Environment

• OS: macOS 14 Sonoma
• Browser: chrome, firefox, safari



---

## Top Comments

**@andrew-boyd** [maintainer] (+7):

Ok, I _think_ we got to the bottom of this one.

TL;DR - this may be a byproduct of using Tailwind via the CDN and how their JIT compiler works — which our Playground does and I'm hoping the current version of your Nuxt app does too.

---

So we set up a new Nuxt application and were unable to get this behavior to show itself using the same example that you posted into Playground. Here you can see that in a standard Nuxt app the animation works just fine:

https://stackblitz.com/edit/nuxt-starter-cfiycv?file=app.vue

We were racking our brains over here trying to figure out what may ...

**@andrew-boyd** [maintainer] (+3):

@Archetipo95 I have a fix for this that will be released in `1.6.1`

**@andrew-boyd** [maintainer] (+1):

I'll leave this issue open in case anyone else comes across some threads worth pulling. Without a minimal reproduction of something that triggers the issue this is going to be a difficult one to track down.