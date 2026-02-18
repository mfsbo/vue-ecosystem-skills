---
number: 1348
title: Multi-input validation fails to update when there are multiple rules
type: bug
state: open
created: 2024-05-09
url: "https://github.com/formkit/formkit/issues/1348"
reactions: 1
comments: 0
labels: "[ bug,  priority-2]"
---

# Multi-input validation fails to update when there are multiple rules

### Reproduction

https://formkit.link/64bc3b991e36b077d11cbd111e71118b

### Describe the bug

This is a 1.6.x issue. If you switch to 1.5.x in the playground, everything works as it should.  https://formkit.link/64bc3b991e36b077d11cbd111e71118b

If you have a multi-input validation as well as some other validation, it will work correctly when the page initially loads (as seen where it rejects the duplicate values in the two fields with "b"). But, if you change one of the fields with "b" to "c" (which makes everything valid), and then change that same field back to "b", the other invalid field will not show as invalid. It's also possible to get into a state where both of the "b" fields show an error, but changing the value of one o...