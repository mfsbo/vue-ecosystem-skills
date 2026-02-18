---
number: 109
title: Versioning
type: other
state: open
created: 2020-10-27
url: "https://github.com/vuejs/vitepress/issues/109"
reactions: 34
comments: 17
---

# Versioning

**Is your feature request related to a problem? Please describe.**
Related to documentation versioning

**Describe the solution you'd like**
A way to version a set of markdown documents

**Describe alternatives you've considered**
Similar to VuePress Plugin or Docusaurus2


---

## Top Comments

**@brc-dd** [maintainer] (+5):

Well there is another workaround. Move your old docs to a subdomain. Then you can write config like this:

```js
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    nav: [
      {
        text: 'v3 (stable)',
        items: [
          {
            text: 'v2 (legacy)',
            link: 'https://v2.vuejs.org/'
          }
        ]
      }
    ]
  }
})
```

It will be rendered like this:




**@DMiradakis** (+2):

+1 this would really be essential. I'm trying to think of how to build this in VitePress, but I'm not sure at the moment.

**@jcstein** (+1):

hi again @brc-dd - do you have recommended practices on moving old versions to subdomain? if you do, have you seen anyone do this on github pages? we're thinking of moving another docs site to vitepress, but this is the one remaining blocker