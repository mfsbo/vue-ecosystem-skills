---
number: 3023
title: How to use CSS Modules with TanStack Start?
type: other
state: closed
created: 2024-12-16
url: "https://github.com/TanStack/router/issues/3023"
reactions: 57
comments: 72
labels: "[start, revisit-after-devinxi]"
---

# How to use CSS Modules with TanStack Start?

### Which project does this relate to?

Start

### Describe the bug

I'm struggling to make CSS Modules work properly. Currently, the styles are being loaded only on the client, causing a flash of unstyled content (FOUC) during initial render.
I tried in this repo https://github.com/tanstack/router/tree/main/examples/react/start-basic

### Your Example Website or App

https://github.com/nikolayemrikh/start-css-modules-bug

### Steps to Reproduce the Bug or Issue

1. Clone repo https://github.com/nikolayemrikh/start-css-modules-bug
2. Add CSS Modules support by creating a .module.css file and importing it into a React component.
3. Run the server and open the app in a browser.
4. Observe that the styles are applied only after the client-side hydration, causing a flash of unstyled content (FOUC).

### Expected behavior

I would like to see a working example or documentation on how to properly configure TanStack Router with CSS Modules and SSR.
The desired behavior is to have styles included in the server-rendered HTML, so there is no flash of unstyled content (FOUC).


### Screenshots or Videos

_No response_

### Platform

- OS: [e.g. macOS, Windows, Linux]
- Browser: [e.g. Chrome, Safari, Firefox]
- Version: [e.g. 91.1]


### Additional context

_No response_

---

## Top Comments

**@gioruu** (+15):

This worked:

- Add a '?url' to the css import:
`import CSS from '../app.css?url'`

- Add this line to the Route object head:
`links: [{ rel: 'stylesheet', href: CSS }]`

...

**@roboncode** (+9):

@j-mcfarlane, not sure about his repo but when i added the the ?url it worked for me and it started including it in my build

```ts

import { AppProvider } from '@shopify/polaris'
import POLARIS_CSS from '@shopify/polaris/build/esm/styles.css?url'
import enTranslations from '@shopify/polaris/locales/en.json'
import type { ReactNode } from 'react'
import CLIENT_CSS from '../client.css?url'
import { QueryProvider } from '../providers/QueryProvider'

export const Route = createRootRoute({
  head: () => ({
    meta: [
      {
        charSet: 'utf-8',
      },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1',
      },
      {
        title: 'TanStack Start Starter',
      },
    ],
    links: [
      { rel: 'stylesheet', href: CLIENT_CSS },
      { rel: 'stylesheet', href: POLARIS_CSS },
    ],
  }),
  component: RootComponent,
})
```...

**@nikolayemrikh** (+15):

@gioruu, your example works because you use the URL directly in the root. However, it doesn't make sense; we need to have the ability to write CSS and place it next to a component using CSS Modules. Neither CSS Modules nor imports work properly within a component.

It works as expected in other frameworks like Next.js.