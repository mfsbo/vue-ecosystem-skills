---
number: 1402
title: Automatically position datepicker panel wrapper
type: bug
state: open
created: 2024-06-05
url: "https://github.com/formkit/formkit/issues/1402"
reactions: 2
comments: 0
labels: "[ bug,  priority-3, Pro, datepicker]"
---

# Automatically position datepicker panel wrapper

### Reproduction

https://formkit.link/79046b0558a8a2a4fb33d657c83d37e7

### Describe the bug

When a datepicker inputs sits near the end of a page, the panel wrapper will still open at the bottom. It would be nice if the wrapper opened to the top, or where every there is enough space.

To make it easy to style depending on the position, a new state could be introduced to indicate on which side the wrapper has been opened. Think something like `data-side="top"`.

### Environment

• OS: macOS
• Browser: Arc (chromium)
• Version: Chromium Engine Version 125.0.6422.113
