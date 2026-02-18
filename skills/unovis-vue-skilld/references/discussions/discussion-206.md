---
number: 206
title: Error when destroying StackedBar
category: Q&A
created: 2023-05-22
url: "https://github.com/f5/unovis/discussions/206"
upvotes: 1
comments: 1
answered: true
---

# Error when destroying StackedBar

I'm using Vue, which doesn't seem to have its own package so instead I'm writing vanilla javascript to create and update charts.

Upon the data being updated, I first try to remove and destroy the previously rendered chart before rendering again. I couldn't find a clear explanation on how to do this in the docs so I'm calling destroy directly. This is the flow:

...

---

## Accepted Answer

@errantmind Your code looks correct, so it's hard to tell what's going wrong. If you could share an example on StackBlitz or somewhere else, we'll happy to take a look.