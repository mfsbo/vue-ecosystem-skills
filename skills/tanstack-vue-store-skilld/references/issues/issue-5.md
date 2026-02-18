---
number: 5
title: Solid Adapter
type: question
state: closed
created: 2023-08-31
url: "https://github.com/TanStack/store/issues/5"
reactions: 0
comments: 8
labels: "[enhancement, good first issue, help wanted]"
---

# Solid Adapter

It would be really cool to see a Solid adapter for this project. I have a few questions I'm unclear about that would need to be solved:

- Packaging
- Testing (Testing Library?)
- Reactivity interop

Ideally the API should look nearly identical to the React API

---

## Top Comments

**@tannerlinsley** [maintainer] (+5):

I thought about this a lot and even gone down very dangerous paths with Ryan Carniato talking about how we can bridge the gap between signals and immutable values. The only secure place that I’ve landed is that reconcile is the answer. 

**@tannerlinsley** [maintainer] (+2):

The selector could be optional at that point since you wouldn’t need it for fine grained subscriptions, its only purpose would be to maybe cut down on the amount of work that reconcile has to do. Thoughts?

**@Tanner-Scadden** (+3):

https://github.com/TanStack/router/pull/671/files#diff-9be81768de8c03b212d1afde126315756a7ad4dccc75840d1925a58973238923

Here is a PR I've been working on slowly where I have a working solid version. Would love any feedback on my choice. It's assigned to `routerStore` because the selector value could be a string/number/etc. 
 
The shallowFindMissingKeys function was to help remove values that were previously there in the case of url search params being removed. 