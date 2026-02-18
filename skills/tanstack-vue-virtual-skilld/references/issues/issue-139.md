---
number: 139
title: Slow rendering performance on scroll
type: other
state: closed
created: 2021-05-20
url: "https://github.com/TanStack/virtual/issues/139"
reactions: 19
comments: 17
---

# Slow rendering performance on scroll

I've been using the last few versions of `react-virtual` and i love the hook based api. However, I am getting some poor performance on row rendering. It's the classic empty and then flash to content on scroll. I thought perhaps this could be an issue with emotion (which i use for styling), however after stripping away all the emotion styles on the rows, it still performs quite slowly. I have broken everything up quite a bit and made sure that rerenders are localized only to components which have state changes. I've also played around with the overscan quite a bit, and can't seem to find a setting which renders smoothly. For the record, I am also using this with `react-table`. I am wondering if I am using the keys incorrectly somehow, or if this is just expected behavior. Below I've included some code snippets and a video:

### `virtualized-table-row.js`
```javascript
import { Flex } from "@chakra-ui/react";
import { Fragment } from "react";

const VirtualizedTableRow = ({ virtualRow, row }) => (
  <Flex
    ref={virtualRow.measureRef}
    h={`${virtualRow.size}px`}
    bg={row.isSelected ? "indigo.50" : "white"}
    _hover={{
      bg: row.isSelected ? "indigo.100" : "gray.100",
    }}
    position="absolute"
    w="100%"
    top="0"
    left="0"
    alignItems="center"
    style={{ transform: `translateY(${virtualRow.start}px)` }}
    minWidth="min-content"
    zIndex="1"
    role="group"
  >
    {row.cells.map((cell) => (
      <Fragment key={cell.getCellProps().key}>{cell.render("Cell")}</Fragment>
    ))}
  </Flex>
);

export default VirtualizedTableRow;
```
### virtualized-table-body.js 
...