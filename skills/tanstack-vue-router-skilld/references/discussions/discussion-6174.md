---
number: 6174
title: "Tanstack start: basepath with vite"
category: Q&A
created: 2025-12-21
url: "https://github.com/TanStack/router/discussions/6174"
upvotes: 2
comments: 1
answered: true
---

# Tanstack start: basepath with vite

Does anyone know if its possible or have a simple way to do basepath in vite in an isomorphic way for both dev and production mode.

i did this in dev mode but when the application is built and previewed for production, the assets are not put in a folder matching the prefix specified.

The app is logically looking for the files at the specified prefix however the files are not physically at the location after build.

Use case: Deploying an application at a subpath of a domain

As a base case comparision, this can be done by changing two properties in vite when setting up react-router; changing vite `base` property and react router config `basename` property.

What ive tried with the tanstack vite config so far:


...

---

## Accepted Answer

after a lot of reading and wasnt obvious at all..

but I ended up with the realization that tanstack is using nitro
and nitro exposes a baseUrl

so i ended up adjusting the nitro config too.


```ts
import { defineConfig } from 'vite'
import { devtools } from '@tanstack/devtools-vite'
import { tanstackStart } from '@tanstack/react-start/plugin/vite'
import viteReact from '@vitejs/plugin-react'
import viteTsConfigPaths from 'vite-tsconfig-paths'
import tailwindcss from '@tailwindcss/vite'
import { nitro } from 'nitro/vite'
import svgr from 'vite-plugin-svgr'

const config = defineConfig(() => ({
  base: '/app/',
  build: {
    assetsDir: 'app/assets',
  },
  plugins: [
    devtools(),
    nitro({
      baseURL: '/app/',
    }),
    // this is the plugin that enables path aliases
    viteTsConfigPaths({
      projects: ['./tsconfig.json'],
    }),
    tailwindcss(),
    tanstackStart({
      router: {
        basepath: '/app/',
      },
    }),
    viteReact({
      babel: {
        plugins: ['babel-plugin-react-compiler'],
      },
    }),
    svgr(),
  ],
}))


```...