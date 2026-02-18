---
number: 607
title: "[Vue/Nuxt] SSR & reactivity breaking"
type: other
state: open
created: 2025-07-21
url: "https://github.com/f5/unovis/issues/607"
reactions: 2
comments: 24
---

# [Vue/Nuxt] SSR & reactivity breaking

Hopefully this link works:
https://stackblitz.com/edit/github-riylyusg?file=app%2Fapp.vue

If not, attaching repro ZIP: 

github-riylyusg.zip


Based on the traceback, `@unovis/ts/utils/misc` imports `to-px` which in turn has

```js
var PIXELS_PER_INCH = getSizeBrutal('in', document.body) // 96
```

on the top level, but this won't work in SSR.

---

~~The same reproduction should also highlight issue with reactivity with `data` passed to the map, as there is no watcher on `data` calling `setData` here: https://github.com/f5/unovis/blob/main/packages/vue/src/html-components/leaflet-map/index.vue#L12~~ closed by #630 

---

...