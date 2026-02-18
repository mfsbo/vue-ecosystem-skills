---
number: 75
title: VueUiCarouselTable component configuration
category: Q&A
created: 2024-10-08
url: "https://github.com/graphieros/vue-data-ui/discussions/75"
upvotes: 1
comments: 1
answered: true
---

# VueUiCarouselTable component configuration

Why does the VueUiCarouselTable setting dataset `head` appear on the left instead of the top of the demo? What do I need to set up? I didn't find the option
`document`

`mine`



---

## Accepted Answer

**@graphieros** [maintainer]:

This is the responsive layout, which kicks in under 400px by default.
If you never want responsive mode you can set a very low responsiveBreakpoint value in the config.