---
number: 1550
title: type=select mutates the values of the provided options
type: feature
state: open
created: 2024-11-14
url: "https://github.com/formkit/formkit/issues/1550"
reactions: 4
comments: 4
labels: "[ enhancement,  priority-2]"
---

# type=select mutates the values of the provided options

### Reproduction

https://formkit.link/30fcebec478229c1ab944761a8bd3ff7

### Describe the bug

Like mentioned in https://github.com/formkit/formkit/issues/357, the `select` input will replace non-string values with `__mask_*` (`__mask_1`, `__mask_2`, ...) of the provided option list.

This is unexpected, and other parts of the code might rely on the original options object. The docs doesn't mention this either. 

A workaround is to manually copy the original options using `structuredClone`.

### Environment

• OS: MacOs
• Browser Chrome
• Version 1.6.7


---

## Top Comments

**@strokirk** (+1):

@tdeckardt It depends on the issue, I've needed to remove some of my `FormKit type=select|dropdown` usages partially for this reason. But adding a `function fixFormkit1550(val) { return JSON.parse(JSON.stringify(val)) }` function to completely recreate the data is one way. Something like:

```
<FormKit type="select" name="Country" :options="fixFormkit1550(countries)" placeholder="Select Country" />
```

**@justin-schroeder** [maintainer]:

yeah, options are always mutated, although its intended to be an invisible library-land mutation only. I bet we could track the same state information using a WeakMap

**@strokirk**:

This can be especially problematic when using Tanstack Query, since it will return a ref/proxy of the data so `structuredClone` is not available, and logs a warning on mutation.

A workaround is to use `JSON.parse(JSON.stringify(val))`.