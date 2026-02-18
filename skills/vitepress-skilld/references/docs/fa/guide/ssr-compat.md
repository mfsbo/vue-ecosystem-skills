---
outline: deep
---

# تطابق SSR {#ssr-compatibility}

ویتپرس، با استفاده از قابلیتهای رندرینگ سمت سرور (SSR) ارائه شده توسط Vue، اپلیکیشن را در Node.js در هنگام ساخت تولیدی پیش از رندر میکند. این بدان معناست که کلیه کدهای سفارشی در اجزای تم به تطابق SSR وابسته هستند.

بخش SSR در مستندات رسمی Vue بیشتر در مورد SSR، ارتباط بین SSR / SSG و نکات متداول در نوشتن کدهای سازگار با SSR توضیح میدهد. قانون عمده این است که فقط در `beforeMount` یا `mounted` هوکهای اجزای Vue از APIهای مرورگر / DOM استفاده کنید.

## `<ClientOnly>` {#clientonly}

اگر از اجزا یا دموهایی استفاده میکنید که سازگاری با SSR ندارند (برای مثال حاوی دستورالعملهای سفارشی هستند)، میتوانید آنها را درون کامپوننت داخلی `<ClientOnly>` قرار دهید:

```md
<ClientOnly>
  <NonSSRFriendlyComponent />
</ClientOnly>
```

## کتابخانههایی که در هنگام وارد کردن به API مرورگر دسترسی دارند {#libraries-that-access-browser-api-on-import}

بعضی از کتابخانهها یا اجزا در هنگام وارد کردن به APIهای مرورگر **دسترسی دارند**. برای استفاده از کدی که فرض میکند محیطی مرورگر در هنگام وارد کردن وجود دارد، باید آنها را به صورت پویا وارد کنید.

### وارد کردن در هوک Mounted {#importing-in-mounted-hook}

```vue
<script setup>
import { onMounted } from 'vue'

onMounted(() => {
  import('./lib-that-access-window-on-import').then((module) => {
    // استفاده از کد
  })
})
</script>
```

### وارد کردن شرطی {#conditional-import}

میتوانید همچنین وابستگی را با استفاده از `import.meta.env.SSR` (قسمتی از متغیرهای env Vite) به شرط وارد کنید:

```js
if (!import.meta.env.SSR) {
  import('./lib-that-access-window-on-import').then((module) => {
    // استفاده از کد
  })
}
```

از آنجا که `Theme.enhanceApp` میتواند async باشد، میتوانید به صورت شرطی پلاگینهای Vue را که دسترسی به APIهای مرورگر را هنگام وارد کردن دارند، وارد و ثبت کنید:

```js [.vitepress/theme/index.js]
/** @type {import('vitepress').Theme} */
export default {
  // ...
  async enhanceApp({ app }) {
    if (!import.meta.env.SSR) {
      const plugin = await import('plugin-that-access-window-on-import')
      app.use(plugin.default)
    }
  }
}
```

اگر از TypeScript استفاده میکنید:
```ts [.vitepress/theme/index.ts]
import type { Theme } from 'vitepress'

export default {
  // ...
  async enhanceApp({ app }) {
    if (!import.meta.env.SSR) {
      const plugin = await import('plugin-that-access-window-on-import')
      app.use(plugin.default)
    }
  }
} satisfies Theme
```

### `defineClientComponent` {#defineclientcomponent}

ویتپرس یک کمککننده راحتی برای وارد کردن کامپوننتهای Vue که هنگام وارد کردن به APIهای مرورگر دسترسی دارند فراهم میکند.

```vue
<script setup>
import { defineClientComponent } from 'vitepress'

const ClientComp = defineClientComponent(() => {
  return import('component-that-access-window-on-import')
})
</script>

<template>
  <ClientComp />
</template>
```

همچنین میتوانید props/children/slots را به کامپوننت مقصد منتقل کنید:

```vue
<script setup>
import { ref } from 'vue'
import { defineClientComponent } from 'vitepress'

const clientCompRef = ref(null)
const ClientComp = defineClientComponent(
  () => import('component-that-access-window-on-import'),

  // آرگومانها به h() منتقل میشوند - https://vuejs.org/api/render-function.html#h
  [
    {
      ref: clientCompRef
    },
    {
      default: () => 'اسلات پیشفرض',
      foo: () => h('div', 'فو')
      bar: () => [h('span', 'یک'), h('span', 'دو')]
    }
  ],

  // تابع بازخورد بعد از بارگذاری کامپوننت، میتواند async باشد
  () => {
    console.log(clientCompRef.value)
  }
)
</script>

<template>
  <ClientComp />
</template>
```

کامپوننت مقصد فقط در هوک Mounted کامپوننت پوشش وارد میشود.
