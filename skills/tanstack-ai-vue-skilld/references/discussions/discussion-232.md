---
number: 232
title: Associating token usage of stream to user for billing purposes
category: General
created: 2026-01-17
url: "https://github.com/TanStack/ai/discussions/232"
upvotes: 2
comments: 0
answered: false
---

# Associating token usage of stream to user for billing purposes

I'm implementing server-side usage tracking in a TanStack Start app. I want to track each user's token usage, but currently there doesnt seem to be a way to do this without intercepting the text stream and checking if chunk is of type "done" to get token usage:

...