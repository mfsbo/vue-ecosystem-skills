---
number: 1937
title: "[Feature]: Reconsider your use of @internationalized/date"
type: other
state: open
created: 2025-05-25
url: "https://github.com/unovue/reka-ui/issues/1937"
reactions: 7
comments: 13
---

# [Feature]: Reconsider your use of @internationalized/date

### Describe the feature

I want to share my frustration with the decision to rely on the very obscure and poorly documented `@internationalized/date` library instead of luxon or native JS date objects. Having to do serialization -> parsing just to pass values between native JS dates and this library is extremely cumbersome and inefficient.

Please re-consider your usage of `@internationalized/date` and consider using either a properly documented library **with direct support for native JS date objects**, like luxon, or detect when native JS date objects are passed and do the conversion within the Reka component.

Having to deal with `@internationalized/date` just to be able to communicate with the date components goes against the ease of use and simplicity of Reka UI in my opinion.

I'm willing to submit a PR if welcomed that would get rid of `@internationalized/date` and replace the current logic with a luxon equivalent, which would support both native JS date and luxon DateTime as inputs for all parameters.

Related issues: #1633, #1104, #1589

### Additional information

- [x] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.