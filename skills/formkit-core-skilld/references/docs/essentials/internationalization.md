# Internationalization (i18n)

Translate FormKit UI and validation messages into supported languages — or provide your own.

FormKit ships with internationalization support for all of its interfaces and validation messages.

## Available languages

Currently, FormKit supports the following languages (in the `@formkit/i18n` package):

- 🇱🇾 Arabic (ar) — @Ahmedelforjani
- 🇦🇿 Azerbaijani (az) — @EmrullahKutlar
- 🇧🇩 Bengali (bn)
- 🇧🇦 Bosnian (bs) — @TarikTz
- 🇧🇬 Bulgarian (bg) — @ivanov1234159
- Catalan (ca) — @petergithubmgw
- 🇨🇳 Chinese (zh) — @myleslee
- 🇨🇳 Chinese Traditional (zh-TW) — @actocoa
- 🇭🇷 Croatian (hr) — @antemarkic
- 🇨🇿 Czech (cs) — @dfridrich
- 🇩🇰 Danish (da) — @bjerggaard
- 🇳🇱 Dutch (nl) — @arjendejong12
- 🇺🇸 English (en)
- 🇫🇮 Finish (fi) — @mihqusta
- 🇫🇷 French (fr) — @HoreKk, @pop123123123
- Frisian (fy) — @arjendejong12
- 🇩🇪 German (de) — @digitalkaoz, @tosling
- 🇬🇷 Greek (el) — @mendrinos
- 🇮🇱 Hebrew (he) — @Hepi420
- 🇭🇺 Hungarian (hu) — @KristofKekesi
- 🇮🇸 Icelandic (is) — @Gunsobal
- 🇮🇩 Indonesian (id) — @rama-adi
- 🇮🇹 Italian (it) — @punga78, @Archetipo95
- 🇯🇵 Japanese (ja) — @wonyx
- 🇰🇿 Kazakh (kk) — @ilya-raevskiy
- 🇰🇷 Korean (ko) — @bwp618, @titusdecali
- 🇱🇻 Latvian (lv) — @Bamslation
- 🇱🇹 Lithuanian (lt) — @balu-lt
- 🇲🇳 Mongolian (mn) — @zemunkh
- 🇳🇴 Norwegian Bokmål (nb) — @hognevevle
- 🇮🇷 Persian (fa) — @shahabbasian
- 🇵🇱 Polish (pl) — @xxSkyy
- 🇧🇷 Portuguese (pt) @r-martins, @dbomfim
- 🇷🇴 Romanian (ro) — @danve
- 🇷🇺 Russian (ru) — @andreimakushkin
- 🇸🇰 Slovak (sk) — @neridev
- 🇸🇮 Slovenian (sl) — @krisflajs
- 🇷🇸 Serbian (sr) — @milos5593
- 🇦🇷 Spanish (es) — @inibg
- 🇸🇪 Swedish (sv) — @purung
- 🇹🇯 Tajik (tg) — @devixrootix
- 🇹🇱 Tetum (tet) — @joshbrooks
- 🇹🇭 Thai (th) — @pknn
- 🇺🇦 Ukrainian (uk) — @aresofficial
- 🇺🇿 Uzbek (uz) — @root5427
- 🇹🇷 Turkish (tr) — @ragokan, @cemkaan
- 🇻🇳 Vietnamese (vi) — @oanhnn

Although flags are poor representations of languages (flags indicate a geographic nation, while languages can be spoken in many ares of the world), we use the flags in the list above to indicate the location of the contributor who created that particular locale.

## Using a locale

FormKit’s `defaultConfig` includes the english locale by default — to add an additional locale, import it from `@formkit/i18n` and append it to the `locales` option when you initialized the FormKit plugin. To set the active locale specify it with the `locale` option:

```
import { createApp } from 'vue'
import App from 'App.vue'
import { plugin, defaultConfig } from '@formkit/vue'
import { de, fr, zh } from '@formkit/i18n'

const app = createApp(App)
app.use(
  plugin,
  defaultConfig({
    // Define additional locales
    locales: { de, fr, zh },
    // Define the active locale
    locale: 'fr',
  })
)
app.mount('#app')

```

## Changing the active locale

There are three ways to change your active locale:

- Using `changeLocale` to globally change the locale.
- Using `this.$formkit.setLocale()` from the Vue plugin (best for options API).
- Rarely used, but useful for directly modifying the root `config` object.

### Using changeLocale

You can change the locale of all FormKit inputs by using the `changeLocale` composable. This is the preferred method when a global change is needed:

### Example: Changing locale

#### change-locale-2.vue

```vue
<script setup>
import { changeLocale } from '@formkit/vue'
</script>

<template>
  <button class="border-2 px-2 py-1 mb-4" @click="changeLocale('zh')">
    Set to Chinese
  </button>
  <FormKit
    type="text"
    validation="required|length:10"
    name="username"
    validation-visibility="live"
  />
</template>
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'
import { zh } from '@formkit/i18n'

export default defineFormKitConfig({
  locales: { zh },
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

### Using root config

When using the composition API, you won’t have access to `this.$formkit`. Instead, you can fetch and modify the root FormKit configuration object. This is made available globally via Vue’s `inject` mechanism and a unique Symbol:

### Example: Changing locale via config

#### locale-change-config.vue

```vue
<script setup>
import { ref, inject } from 'vue'

const current = ref('en')
const config = inject(Symbol.for('FormKitConfig'))

const changeLocale = () => {
  current.value = current.value === 'en' ? 'de' : 'en'
  config.locale = current.value
}
</script>

<template>
  <a @click.prevent="changeLocale" href="#">
    <span v-if="current === 'en'">🇩🇪 config.locale = 'de'</span>
    <span v-if="current === 'de'">🇺🇸 config.locale = 'en'</span>
  </a>
  <FormKit type="form" @submit="() => false">
    <FormKit
      type="email"
      label="Email"
      placeholder="email@example.com"
      validation="required|email"
    />
  </FormKit>
  <small>
    Note: this example does not contain a full german locale, only the messages
    required for this example (submit, required, email).
  </small>
</template>
```

#### formkit.config.ts

```ts
import { defineFormKitConfig } from '@formkit/vue'
import { genesisIcons } from '@formkit/icons'
import { rootClasses } from '~/formkit.theme'

export default defineFormKitConfig({
  locales: {
    de: {
      ui: {
        submit: 'Senden',
      },
      validation: {
        required({ name }) {
          return `${
            name[0].toUpperCase() + name.substr(1)
          } ist ein Pflichtfeld.`
        },
        email: 'Dies ist keine gültige E-Mail.',
      },
    },
  },
  icons: {
    ...genesisIcons,
  },
  config: {
    rootClasses,
  },
})
```

## Overriding

If you find a phrase in your locale isn’t worded the way you prefer, you can override those individual messages globally in your configuration. You can do this by providing a `messages` object to the `defaultConfig`:

```
import { createApp } from 'vue'
import { plugin, defaultConfig } from '@formkit/vue'
import App from 'App.vue'

const app = createApp(App)
app.use(
  plugin,
  defaultConfig({
    messages: {
      en: {
        ui: {
          submit: '🚀 Launch',
        },
      },
    },
  })
)

```

> **Tip:** Messages are generally found under a locale’s ui or validation property. To see a full list of keys and messages checkout the english locale.

## Adding your language

Writing a locale for a language you know is a great way to contribute to FormKit and an easy way to get started with open source too! We are always eager to see pull requests for new locales. To support this effort, we’ve created a locale builder — a small web app to make the translation process as easy as possible.

Of course, you are not required to use our locale builder to submit a language, and are more than welcome to submit a standard pull request with your locale included.

> **Info:** If your language is already on the list (let's say English), but your locality speaks a variation of that language (like 🇬🇧 en-GB), please feel free to submit your localized language.
