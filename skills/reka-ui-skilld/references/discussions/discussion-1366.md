---
number: 1366
title: About hasChildren in TreeItem component
category: Q&A
created: 2024-10-12
url: "https://github.com/unovue/reka-ui/discussions/1366"
upvotes: 1
comments: 1
answered: true
---

# About hasChildren in TreeItem component

I'm using a tree component, but I'm encountering an unexpected result. In my opinion, if children is an empty array, hasChildren should be false. However, the actual behavior is the opposite. I'd like to know if this is the intended design.

...

---

## Accepted Answer

**@zernonia** [maintainer]:

This is intended. Specifically for cases where we are fetching children dynamically. You can always modify the conditional to render if it has non-empty array 