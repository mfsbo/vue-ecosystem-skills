# AutoAnimate

Add smoothing transitions to your FormKit inputs using AutoAnimate.

# AutoAnimate Plugin

AutoAnimate is a zero-config, drop-in animation utility that adds smooth transitions to any web app. It also works great with FormKit.

FormKit doesn't need much animation, but a small tasteful amount can make it clear when elements pop on and off a page, or move around — such as validation messages.

## Installation

To use AutoAnimate with FormKit, install `@formkit/addons`:

```
yarn add @formkit/addons

```

Once you've installed the addons package, you'll need to register the AutoAnimate plugin with FormKit:

```
import { createApp } from 'vue'
import App from 'App.vue'
import { createAutoAnimatePlugin } from '@formkit/addons'
import { plugin, defaultConfig } from '@formkit/vue'

createApp(App).use(plugin, defaultConfig({
  plugins: [
    createAutoAnimatePlugin(
      { 
        /* optional AutoAnimate config */
        // default:
        duration: 250,
        easing: 'ease-in-out',
        delay: 0,
      },
      { 
        /* optional animation targets object */
        // default:
        global: ['outer', 'inner'],
        form: ['form'],
        repeater: ['items'],
      }
    )
  ]
}).mount('#app')

```

If you've installed it correctly, you should have smooth transitions when showing and hiding validation messages:

## Example

### Example: AutoAnimate example

#### auto-animate.vue

```vue
<FormKit type="repeater">
      <FormKit
        label="username"
        type="text"
        value="hello"
        validation="required|length:6"
        validation-visibility="live"
      />
      <FormKit
        label="Email"
        type="email"
        value="invalid@foo."
        validation="required|email"
        validation-visibility="live"
        help="Change me to see animations"
      />
    </FormKit>

    <FormKit
      v-model="fruit"
      label="Select a fruit"
      help="Conditional fields at the root form level will also be animated"
      type="radio"
      name="fruit"
      placeholder="Select the best country"
      :options="['None', 'Apple', 'Strawberry', 'Banana']"
    />
    <FormKit
      v-if="fruit && fruit !== 'None'"
      type="checkbox"
      validation="required|accepted"
      validation-label="Confirmation"
      :label="`Please confirm that you meant to select ${fruit}.`"
    />
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { createProPlugin, inputs } from '@formkit/pro'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createAutoAnimatePlugin } from '@formkit/addons'

const pro = createProPlugin(import.meta.env.VITE_FORMKIT_PRO_KEY, inputs)

export default defineFormKitConfig({
  plugins: [pro, createAutoAnimatePlugin()],
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

That's pretty much all you need to do! AutoAnimate is intended to be a zero-config drop in utility. However, if you really want to fine tune the plugin a little more, you can provide your own AutoAnimate options or plugins. Read more about this on the AutoAnimate documentation site.
