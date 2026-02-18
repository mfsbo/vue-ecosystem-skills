---
number: 991
title: "[Feature]: Expose more options to configure underlying `floating-ui` for advanced popper positioning"
type: other
state: closed
created: 2024-06-06
url: "https://github.com/unovue/reka-ui/issues/991"
reactions: 11
comments: 5
labels: "[v2]"
---

# [Feature]: Expose more options to configure underlying `floating-ui` for advanced popper positioning

### Describe the feature

It would be very handy if `floating-ui`-powered components exposed more props to control underlying `floating-ui` configuration.  

For example I've recently stumbled across a task to implement a more advanced positioning technique for one of our `Popover` usages. While it was really easy to achieve with `fallbackPlacements` option for `flip` middleware, unfortunately `radix-vue` doesn't support passing these. So instead I had to workaround it with a computed `side` prop and do my own math when exactly `side` should change.

Prepared this sandbox to demonstrate https://codesandbox.io/p/sandbox/floating-ui-react-dom-template-forked-hjzlcc?file=%2Fsrc%2FApp.js%3A13%2C36. If you open sandbox in a separate window and try to resize floating content will first flip to the bottom and then will start shifting to remain in the viewport.

So just allowing `fallbackPlacements` would have solved it for me but maybe we should expose even more options? Not exactly sure what API would be though but I'm willing to start a PR on this.
 
Could be a good fit for v2.

### Additional information

- [ ] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.