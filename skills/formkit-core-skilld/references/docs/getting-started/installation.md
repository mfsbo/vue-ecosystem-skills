# Installation

Get up and running with FormKit in your project.

## Prerequisites

- Vue 3+ or Nuxt 3+.
- Vite (strongly recommended for automatic optimizations)
- Node.js: `14.18.0`, `16.12.0`, or higher.
- Terminal: To run `npm`/`yarn`/`pnpm` commands.

## Installation instruction wizard

## Quick Reference

| Scenario | Package | Config File |
|----------|---------|-------------|
| **New project** | `npx formkit@latest create-app` | Auto-generated |
| **Existing Vue + TS** | `npm install @formkit/vue` | `formkit.config.ts` |
| **Existing Vue + JS** | `npm install @formkit/vue` | `formkit.config.js` |
| **Existing Nuxt** | `npm install @formkit/nuxt` | `formkit.config.ts` in nuxt.config |
| **Existing Astro** | `npm install @formkit/vue` | `formkit.config.ts` |

### Styling Options

| Style System | Package | Notes |
|--------------|---------|-------|
| **Tailwind CSS** | `@formkit/themes` | Use `genesis` or `regenesis` theme |
| **Custom CSS** | `@formkit/themes` | Import `genesis/genesis.css` as starting point |
| **No styling** | None | Unstyled, BYO CSS |

### FormKit Pro (Optional)

| Framework | Package | Notes |
|-----------|---------|-------|
| **Vue** | `@formkit/pro` | Add to plugins array in config |
| **Nuxt** | `@formkit/pro` | Add `pro` key to module options |

---

## Detailed Instructions

### Run the FormKit CLI

At your terminal, run `npx formkit@latest create-app` to start your new project:

```sh
npx formkit@latest create-app
```

`create-app` will ask you some questions about your project so it can determine what it needs to install and setup for you:

```sh
✔ Please enter a name for the project › <your-project-name>
✔ What framework would you like to use? › Vite / Nuxt
✔ What language should be used? › TypeScript / Javascript
✔ Would you like to install FormKit Pro? › no / yes
```

Once this is completed, you can follow the instructions to install all dependencies and start a development server:

```sh
Created formkit-app!

To run your new app:
📁 cd <your-project-name>
✅ npm install
🚀 npm run dev
```

### Vue

Most new projects use a build tool like Vite, Snowpack, or webpack. This makes installing npm dependencies a piece of cake :

```sh
npm install @formkit/vue

# If you're using PNPM you should also install some dependency packages.
# pnpm install @formkit/core
```

The `@formkit/vue` package ships with a Vue plugin and a default configuration for easy setup:

```js
import { createApp } from 'vue'
import { plugin, defaultConfig } from '@formkit/vue'
import App from 'App.vue'

createApp(App).use(plugin, defaultConfig).mount('#app')
// remember, each Vue plugin needs its own .use()
// .use(router).use(plugin2)
```

That's it! You're now ready to use the `<FormKit>` component in your Vue 3 application.

### Nuxt 3

Using FormKit with Nuxt requires minimal setup. First include the Nuxt module as a dependency within your project:

```sh
npm install @formkit/nuxt

# If you're using PNPM you should also install some dependency packages.
# pnpm install @formkit/core @formkit/vue
```

Then in your `nuxt.config` file add the module to your modules list:

```js
// nuxt.config
export default defineNuxtConfig({
  modules: ['@formkit/nuxt'],
  formkit: {
    // Experimental support for auto loading (see note):
    autoImport: true
  }
})
```

Though unstyled, FormKit is now registered using the default config and you can start using the `<FormKit>` component.

### Astro

First, we need to install Astro's Vue integration. You can refer to Astro's Vue integration docs for more detail.

Inside of Astro's config file (`astro.config.*`), let's add an entrypoint `_app`. The `_app` entrypoint file is just a configuration file for Vue:

```js
// astro.config.mjs
import { defineConfig } from 'astro/config'
import vue from '@astrojs/vue'

export default defineConfig({
  integrations: [vue({ appEntrypoint: '/src/pages/_app' })],
})
```

Next, install the `@formKit/vue` package:

```sh
npm install @formkit/vue
```

The `@formkit/vue` package ships with a Vue plugin and a default configuration for easy setup:

```js
// src/pages/_app.ts
import type { App } from 'vue'
import { plugin, defaultConfig } from '@formkit/vue'

export default (app: App) => {
  app.use(plugin, defaultConfig)
}
```

Now you can add FormKit to your Astro Vue components, so that you can create a component inside the components folder:

```html
<script setup>
  // src/components/Form.vue

  const submitHandler = async (fields) => {
    // Let's pretend this is an ajax request:
    await new Promise((r) => setTimeout(r, 1000))
    console.log(fields)
  }
</script>

<template>
  <FormKit type="form" @submit="submitHandler">
    <FormKit type="text" label="Name" name: "name" />
    <FormKit type="email" label="Email" name: "email" />
  </FormKit>
</template>
```

After that, you just need to import and use it inside your Astro files:

```js
// src/pages/index.astro
---
import Form from '../components/Form.vue';
---

<Form client:visible />
```

That's it! You're now ready to use the `<FormKit>` component in your Astro application.

## Configuration

To configure FormKit, create a `formkit.config.ts` in the root of your Nuxt project. The Nuxt module automatically uses the `formkit.config.ts` at the root of your project to extend FormKit's functionality. Your config file should export a [configuration object](/essentials/configuration#what-is-defaultconfig).

### formkit.config.ts
```js
import { defineFormKitConfig } from '@formkit/vue'

export default defineFormKitConfig({
  // rules: {},
  // locales: {},
  // etc. 
})
```

### Using environment variables in formkit.config.ts

There may be instances where you want to use Nuxt's `runtimeConfig` variables inside of your `formkit.config.ts` file — such as keeping a FormKit Pro API key from being published in your codebase. To achieve this you can provide a function to `defineFormKitConfig` which returns a configuration object. Your function will be called by Nuxt and have access to `runtimeConfig`:

```js
import { defineFormKitConfig } from '@formkit/vue'
import { createProPlugin, inputs } from '@formkit/pro'

export default defineFormKitConfig(() => {
  // here we can access `useRuntimeConfig` because
  // our function will be called by Nuxt.
  const config = useRuntimeConfig()

  // and we can use the variables to import secrets.
  //
  // ⚠️ this is just an example — if you want to use FormKit Pro
  // you will need to install the @formkit/pro dependency.
  const pro = createProPlugin(config.FORMKIT_PRO_KEY, inputs)

  return {
    plugins: [pro]
  }
})
```

### Defining a custom FormKit config path

If you would like to supply a custom path to your `formkit.config`, you can override the default location using the `configFile` option under the `formkit` key. **Any path you supply should be relative to the root of your Nuxt project**:

```js
// nuxt.config
export default defineNuxtConfig({
  modules: ['@formkit/nuxt'],
  formkit: {
    autoImport: true,
    configFile: './my-configs/formkit.config.ts',
  },
})
```

### Without extending `defaultConfig`

By default, your configuration will _extend_ FormKit's `defaultConfig`. This is desired
for most projects. However, if you need to define the entire FormKit config yourself, you may do so
by setting the `defaultConfig` option for the module to `false`:

```js
// nuxt.config
export default defineNuxtConfig({
  modules: ['@formkit/nuxt'],
  formkit: {
    autoImport: true,
    defaultConfig: false,
    configFile: './my-configs/formkit.config.ts',
    // ^ this is now a full config replacement, not override.
  },
})
```

## Theming

### Adding icons

By default, the icons required by FormKit will be loaded from CDN when requested. If you prefer to include the icons directly in your bundle for increased perfomance, to avoid any pop-in, or to alleviate possible SSR issues, then import the `genesisIcons` set from `@formkit/icons` and spread them into the `icons` property of your FormKit config:

```sh
npm install @formkit/icons
```

```js
import { genesisIcons } from '@formkit/icons'
...
const config = defaultConfig({
  plugins: [proPlugin],
  icons: {
    ...genesisIcons
  }
})
...
```

### Further customization

Once you have a theme in your project, you can customize it further by following the documentation provided in the [styling section of the FormKit docs](/essentials/styling).

## Theming

FormKit ships a (legacy) CSS theme called `genesis` which can be added by installed from the `@formkit/themes` package.

### CDN Usage

To load `genesis` via CDN, supply it to the `theme` property of your `defaultConfig`:

```js
...
defaultConfig({
  theme: 'genesis' // will load from CDN and inject into document head
})
...
```

### Direct import

```sh
npm install @formkit/themes
```

Assuming you are using a bundler like Vite, Webpack or Nuxt — you can then directly import the theme:

```js
// main.js or formkit.config.ts
import '@formkit/themes/genesis'
```

### Add required icons

By default the icons required by the `genesis` theme will be loaded from CDN when requested. If you prefer to include the icons directly in your bundle for increased perfomance, to avoid any pop-in, or to alleviate possible SSR issues then import the `genesisIcons` set from `@formkit/icons` and spread them into the `icons` property of your FormKit config.

```js
import { genesisIcons } from '@formkit/icons'
...
const config = defaultConfig({
  icons: {
    ...genesisIcons
  }
})
...
```

## Adding Pro Inputs

Installing FormKit Pro is easy! Here are the steps:

#### 1. Get a Project Key

Login to your FormKit Pro account at pro.formkit.com and create a project. A `Project Key` will be provided to you.

#### 2. Install the package

Next, install the `@formkit/pro`:

```bash
npm install @formkit/pro
```

#### 3. Configure your project

Import the `createProPlugin` helper and any desired Pro Inputs from `@formkit/pro`:

```js
// main.js or formkit.config.ts
import { createProPlugin, rating, toggle } from '@formkit/pro'

// Create the Pro plugin with your `Project Key` and desired Pro Inputs:
const proPlugin = createProPlugin('fk-00000000000', {
  rating,
  toggle,
  // any other Pro Inputs
})

// add the plugin to your FormKit config:
const config = defaultConfig({
  plugins: [proPlugin],
})
```
