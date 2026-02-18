---
number: 861
title: Nested vistualizers
category: Q&A
created: 2024-10-22
url: "https://github.com/TanStack/virtual/discussions/861"
upvotes: 1
comments: 2
answered: true
---

# Nested vistualizers

<img src="https://github.com/user-attachments/assets/6ae92d69-4920-437b-9fbf-bbd87caaa53b" width="200px"/>
<br />

As shown in the above image 
I am having a list of items (Red-box) which in turn will have its own list of items (blue-box) and fetched when is opened.

The problem I am facing is when first open the nested list I am getting a blank list


https://github.com/user-attachments/assets/9e9f6442-1ff8-4b3f-9e2f-84de5e54e89a



---

## Accepted Answer

Found the issue @piecyk , @johnhok 

In my case the div which holds the scrollable container, is conditionally rendered and the initial ref being `null` the contents are not getting rendered(since there is no container(ref))



With this change now whenever the `VirtualList` is rendered the ref will be attached and having a value.

