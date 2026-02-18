---
number: 917
title: weird behavior when using 'rangeExtractor' to make a colum sticky
category: Q&A
created: 2025-01-25
url: "https://github.com/TanStack/virtual/discussions/917"
upvotes: 3
comments: 2
answered: false
---

# weird behavior when using 'rangeExtractor' to make a colum sticky

Hello, 

I'm currently trying to implement a virtualized table using `@tanstack/react-table` where the first column is sticky. This has proven to be more challenging than I thought, as I'm experiencing some unexplainable behavior when using `rangeExtractor` to force the "visible range" to always contain `0` (first col) as its first index. 

In my example below, I made some small modifications to the existing Tanstack example for column virtualization. While this example does not show the sticky column behavior, it **does** show the aforementioned _weird_ behavior where columns seem to stop rendering once the virtualization kicks in. 

### Minimum Reproduceable Example
https://codesandbox.io/p/devbox/great-phoebe-slhtxc

Perhaps by forcing the rendering of the first column, maybe t...

---

## Top Comments

**@Bram-Zijp** (+1):

When using position sticky for pinned columns in combination with the `rangeExtractor`, you need to remove the space the pinned columns occupy from the virtual spacing.

Example for left pinned sticky columns:

...

**@caritaou**:

I am seeing the same issue, using this example with rangeExtractor
https://github.com/user-attachments/assets/3cc01bdc-7022-436a-a196-4991b485769f
