# Save to LocalStorage

Save unsubmitted user form input to localStorage to prevent data loss.

# LocalStorage Plugin

Using the `createLocalStoragePlugin` function from `@formkit/addons`, you can easily save unsubmitted user form inputs to localStorage which will be restored on page load. This is great for preventing data loss in the event a user's browser crashes, tab is closed, or other unforeseen issue causes your application to reload before the user can submit their data.

LocalStorage data is automatically cleared when a form `submit` is called.

## Installation

To use this plugin with FormKit, install `@formkit/addons`:

```
yarn add @formkit/addons

```

Once you've installed the addons package, you'll need to register the plugin with FormKit. The `createLocalStoragePlugin` has options you can configure:

- `prefix` - The prefix assigned to your localStorage key. Defaults to `formkit`.
- `key` - An optional key to include in the localStorage key name, useful for keying data to a particular user.
- `control` - An optional field name for a field in your form you would like to use to enable saving to localStorage when `true`. The field value must be a boolean.
- `maxAge` - The time (in milliseconds) that the saved localStorage should be considered valid. Defaults to 1 hour.
- `debounce` - The debounce to apply to saving data to localStorage. Defaults to `200`ms
- `beforeSave`: — An optional async callback that recieves the form data. Allows modification of form data before saving to localStorage.
- `beforeLoad`: — An optional async callback that recives the form data. Allows modification of the localStorage data before applying to the form.

```
// formkit.config.ts
import { defaultConfig } from '@formkit/vue'
import { createLocalStoragePlugin } from '@formkit/addons'

const config = defaultConfig({
  plugins: [
    createLocalStoragePlugin({
      // plugin defaults:
      prefix: 'formkit',
      key: undefined,
      control: undefined,
      maxAge: 3600000, // 1 hour
      debounce: 200,
      beforeSave: undefined,
      beforeLoad: undefined
    }),
  ],
})

export default config

```

## Usage

To enable saving to localStorage add the `use-local-storage` to your FormKit `form`. The localStorage key will be your provided `prefix` (default is `formkit`) and your form `name` eg. `formkit-contact`.

### Basic example

### Example: Save to LocalStorage

#### basic.vue

```vue
<FormKit type="form" name="contact" use-local-storage @submit="submitHandler">
    <FormKit type="text" name="name" label="Your name" />
    <FormKit type="text" name="email" label="Your email" />
    <FormKit type="textarea" name="message" label="Your message" />
  </FormKit>
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createLocalStoragePlugin } from '@formkit/addons'

export default defineFormKitConfig({
  plugins: [
    createLocalStoragePlugin({
      prefix: 'formkit',
      maxAge: 1000 * 60 * 60, // 1 hour
    }),
  ],
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

That's it! Your form data will now be saved on every `commit` event that the `form` receives. It will remain valid until the `maxAge` set in your plugin config, and the localStorage data is cleared when the `submit` event fires on the target form.

### Restoring values on failed submit

When a user submits your form the matching localStorage entry for the form is deleted. Before deletion the value of the localStorage entry is stored in-memory and can be recovered by calling the `node.restoreCache()` method in your submit handler. This is useful for restoring user-entered data in the event that you have a failure in your submission process such as a server error.

### Example: Save with Key

#### restore.vue

```vue
<script setup>
const failingSubmitHandler = async function (payload, node) {
  // assume a failing request
  await new Promise((r) => setTimeout(r, 1000))
  node.setErrors(['Something went wrong with the server, please try again'])
  // comment out this line and refresh after submit
  // to see how values would otherwise be lost.
  node.restoreCache()
}
</script>

<template>
  <p>
    <em
      ><small
        >Data can be recovered with node.restoreCache()<br />If you reload after
        submit the data will persist.</small
      ></em
    >
  </p>
  <FormKit
    type="form"
    name="contactWithRestore"
    use-local-storage
    @submit="failingSubmitHandler"
  >
    <FormKit type="text" name="name" label="Your name" />
    <FormKit type="text" name="email" label="Your email" />
    <FormKit type="textarea" name="message" label="Your message" />
  </FormKit>
</template>
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createLocalStoragePlugin } from '@formkit/addons'

export default defineFormKitConfig({
  plugins: [createLocalStoragePlugin()],
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

### With unique keys

If you are saving data to localStorage in the context of an app where multiple users might share the same device you can provide a `key` that is unique to the user and each user will then have their own localStorage entry.

### Example: Save with Key

#### key.vue

```vue
<FormKit
      type="form"
      name="contactWithKey"
      :plugins="[
        createLocalStoragePlugin({
          key: user,
        }),
      ]"
      use-local-storage
      @submit="submitHandler"
    >
      <FormKit type="text" name="name" label="Your name" />
      <FormKit type="text" name="email" label="Your email" />
      <FormKit type="textarea" name="message" label="Your message" />
    </FormKit>
```

### With a control

You can allow a user to opt-in to saving their form data to localStorage by supplying the name of a field that returns a `boolean` value. When `true`, values will be saved.

### Example: Save with Control

#### control.vue

```vue
<FormKit
    type="form"
    name="contactWithControl"
    :plugins="[
      createLocalStoragePlugin({
        control: 'save',
      }),
    ]"
    use-local-storage
    @submit="submitHandler"
  >
    <FormKit
      type="checkbox"
      name="save"
      :value="true"
      label="Save my progress as I type"
    />
    <FormKit type="text" name="name" label="Your name" />
    <FormKit type="text" name="email" label="Your email" />
    <FormKit type="textarea" name="message" label="Your message" />
  </FormKit>
```

### With data modification

Using the `beforeSave` and `beforeLoad` async callbacks you can modify the data that is saved to localStorage. This can be useful if you want to run some sort of obfuscation funciton or send the data to your backend to encrypt it. In this examle, we obfuscate the data by base64 encoding the form values.

Note that the form is disabled when loading data from localStorage until our `beforeLoad` callback resolves.

### Example: Save with Modification

#### modification.vue

```vue
<script setup>
import { createLocalStoragePlugin } from '@formkit/addons'
const submitHandler = async function (payload, node) { await new Promise((r) => setTimeout(r, 2000)); node.reset() }

async function beforeSave (value) {
  // fake delay for mock API call
  await new Promise((r) => setTimeout(r, 500))
  return btoa(JSON.stringify(value))
}
async function beforeLoad (value) {
  // fake delay for mock API call
  // note that form is disabled until this is resolved
  await new Promise((r) => setTimeout(r, 1000))
  return JSON.parse(atob(value))
}
</script>

<template>
  <p><em><small>If you check localStorage you will see that saved form data is base64 encoded.</small></em></p>
  <FormKit
    type="form"
    name="contactWithModification"
    :plugins="[
      createLocalStoragePlugin({
        beforeSave,
        beforeLoad
      }),
    ]"
    use-local-storage
    @submit="submitHandler"
  >
    <FormKit type="text" name="name" label="Your name" />
    <FormKit type="text" name="email" label="Your email" />
    <FormKit type="textarea" name="message" label="Your message" />
  </FormKit>
</template>
```

> **Warning:** localStorage form information should be considered transient and ultimately stored in a database. We recommend clearing localStorage keys related to form data when a user logs out of your applications. You can do this by looping over Object.entries(localStorage) and removing all localStorage entries that start with ${prefix}-${id} from your plugin configuration.
