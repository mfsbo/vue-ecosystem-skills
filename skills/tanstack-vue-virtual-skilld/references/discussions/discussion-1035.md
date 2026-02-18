---
number: 1035
title: In React version 18.3.1, when using the ReactDOM.createRoot mode, blank spaces appear during fast scrolling of a list. How can this issue be resolved?
category: Q&A
created: 2025-07-09
url: "https://github.com/TanStack/virtual/discussions/1035"
upvotes: 1
comments: 2
answered: false
---

# In React version 18.3.1, when using the ReactDOM.createRoot mode, blank spaces appear during fast scrolling of a list. How can this issue be resolved?

https://tanstack.com/virtual/latest/docs/framework/react/examples/fixed?panel=sandbox
This issue also exists in the official example provided.

---

## Top Comments

**@piecyk** [maintainer]:

Hi! This seems related to React 18’s createRoot, which enables concurrent rendering and may delay DOM commits during fast scrolling. That can cause measureElement to run before elements are mounted, resulting in blank gaps.

https://tanstack.com/virtual/latest/docs/api/virtualizer#useanimationframewithresizeobserver

Try using useAnimationFrameWithResizeObserver in the virtualizer config. This defers measurement until the next animation frame after layout and helps avoid measuring uncommitted DOM.

Let me know if that helps or if there’s a better approach for React 18.

**@jiaozhiye**:

> https://tanstack.com/virtual/latest/docs/framework/react/examples/fixed?panel=sandbox This issue also exists in the official example provided.

Using `ReactDOM.render` in this way is not a problem. I don't know why this issue occurs in `Concurrent Mode`, and I don't know how to fix it. I'm looking for help!