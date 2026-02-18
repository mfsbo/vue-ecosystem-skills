---
number: 1447
title: "`datepicker`: \"Maximum call stack size exceeded`"
type: bug
state: closed
created: 2024-07-15
url: "https://github.com/formkit/formkit/issues/1447"
reactions: 2
comments: 10
labels: "[🐛 bug, 🚀 release-ready, 🔴 priority-1, Pro, datepicker]"
---

# `datepicker`: "Maximum call stack size exceeded`

### Reproduction

https://formkit.link/b7647b1d60174c0788f2f3da4b1fedc7

### Describe the bug

An infinite loop is triggered when advancing to the year part of the date picker (after first selecting a day and month, and you start typing a year).




### Environment

• OS: Windows
• Browser: Chrome
• Version: 126.0.6478.127
