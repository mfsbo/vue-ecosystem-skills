---
number: 139
title: How to get the messages back from the response?
category: Q&A
created: 2025-12-11
url: "https://github.com/TanStack/ai/discussions/139"
upvotes: 1
comments: 0
answered: false
---

# How to get the messages back from the response?

It looks like I need to reconstruct the original messages array from the stream in `chat()` but since there are helper functions like `modelMessagesToUIMessages`, I was wondering if there's a way to just get the messages array from the chat? I don't require streaming and have to write a lot of boilerplate code to reconstruct it.