---
number: 1362
title: Setting initial multi step activeStep does not work
type: bug
state: open
created: 2024-05-18
url: "https://github.com/formkit/formkit/issues/1362"
reactions: 1
comments: 1
labels: "[ bug,  priority-2]"
---

# Setting initial multi step activeStep does not work

### Reproduction

https://formkit.link/1b3a52f5120ad694913a1f2f20d42f97

### Describe the bug

Using `node.goTo()` to initially set the active step in a multi step form does not work reliably on component mount.
In the linked reproduction example, the first step has a single input that has a default value, which should make this first step valid and "done". Yet calling `node.goTo('favorite')` on mount does not work. Looking into the code of `goTo` it checks whether this first step is valid and this returns false, probably because the values have not been initialised yet.

Using a `setTimeout` "works", but obviously this isn't really reliable.

I have also tried to set it using `node.props.activeStep = 'favorite'`, which does indeed work (in a sense that this step becomes active), but ...