---
number: 200
title: useChat's UiMessage.parts doesn't support multimodal parts
type: other
state: open
created: 2026-01-04
url: "https://github.com/TanStack/ai/issues/200"
reactions: 4
comments: 0
---

# useChat's UiMessage.parts doesn't support multimodal parts

### TanStack AI version

0.2.0

### Framework/Library version

React

### Describe the bug and the steps to reproduce it

## Problem:

When using `useChat` and calling `append()` with multimodal content (images, audio, etc.), the content is stripped during conversion to `UIMessage`.

## Use-case

I'm building a model adapter for local in-browser AI models (Chrome's built-in Prompt API). The adapter works well for text and tool-calling, but I can't figure out how to pass multimodal content through `ConnectionAdapter`:

...