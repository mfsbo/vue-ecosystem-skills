# API زمان اجرا {#runtime-api}

ویتپرس چندین API داخلی را ارائه میدهد تا به شما امکان دسترسی به دادههای برنامه را بدهد. همچنین، ویتپرس با چندین کامپوننت داخلی همراه است که میتوانید به صورت جهانی از آنها استفاده کنید.

متدهای کمکی به صورت جهانی از `vitepress` قابل وارد کردن هستند و معمولاً در کامپوننتهای Vue سفارشی تم استفاده میشوند. با این حال، آنها همچنین در صفحات `.md` قابل استفاده هستند زیرا فایلهای markdown به کامپوننتهای فایل تکی Vue ترجمه میشوند.

متدهایی که با `use*` آغاز میشوند نشان میدهند که این یک تابع API ترکیبی Vue 3 ("Composable") است که فقط میتواند در `setup()` یا `<script setup>` استفاده شود.

## `useData` <Badge type="info" text="composable" /> {#usedata}

دادههای خاص به صفحه را برمیگرداند. شیء برگشتی این نوع را دارد:

```ts
interface VitePressData<T = any> {
  /**
   * Metadata سطح سایت
   */
  site: Ref<SiteData<T>>
  /**
   * themeConfig از .vitepress/config.js
   */
  theme: Ref<T>
  /**
   * Metadata سطح صفحه
   */
  page: Ref<PageData>
  /**
   * Frontmatter صفحه
   */
  frontmatter: Ref<PageData['frontmatter']>
  /**
   * پارامترهای مسیر دینامیک
   */
  params: Ref<PageData['params']>
  title: Ref<string>
  description: Ref<string>
  lang: Ref<string>
  isDark: Ref<boolean>
  dir: Ref<string>
  localeIndex: Ref<string>
  /**
   * مکان فعلی hash
   */
  hash: Ref<string>
}

interface PageData {
  title: string
  titleTemplate?: string | boolean
  description: string
  relativePath: string
  filePath: string,
  headers: Header[]
  frontmatter: Record<string, any>
  params?: Record<string, any>
  isNotFound?: boolean
  lastUpdated?: number
}
```

**مثال:**

```vue
<script setup>
import { useData } from 'vitepress'

const { theme } = useData()
</script>

<template>
  <h1>{{ theme.footer.copyright }}</h1>
</template>
```

## `useRoute` <Badge type="info" text="composable" /> {#useroute}

شیء مسیر فعلی را با این نوع برمیگرداند:

```ts
interface Route {
  path: string
  data: PageData
  component: Component | null
}
```

## `useRouter` <Badge type="info" text="composable" /> {#userouter}

نمونه راوتر ویتپرس را برمیگرداند تا بتوانید به صورت برنامهریزیشده به صفحه دیگری ناوبری کنید.

```ts
interface Router {
  /**
   * Route فعلی
   */
  route: Route
  /**
   * به URL جدید ناوبری کنید.
   */
  go: (to?: string) => Promise<void>
  /**
   * قبل از تغییر مسیر فراخوانی میشود. برای لغو ناوبری `false` را برگردانید.
   */
  onBeforeRouteChange?: (to: string) => Awaitable<void | boolean>
  /**
   * قبل از بارگذاری مؤلفه صفحه فراخوانی میشود (پس از بهروزرسانی وضعیت تاریخچه). برای لغو ناوبری `false` را برگردانید.
   */
  onBeforePageLoad?: (to: string) => Awaitable<void | boolean>
  /**
   * پس از تغییر مسیر فراخوانی میشود.
   */
  onAfterRouteChange?: (to: string) => Awaitable<void>
}
```

## `withBase` <Badge type="info" text="helper" /> {#withbase}

- **نوع**: `(path: string) => string`

پایه [پیکربندیشده](./site-config#base) را به یک مسیر URL داده شده اضافه میکند. همچنین به [آدرس پایه](../guide/asset-handling#base-url) مراجعه کنید.

## `<Content />` <Badge type="info" text="component" /> {#content}

کامپوننت `<Content />` محتوای markdown را نمایش میدهد. مفید است [هنگام ایجاد تم شخصی شما](../guide/custom-theme).

```vue
<template>
  <h1>چیدمان شخصی!</h1>
  <Content />
</template>
```

## `<ClientOnly />` <Badge type="info" text="component" /> {#clientonly}

کامپوننت `<ClientOnly />` فقط اسلات خود را در سمت مشتری رندر میکند.

چون برنامههای ویتپرس هنگام ایجاد از سمت سرور در Node.js رندر میشوند، هر استفاده از Vue باید به الزامات کد یکپارچه دنیا پاسخ دهد. به طور خلاصه، اطمینان حاصل کنید که فقط در قالب hooks `beforeMount` یا `mounted` به APIهای Browser / DOM دسترسی دارید.

اگر از کامپوننتهایی استفاده یا نمایش دهندههایی که با SSR سازگار نیستند (مانند دستورالعملهای سفارشی) استفاده میکنید، میتوانید آنها را داخل کامپوننت `ClientOnly` قرار دهید.

```vue-html
<ClientOnly>
  <NonSSRFriendlyComponent />
</ClientOnly>
```

- مرتبط: [سازگاری با SSR](../guide/ssr-compat)

## `$frontmatter` <Badge type="info" text="template global" /> {#frontmatter}

در بیانیههای Vue، به صورت مستقیم به [دادههای frontmatter](../guide/frontmatter) صفحه فعلی دسترسی پیدا کنید.

```md
---
title: سلام
---

# {{ $frontmatter.title }}
```

## `$params` <Badge type="info" text="template global" /> {#params}

در بیانیههای Vue، به صورت مستقیم به [پارامترهای مسیر دینامیک](../guide/routing#dynamic-routes) صفحه فعلی دسترسی پیدا کنید.

```md
- نام بسته: {{ $params.pkg }}
- نسخه: {{ $params.version }}
```