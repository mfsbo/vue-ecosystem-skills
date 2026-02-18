---
number: 640
title: Sticky header in a useReactTable table with useVirtualizer disappears when scrolling
type: other
state: open
created: 2023-12-20
url: "https://github.com/TanStack/virtual/issues/640"
reactions: 24
comments: 33
---

# Sticky header in a useReactTable table with useVirtualizer disappears when scrolling

### Describe the bug

When using a react-table together with vritualizer and a sticky header the sticky header disappears when scrolling. This is due to the fact that when combining the two the table should be wrapped in two divs:
1. The container that takes the height that should be taken up. This is the div that is scrollable
2. The div that directly wraps the container and takes the height of all the virtual items combined

Since the table element at any given time only contains the visible rows (plus overscan) the table itself has a height smaller than the wrapper div (nr. 2). This causes the sticky header to disappear when you scroll down since the sticky header cannot escape the table element.

### Your minimal, reproducible example

https://codesandbox.io/p/devbox/tanstack-react-virtual-example-dynamic-mr8t3x

### Steps to reproduce

1. Add `position: sticky` to the `thead` element
2. Scroll down the table and watch how the header dissapears

### Expected behavior

The header should stay on top since it is sticky.

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

Chrome

### tanstack-virtual version

3.0.0-beta.68

### TypeScript version

5.3.2

### Additional context

I've tried getting rid of the wrapper div (nr. 2) and setting the `height: `${getTotalSize()}px` directly on the table element but this causes the rows' height the grow because there are only ever enough rows to fit on the screen (plus overscan) but having the table the full height causes the rows to evenly divide the space between each other (making them a lot larger).

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@riptusk331** (+14):

I found a way to fix this, and am linking a working example. The trick is to calculate the height difference between the table element and the scrollable div, and then append an invisible pseudo-element to the table with that calculated height. This results in the table having the same height as the scrollable div, and stops the header from vanishing since you'll no longer scroll past the "end" of table element.

Doing this is a little bit tricky since pseudo elements can't be controlled directly through React/JSX inline styling, and directly adding new styles to the DOM is super expensive a...

**@piecyk** [maintainer] (+5):

There are few issues here, overfall tables don't quite like when rows are positions absolute, one option is to change the positioning strategy by adding before/after row that will move items when scrolling

https://codesandbox.io/p/devbox/zealous-firefly-8vm5y2?file=%2Fsrc%2Fmain.tsx%3A91%2C19

btw there is no clear answer what positioning strategy is better, it's really hard to compare performance in a significant way. 

**@kelvinfloresta** (+6):

Try applying the transform only if you are not scrolling and add a smooth transition when the header appears

```
const headerPosition = virtualizer.scrollOffset

<table style={{ position: "relative" }>
<thead>
<th
    key={headerGroup.id}
    style={{
      position: "relative",
      zIndex: 2,
      transition: "transform 0.5s",
      transform: !virtualizer.isScrolling
        ? `translateY(${headerPosition}px)`
        : "translateY(0px)",
    }}
  >
```