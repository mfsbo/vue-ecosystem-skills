---
number: 122
title: VueUiQuickChart ignores dataset names
type: bug
state: closed
created: 2024-11-19
url: "https://github.com/graphieros/vue-data-ui/issues/122"
reactions: 1
comments: 2
labels: "[ bug : dataset]"
---

# VueUiQuickChart ignores dataset names

You can see it on the docs page, names start with "Serie 0" instead of "Serie1". 2.3.54 seems to be the last version where this doesn't happen.

---

## Top Comments

**@graphieros** [maintainer] (+1):

Hi @djomlastic 

Thanks for spotting that!

The unit test was giving false positives for that, as it tested with dataset names corresponding to the default ('Serie' + n, when no name is provided by the user, which is pretty stupid ).

Fixed in v2.3.99.

**@djomlastic** (+1):

You're welcome, @graphieros !

Thank you for your awesome library, and for providing a fix so quick!

