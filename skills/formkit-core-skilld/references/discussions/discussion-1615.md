---
number: 1615
title: Cant get locale to change
category: General
created: 2025-02-17
url: "https://github.com/orgs/formkit/discussions/1615"
upvotes: 1
comments: 0
answered: false
---

# Cant get locale to change



```js
// formkit.config.mjs
import { defineFormKitConfig } from '@formkit/vue'
import { rootClasses } from './formkit.theme.mjs'
import { el } from '@formkit/i18n'

export default defineFormKitConfig({
    config: {
        rootClasses,
        locales: { el },
        locale: 'el',
    }
})

// main.js
import { plugin, defaultConfig } from '@formkit/vue'
import config from '../formkit.config.mjs'
...
app.use(plugin, defaultConfig(config()));


```

I even tried putting the button from the docs to change locale manually and still nothing 

```html
                <button class="border-2 px-2 py-1 mb-4" @click="changeLocale('el')">
                    Set to Greek
                </button>

```