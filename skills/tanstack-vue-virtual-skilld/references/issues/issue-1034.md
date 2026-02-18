---
number: 1034
title: "Angular 20: No matching export in \"node_modules/@angular/core/fesm2022/core.mjs\" for import \"AfterRenderPhase\""
type: other
state: closed
created: 2025-07-01
url: "https://github.com/TanStack/virtual/issues/1034"
reactions: 7
comments: 1
---

# Angular 20: No matching export in "node_modules/@angular/core/fesm2022/core.mjs" for import "AfterRenderPhase"

### Describe the bug

Hello,

Angular version of Tanstack virtual seems to be using "AfterRenderPhase“ from @angular/core but it has been removed from angular 20. 

Update to Angular 20 is not available for apps using tanstack :(

Thanks for your work !

### Your minimal, reproducible example

Upgrade to angular 20

### Steps to reproduce

* Update angular app using tanstack to angular 20
* Run ng serve

=> app is crashing

### Expected behavior

* Update angular app using tanstack to angular 20
* Run ng serve

=> app is running

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

Any platform running tanstack virtual on angular

### tanstack-virtual version

"@tanstack/angular-virtual": "3.13.12",

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.