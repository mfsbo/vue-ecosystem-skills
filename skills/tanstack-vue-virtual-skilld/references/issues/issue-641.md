---
number: 641
title: No rows returned by useVirtualizer in unit tests
type: other
state: open
created: 2024-01-03
url: "https://github.com/TanStack/virtual/issues/641"
reactions: 14
comments: 18
---

# No rows returned by useVirtualizer in unit tests

### Describe the bug

In browser table rows are rendered as expected. In unit tests `useVirtualizer` returns an empty array from `rowVirtualizer.getVirtualItems()`. The bug is introduce with changes introduced by `v3.0.0-beta.63`. It also exists in the latest release `v3.0.1`

I think it was introduced by #598 here


### Your minimal, reproducible example

below

### Steps to reproduce

This unit test will pass for `v3.0.0-beta.62` and fail for any version there after.


```ts
import { useVirtualizer } from "@tanstack/react-virtual";
import { render, screen } from "@testing-library/react";
import { styled } from "@mui/material";
import { useCallback, useRef } from "react";

const items = [
  { id: 1, name: "foo" },
  { id: 2, name: "bar" },
];

const Parent = styled("div")({ height: "100%", width: "100%", overflow: "auto" });

const Inner = styled("div")({ width: "100%", position: "relative" });

const Row = styled("div")({ position: "absolute", top: 0, left: 0, width: "100%" });

function VirtualTableComponent() {
  const parentRef = useRef<HTMLDivElement>(null);

  const rowVirtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: useCallback(() => 56, []),
  });

  return (
    <Parent ref={parentRef}>
      <Inner sx={{ height: `${rowVirtualizer.getTotalSize()}px` }}> {/* set at 112px as expected */}
        {rowVirtualizer.getVirtualItems().map((virtualRow) => ( // always an empty array
          <Row
            key={virtualRow.index}
            data-index={virtualRow.index}
            ref={rowVirtualizer.measureElement}
            style={{ transform: `translateY(${virtualRow.start}px)` }}
          >
            <div>{items[virtualRow.index].name}</div>
          </Row>
        ))}
      </Inner>
    </Parent>
  );
}

describe("@tanstack/react-virtual", () => {
  it("renders rows", () => {
    render(<VirtualTableComponent />);

    expect(screen.getByText(items[0].name)).toBeInTheDocument();
    expect(screen.getByText(items[1].name)).toBeInTheDocument();
  });
});
```...

---

## Top Comments

**@luchiago** (+17):

Same issue here using `3.0.1`. The proposed solution `One option is to mock the getBoundingClientRect for the scroller element to return some height.` worked on my test suite.

```javascript
Element.prototype.getBoundingClientRect = jest.fn(() => {
        return {
            width: 120,
            height: 120,
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
        }
    });
```

**@istvandesign** (+10):

I think the issue here is that we should have unit tests in the examples.



Documentation should contain at least how to mock getBoundingClientRect in jest with JS and TypeScript to test with TanStack/virtual. 
I've wasted a day trying to figure out why my mock data was not working in a unit test, if you are refactoring someone else's code and you update react-virtual you will encounter this issue.

Do we have some other way to do this, like mocking some function inside the library ?

I'...

**@piecyk** [maintainer] (+3):

@densk1 that is correct behaviour, it's because in unit test elements don't have height or width. One option is to mock the getBoundingClientRect for the scroller element to return some height.