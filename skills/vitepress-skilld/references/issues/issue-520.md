---
number: 520
title: Sitemap generation
type: other
state: closed
created: 2022-02-04
url: "https://github.com/vuejs/vitepress/issues/520"
reactions: 15
comments: 14
labels: "[build, has-workaround]"
---

# Sitemap generation

### Is your feature request related to a problem? Please describe.

vitepress does not generate a sitemap.xml

### Describe the solution you'd like

vitepress should generate a sitemap based on the config.js

### Describe alternatives you've considered

The user could create a sitemap by hand

### Additional context

_No response_

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that reports the same bug to avoid creating a duplicate.

---

## Top Comments

**@brc-dd** [maintainer] (+5):

Ah right, it is exiting the process before stream can finish. Try this for now:

```ts
  buildEnd: async ({ outDir }) => {
    const sitemap = new SitemapStream({
      hostname: 'https://vitepress.vuejs.org/'
    })
    const writeStream = createWriteStream(resolve(outDir, 'sitemap.xml'))
    sitemap.pipe(writeStream)
    links.forEach((link) => sitemap.write(link))
    sitemap.end()
    await new Promise((r) => writeStream.on('finish', r))
  }
```

**@brc-dd** [maintainer] (+4):

On newer versions of VitePress this can be done (there is no need to traverse the dist directory):

```ts
import { createWriteStream } from 'node:fs'
import { resolve } from 'node:path'
import { SitemapStream } from 'sitemap'
import { defineConfig } from 'vitepress'

const links = []

export default {
  // ...

  transformHtml: (_, id, { pageData }) => {
    if (!/[\\/]404\.html$/.test(id))
      links.push({
        // you might need to change this if not using clean urls mode
        url: pageData.relativePath.replace(/((^|\/)index)?\.md$/, '$2'),
        lastmod: pageData.lastUpdated
      })
  },

  buildEnd: ({ outDir }) => {
    const sitemap = new SitemapStream({ hostname: 'https://vitepress.vuejs.org/' })
    const writeStream = createWriteStream(resolve(outDir, 'sitemap.xml'))
    sitemap.pipe(writeStream)
    links.forEach((link) => sitemap.write(link))
    sitemap.end()
  }
}
```...

**@aboutsimon** (+2):

Like you hinted at, in the alternatives, it's fairly straightforward to build out your own sitemap generation. So just for reference, an implementation idea that might work for you, using sitemap.. This assumes you have `srcDir: './pages'` set.

```js
const fs = require('fs')
const path = require('path')
const fg = require('fast-glob')
const { SitemapStream, streamToPromise } = require('sitemap')

console.log('Start building sitemap..')

const linksStream = fg.stream(['./pages/*.md'])
  .map((filePath) => ({ url: filePath.replace('pages/', '').replace(/\.md$/, '.html') }))

const sitemapStream = new SitemapStream({ hostname: 'https://www.example.org' })

// Return a promise that resolves with your XML string
streamToPromise(linksStream.pipe(sitemapStream)).then((sitemap) => {
  fs.writeFileSync(
    path.resolve(__dirname, '../pages/public/sitemap.xml'),
    sitemap,
  )
})
```...