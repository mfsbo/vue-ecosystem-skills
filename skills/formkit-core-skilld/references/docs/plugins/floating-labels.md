# Floating labels

easily add floating labels to your text and textarea inputs.

# Floating Labels Plugin

Using the `createFloatingLabelsPlugin` function from `@formkit/addons` you can easily add a floating label treatment to any `text` family (`text`, `email`, `url`, `date`, etc) or `textarea` FormKit input.

## Installation

To use this plugin with FormKit, install `@formkit/addons`:

```
yarn add @formkit/addons

```

Once you've installed the addons package, you'll need to register the plugin with FormKit and include the supporting CSS styles. The `createFloatingLabelsPlugin` has one option you can configure which controls whether the floating label treatment is the default treatment on applicable inputs:

```
// formkit.config.ts
import { defaultConfig } from '@formkit/vue'
import { createFloatingLabelsPlugin } from '@formkit/addons'
import '@formkit/addons/css/floatingLabels'

const config = defaultConfig({
  plugins: [
    createFloatingLabelsPlugin({
      useAsDefault: true, // defaults to false
    }),
  ],
})

export default config

```

## Usage

By default the floating label plugin only takes effect on a FormKit input if you set the new `floating-label` prop to `true`.

### Example: Floating Label Manual

#### off-by-default.vue

```vue
<FormKit
    type="text"
    label="Floating Text Label via prop"
    :floating-label="true"
  />
  <FormKit
    type="textarea"
    label="Floating Textarea Label via prop"
    :floating-label="true"
  />
  <FormKit type="text" label="I have a standard label" />
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createFloatingLabelsPlugin } from '@formkit/addons'
import '@formkit/addons/css/floatingLabels'

export default defineFormKitConfig({
  plugins: [createFloatingLabelsPlugin()],
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

If you would like to use floating labels by default then pass the `useAsDefault` option to the plugin when you install it.

```
// formkit.config.ts
...
plugins: [
  createFloatingLabelsPlugin({
    useAsDefault: true
  }),
],
...

```

When floating labels are set as the default you can still disable them on a FormKit input by setting the `floating-label` prop to `false`.

### Example: Floating Label Automatic

#### on-by-default.vue

```vue
<FormKit 
    type="text" 
    label="Floating Text Label" 
  />
  <FormKit 
    type="textarea" 
    label="Floating Textarea Label" 
  />
  <FormKit
    type="text"
    label="I have a standard label via prop"
    :floating-label="false"
  />
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createFloatingLabelsPlugin } from '@formkit/addons'
import '@formkit/addons/css/floatingLabels'

export default defineFormKitConfig({
  plugins: [
    createFloatingLabelsPlugin({
      useAsDefault: true,
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

That's It! Floating labels on your FormKit inputs in as little as 3 additional lines of code.
