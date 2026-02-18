---
outline: deep
---

# گسترش تم پیشفرض {#extending-the-default-theme}

تم پیشفرض ویتپرس برای مستندات بهینهسازی شده است و قابلیت سفارشیسازی دارد. برای دریافت لیست جامع گزینهها، به [نمای کلی از تنظیمات تم پیشفرض](../reference/default-theme-config) مراجعه کنید.

با این حال، مواردی وجود دارد که فقط با تنظیمات کافی نخواهد بود. به عنوان مثال:

1. نیاز به تنظیم استایل CSS دارید؛
2. نیاز به اصلاح نمونه برنامه Vue، به عنوان مثال برای ثبت مولفههای عمومی؛
3. نیاز به درج محتوای سفارشی در تم از طریق slotهای طرح.

این سفارشهای پیشرفته نیازمند استفاده از یک تم سفارشی هستند که از تم پیشفرض "گسترش" میکند.

::: tip نکته
قبل از ادامه، ابتدا [استفاده از یک تم سفارشی](./custom-theme) را بخوانید تا نحوه کار تمهای سفارشی را درک کنید.
:::

## سفارشیسازی CSS {#customizing-css}

CSS تم پیشفرض با نادیده گرفتن متغیرهای CSS سطح ریشه قابل سفارشیسازی است:

```js [.vitepress/theme/index.js]
import DefaultTheme from 'vitepress/theme'
import './custom.css'

export default DefaultTheme
```

```css
/* .vitepress/theme/custom.css */
:root {
  --vp-c-brand-1: #646cff;
  --vp-c-brand-2: #747bff;
}
```

لیست متغیرهای CSS تم پیشفرض که میتوانند سفارشیسازی شوند را ببینید.

## استفاده از فونتهای مختلف {#using-different-fonts}

ویتپرس از Inter به عنوان فونت پیشفرض استفاده میکند و فونتها را در خروجی ساختهشده شامل میشود. این فونت همچنین در محصولات خودکار پیشبارگذاری میشود. با این حال، این ممکن است مطلوب نباشد اگر میخواهید از یک فونت اصلی مختلف استفاده کنید.

برای جلوگیری از شامل شدن Inter در خروجی ساختهشده، تم را به جای `vitepress/theme-without-fonts` وارد کنید:

```js [.vitepress/theme/index.js]
import DefaultTheme from 'vitepress/theme-without-fonts'
import './my-fonts.css'

export default DefaultTheme
```

```css
/* .vitepress/theme/custom.css */
:root {
  --vp-font-family-base: /* فونت متن عادی */
  --vp-font-family-mono: /* فونت کد */
}
```

::: warning هشدار
اگر از مولفههای اختیاری مانند مولفههای [صفحه تیم](../reference/default-theme-team-page) استفاده میکنید، اطمینان حاصل کنید که آنها را هم از `vitepress/theme-without-fonts` وارد میکنید!
:::

اگر فونت شما یک فایل محلی است که از طریق `@font-face` ارجاع شده است، به عنوان یک دارایی پردازش میشود و با نام فایل هشداردار در `.vitepress/dist/assets` شامل میشود. برای پیشبارگذاری این فایل، از هوک ساخت [transformHead](../reference/site-config#transformhead) استفاده کنید:

```js [.vitepress/config.js]
export default {
  transformHead({ assets }) {
    // منظور شده برای همسان سازی font خود، regex مورد نیاز را تنظیم کنید
    const myFontFile = assets.find(file => /font-name\.\w+\.woff2/)
    if (myFontFile) {
      return [
        [
          'link',
          {
            rel: 'preload',
            href: myFontFile,
            as: 'font',
            type: 'font/woff2',
            crossorigin: ''
          }
        ]
      ]
    }
  }
}
```

## ثبت مولفههای عمومی {#registering-global-components}

```js [.vitepress/theme/index.js]
import DefaultTheme from 'vitepress/theme'

/** @type {import('vitepress').Theme} */
export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    // ثبت مولفههای عمومی سفارشیشده خود را
    app.component('MyGlobalComponent' /* ... */)
  }
}
```

اگر از TypeScript استفاده میکنید:
```ts [.vitepress/theme/index.ts]
import type { Theme } from 'vitepress'
import DefaultTheme from 'vitepress/theme'

export default {
  extends: DefaultTheme,
  enhanceApp({ app }) {
    // ثبت مولفههای عمومی سفارشیشده خود را
    app.component('MyGlobalComponent' /* ... */)
  }
} satisfies Theme
```

از آنجا که از Vite استفاده میکنیم، میتوانید از ویژگی import glob در Vite برای خودکار ثبت یک پوشه از مولفهها استفاده کنید.

## slot های طرح {#layout-slots}

کامپوننت `<Layout/>` تم پیشفرض چندین slot دارد که میتوانید محتوا را در موقعیتهای مختلف صفحه در آنها درج کنید. در زیر مثالی از درج یک کامپوننت در قبل از طرح داده شده است:

```js [.vitepress/theme/index.js]
import DefaultTheme from 'vitepress/theme'
import MyLayout from './MyLayout.vue'

export default {
  extends: DefaultTheme,
  // جایگزینی Layout با یک کامپوننت پوشهبندی که slotها را درج میکند
  Layout: MyLayout
}
```

```vue [.vitepress/theme/MyLayout.vue]
<script setup>
import DefaultTheme from 'vitepress/theme'

const { Layout } = DefaultTheme
</script>

<template>
  <Layout>
    <template #aside-outline-before>
      محتوای سفارشی بالای نوار کناری من
    </template>
  </Layout>


</template>
```

یا میتوانید از تابع رندر نیز استفاده کنید.

```js [.vitepress/theme/index.js]
import { h } from 'vue'
import DefaultTheme from 'vitepress/theme'
import MyComponent from './MyComponent.vue'

export default {
  extends: DefaultTheme,
  Layout() {
    return h(DefaultTheme.Layout, null, {
      'aside-outline-before': () => h(MyComponent)
    })
  }
}
```

لیست کاملی از slotهای موجود در طرح پیشفرض:

- وقتی `layout: 'doc'` (پیشفرض) از طریق frontmatter فعال است:
  - `doc-top`
  - `doc-bottom`
  - `doc-footer-before`
  - `doc-before`
  - `doc-after`
  - `sidebar-nav-before`
  - `sidebar-nav-after`
  - `aside-top`
  - `aside-bottom`
  - `aside-outline-before`
  - `aside-outline-after`
  - `aside-ads-before`
  - `aside-ads-after`
- وقتی `layout: 'home'` از طریق frontmatter فعال است:
  - `home-hero-before`
  - `home-hero-info-before`
  - `home-hero-info`
  - `home-hero-info-after`
  - `home-hero-actions-after`
  - `home-hero-image`
  - `home-hero-after`
  - `home-features-before`
  - `home-features-after`
- وقتی `layout: 'page'` از طریق frontmatter فعال است:
  - `page-top`
  - `page-bottom`
- در صفحه یافت نشد (404):
  - `not-found`
- همیشه:
  - `layout-top`
  - `layout-bottom`
  - `nav-bar-title-before`
  - `nav-bar-title-after`
  - `nav-bar-content-before`
  - `nav-bar-content-after`
  - `nav-screen-content-before`
  - `nav-screen-content-after`


## استفاده از API انتقال نمایش {#using-view-transitions-api}

### در تغییر ظاهر {#on-appearance-toggle}

شما میتوانید تم پیشفرض را گسترش دهید تا هنگام تغییر حالت رنگ، یک انتقال سفارشی را فراهم کند. به عنوان مثال:

```vue [.vitepress/theme/Layout.vue]
<script setup lang="ts">
import { useData } from 'vitepress'
import DefaultTheme from 'vitepress/theme'
import { nextTick, provide } from 'vue'

const { isDark } = useData()

const enableTransitions = () =>
  'startViewTransition' in document &&
  window.matchMedia('(prefers-reduced-motion: no-preference)').matches

provide('toggle-appearance', async ({ clientX: x, clientY: y }: MouseEvent) => {
  if (!enableTransitions()) {
    isDark.value = !isDark.value
    return
  }

  const clipPath = [
    `circle(0px at ${x}px ${y}px)`,
    `circle(${Math.hypot(
      Math.max(x, innerWidth - x),
      Math.max(y, innerHeight - y)
    )}px at ${x}px ${y}px)`
  ]

  await document.startViewTransition(async () => {
    isDark.value = !isDark.value
    await nextTick()
  }).ready

  document.documentElement.animate(
    { clipPath: isDark.value ? clipPath.reverse() : clipPath },
    {
      duration: 300,
      easing: 'ease-in',
      pseudoElement: `::view-transition-${isDark.value ? 'old' : 'new'}(root)`
    }
  )
})
</script>

<template>
  <DefaultTheme.Layout />
</template>

<style>
::view-transition-old(root),
::view-transition-new(root) {
  animation: none;
  mix-blend-mode: normal;
}

::view-transition-old(root),
.dark::view-transition-new(root) {
  z-index: 1;
}

::view-transition-new(root),
.dark::view-transition-old(root) {
  z-index: 9999;
}

.VPSwitchAppearance {
  width: 22px !important;
}

.VPSwitchAppearance .check {
  transform: none !important;
}
</style>
```

نتیجه (**هشدار!**: رنگهای فلاشینگ، حرکات ناگهانی، نورهای شدید):

<details>
<summary>نمایش</summary>

![نمایش انتقال ظاهر تغییر](/appearance-toggle-transition.webp)

</details>

برای جزئیات بیشتر در مورد انتقالهای نمایش به اسناد کروم مراجعه کنید.

### در تغییر مسیر {#on-route-change}

به زودی.

## جایگزینی کامپوننتهای داخلی {#overriding-internal-components}

شما میتوانید با استفاده از alias های Vite، کامپوننتهای تم پیشفرض را با کامپوننتهای سفارشی خود جایگزین کنید:

```ts
import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vitepress'

export default defineConfig({
  vite: {
    resolve: {
      alias: [
        {
          find: /^.*\/VPNavBar\.vue$/,
          replacement: fileURLToPath(
            new URL('./components/CustomNavBar.vue', import.meta.url)
          )
        }
      ]
    }
  }
})
```

برای دریافت نام دقیق کامپوننت به کد منبع ما مراجعه کنید. از آنجا که کامپوننتها داخلی هستند، احتمال آنکه نام آنها بین انتشارات کوچک تغییر کند، وجود دارد.
