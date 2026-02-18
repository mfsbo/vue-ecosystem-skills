---
number: 207
title: Need streaming callbacks in chat for persistence
category: General
created: 2026-01-07
url: "https://github.com/TanStack/ai/discussions/207"
upvotes: 2
comments: 0
answered: false
---

# Need streaming callbacks in chat for persistence

We already have callbacks like `onFinish` and `onChunk` in the `useChat` hook, but it would be great to have the same callbacks available in the `chat` function as well.

Currently, I’m using `StreamProcessor` to capture the final message so I can persist it to the database:

```ts
export const collectChatStream = createServerOnlyFn(async function* (
  stream: AsyncIterable<StreamChunk>,
  options?: CollectChatStreamOptions
) {
  const processor = new StreamProcessor({
    events: {
      onMessagesChange: (message) => {
        console.log(message);
      },
      onStreamEnd: (message: UIMessage) => {
        options?.onFinish?.(message);
        console.log("onstreamend");
      },
    },
  });

  processor.startAssistantMessage();

  for await (const event of stream) {
    processor.processChunk(event);

    yield event;
  }

  processor.finalizeStream();
});
```...