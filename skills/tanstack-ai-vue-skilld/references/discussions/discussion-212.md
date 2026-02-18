---
number: 212
title: Use the client only with a custom server
category: Q&A
created: 2026-01-08
url: "https://github.com/TanStack/ai/discussions/212"
upvotes: 2
comments: 0
answered: false
---

# Use the client only with a custom server

Is it possible to use the `@tanstack/ai-client` just as the state manager and fetcher for the chat? My server doesn't follow the Tanstack AI's stream protocol, so I'd like to "inject" messages from a normal REST endpoint into the state of the `ChatClient`.

I understand that a custom adapter could work, but it looks like it requires some plumbing work that my not be optimal.

In my specific use case, I'd like to fetch the messages from a server that exposes them with the A2A protocol (https://github.com/a2aproject/A2A). Is it possible? If not, why?

I'm mirroring here the discussion from https://discord.com/channels/719702312431386674/1458746966388379690 with the hope to get more visibility.