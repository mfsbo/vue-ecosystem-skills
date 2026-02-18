---
number: 258
title: "[BUG]Invalid VueUiRadarConfig setting parameter."
type: bug
state: closed
created: 2025-10-21
url: "https://github.com/graphieros/vue-data-ui/issues/258"
reactions: 1
comments: 4
resolvedIn: 3.4.2
labels: "[ bug : layout]"
---

# [BUG]Invalid VueUiRadarConfig setting parameter.

**Describe the bug**
In the VueUiRadar component, the showValue and showPercentage parameters in the tooltip parameter have no effect when they are set to false.
For example: 

...

---

## Top Comments

**@graphieros** [maintainer]:

@AaaaaaaHu 

Thank you for raising this issue and for the details.
You can upgrade to v3.4.1 which fixes the problem.

Cheers

**@graphieros** [maintainer]:

@AaaaaaaHu 

Indeed, sorry for the regression.
Fixed in v3.4.2

**@AaaaaaaHu** (+1):

<img width="910" height="615" alt="Image" src="https://github.com/user-attachments/assets/8ef77fbe-e0bf-4872-bced-5d1894b84a00" />
Like the data in the picture, there is one data with a percentage of 100%, but only a little progress bar is actually drawn.