---
number: 164
title: Bold by `TextPart` in `@tanstack/ai-*-ui` is not compatible with Japanese and Chinese (and occasionally Korean) due to spec defect in CommonMark
type: other
state: open
created: 2025-12-20
url: "https://github.com/TanStack/ai/issues/164"
reactions: 0
comments: 4
---

# Bold by `TextPart` in `@tanstack/ai-*-ui` is not compatible with Japanese and Chinese (and occasionally Korean) due to spec defect in CommonMark

### TanStack AI version

@tanstack/ai-react-ui@0.1.0

### Framework/Library version

react@19.2.3

### Describe the bug and the steps to reproduce it

Bold annotations by `**` (and emphasis annotations by `*`) are frequently broken or undone in Japanese and Chinese (and occasionally Korean).

https://streamdown.ai/docs/cjk-support
https://github.com/commonmark/commonmark-spec/issues/650
https://github.com/vercel/streamdown/issues/185
https://github.com/CherryHQ/cherry-studio/pull/4119

Example offending Markdown:

<div lang=ja>

...