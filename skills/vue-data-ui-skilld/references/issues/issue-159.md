---
number: 159
title: "[BUG] VueUiWordCloud will not render if every word has the same value"
type: bug
state: closed
created: 2025-01-16
url: "https://github.com/graphieros/vue-data-ui/issues/159"
reactions: 1
comments: 1
labels: "[ bug : layout]"
---

# [BUG] VueUiWordCloud will not render if every word has the same value

**Describe the bug**
The word cloud chart will not display any words if all words happen to appear the exact same amount of times.

**To Reproduce**
Steps to reproduce the behavior:
Create a chart and pass in a string that has each word appear once, or each word appear 5 times etc. The chart will not display any words. 

**Expected behavior**
I would expect each word to appear and all be the same size. 

**Screenshots**


Stackblitz recreation: 
https://stackblitz.com/edit/github-nsu5r9xb?file=app.vue


**Vue Data UI version (please complete the following information):**
2.4.73


---

## Top Comments

**@graphieros** [maintainer]:

Hi @drew-w :)

Thanks for pointing out this use case I'd totally missed.
You can upgrade to v2.4.79 which fixes the issue.

Cheers