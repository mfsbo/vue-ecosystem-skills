---
number: 876
title: Unable to scroll down with nested virtualizers
category: Q&A
created: 2024-11-07
url: "https://github.com/TanStack/virtual/discussions/876"
upvotes: 1
comments: 1
answered: true
---

# Unable to scroll down with nested virtualizers

I have a code example of nesting virtualizers but there is an issue where I'm unable to scroll down when I near the 2nd entry:
https://stackblitz.com/edit/tanstack-virtual-nl5nrv?file=src%2Fmain.tsx

Here is a screenshot of the virtualized areas. So the rows and the entries within the rows are virtualized.
<img width="444" alt="Screenshot 2024-11-07 at 7 24 54 AM" src="https://github.com/user-attachments/assets/50bd1a7f-bd57-4871-8102-27a58de50589">

An example of the problem when scrolling down:

https://github.com/user-attachments/assets/42e3182b-7dfb-4f5c-9f54-51b25dd3cb90

From what I understand react-virtual can handle this use case so I figured I am missing some aspect of implementation here that is causing the problem. Any extra eyes on insights would be appreciated, thank...

---

## Accepted Answer

**@piecyk** [maintainer]:

Looks like something of when you use `overscan: 0` basic this option means how many elements are extra render outside the view port, setting it to 1, fixes the issue https://stackblitz.com/edit/tanstack-virtual-tjtt7v?file=src%2Fmain.tsx,package.json