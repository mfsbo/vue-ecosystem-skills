# Auto-Height Textarea Plugin

Automatically adjust the height of your textareas based on their content.

Using the `createAutoHeightTextareaPlugin` function from `@formkit/addons` you can use a new prop (`auto-height`) on your Formkit inputs of type `textarea` to have them automatically grow and shrink in size based on their content.

## Installation

To use this plugin with FormKit, install `@formkit/addons`:

```
yarn add @formkit/addons

```

Once you've installed the addons package, you'll need to register the plugin with FormKit:

```
// formkit.config.ts
import { defaultConfig } from '@formkit/vue'
import { createAutoHeightTextareaPlugin } from '@formkit/addons'

const config = defaultConfig({
  plugins: [
    createAutoHeightTextareaPlugin(),
  ],
})

export default config

```

## Usage

To enable auto-height on a text area add the `auto-height` prop to a FormKit input of type `textarea`.

Available field props:

- **max-auto-height** *Number* Establishes the upper limit for the expansion of a text area, allowing it to dynamically grow in height while ensuring it does not exceed the specified maximum height.

### Example: Auto-Height Textarea

#### auto-height.vue

```vue
<FormKit
    type="textarea"
    auto-height
    label="I have an auto-height plugin"
    help="This textarea will grow as you type"
    :value="value"
  />
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { createAutoHeightTextareaPlugin } from '@formkit/addons'

export default defineFormKitConfig({
  plugins: [createAutoHeightTextareaPlugin()],
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```
