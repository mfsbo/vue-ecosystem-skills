---
number: 622
title:  Scrolling up on mobile/trackpad resets position using Dynamic and Vue
type: other
state: open
created: 2023-11-10
url: "https://github.com/TanStack/virtual/issues/622"
reactions: 14
comments: 3
---

#  Scrolling up on mobile/trackpad resets position using Dynamic and Vue

### Edit

As described here, this is a working true fix https://github.com/TanStack/virtual/issues/619#issuecomment-1969516091

### Describe the bug

This problem occurs when you use smooth scrolling, i.e. via touch screen or trackpad

Using the 'dynamic' version of the scroller and Vue problems occur when you scroll up. Other versions, such as fixed an variable height work fine.

Scrolling down works fine, however, the second you start scrolling up it causes a jittery movement and the rows don't actually scroll up, instead it resets its position. You can hopefully see it clearly in my provided videos. For example: row 53 stays in view.

The problem is most notable by scrolling slowly. By scrolling really fast you can get over it temporarily, but as soon as the scroll starts slowing down, the problem occurs.

This issue occurs in the offical example!

### Your minimal, reproducible example

https://ryhp23-3001.csb.app/

### Steps to reproduce

1. Open on mobile or switch the mobile emulation mode using the devtools
2. swipe down in the list, this works fine
3. Swipe up, position keeps resetting

### Expected behavior

I expect to be able to smoothly scroll up using the dynamic variant on all platforms.

### How often does this bug happen?

Every time

### Screenshots or Videos


https://github.com/TanStack/virtual/assets/22410563/75e62c13-91d8-4987-9242-73b217739108

tanstack scroller bug.webm


### Platform

Problem occurs on:
Chromium on MacOS
Firefox on MacOS
Chrome on Android
Firefox on Android
Firefox on Windows
Edge on Windows


Problem does NOT occur on:
Webkit based browsers basically:
safari on iPhone (emulator)
safari/Chromium/Firefox iPad
Safari on MacOS

### tanstack-virtual version

3.0.0-beta.68

### TypeScript version

4.8.4

### Additional context

The bug does not exist on the React wrapper ...

---

## Top Comments

**@JochemvanHout** (+1):

I seem to have found a temporary workaround.

In your ```useVirtualizer``` you can set ```overscan``` to a relatively high number. This atleasts allows users to scroll that many items before it starts to glitch.

``` ts
const rowVirtualizer = useVirtualizer({
  count: 1000,
  getScrollElement: () => scrollWrapper.value,
  estimateSize: () => 40,
  overscan: 100,
});
```

**@AlejandroAkbal** (+1):

Happening to me too, I've tried to use this library 3 times for the last year and with no luck because of this exact issue

This last try, seems like not setting an overscan works 2/3 of the time

Also, this other workaround seems to work too https://github.com/TanStack/virtual/issues/659

EDIT: THIS REALLY FIXED IT: https://github.com/TanStack/virtual/issues/619#issuecomment-1969516091