---
outline: deep
---

# تنظیمات سایت {#site-config}

تنظیمات سایت جایی است که میتوانید تنظیمات جهانی سایت را تعریف کنید. گزینههای تنظیمات برنامه شامل تنظیماتی است که برای هر سایت ویتپرس اعمال میشود، صرف نظر از اینکه از چه تمی استفاده میکند. برای مثال، دایرکتوری پایه یا عنوان سایت.

## مروری کلی {#overview}

### رفع تنظیمات {#config-resolution}

فایل تنظیمات همیشه از `<root>/.vitepress/config.[ext]` رفع میشود، جایی که `<root>` ریشه پروژه ویتپرس شما است و `[ext]` یکی از پسوندهای فایل پشتیبانی شده است. تایپاسکریپت به طور پیشفرض پشتیبانی میشود. پسوندهای پشتیبانی شده شامل `.js`, `.ts`, `.mjs` و `.mts` هستند.

توصیه میشود از سینتکس ماژولهای ES در فایلهای تنظیمات استفاده کنید. فایل تنظیمات باید به طور پیشفرض یک شیء صادر کند:

```ts
export default {
  // گزینههای تنظیمات سطح برنامه
  lang: 'en-US',
  title: 'ویتپرس',
  description: 'مولد سایت استاتیک توسط Vite & Vue.',
  ...
}
```

:::details تنظیمات پویا (غیرهمزمان)

اگر نیاز دارید به طور پویا تنظیمات را تولید کنید، میتوانید یک تابع صادر کنید. به عنوان مثال:

```ts
import { defineConfig } from 'vitepress'

export default async () => {
  const posts = await (await fetch('https://my-cms.com/blog-posts')).json()

  return defineConfig({
    // گزینههای تنظیمات سطح برنامه
    lang: 'en-US',
    title: 'ویتپرس',
    description: 'مولد سایت استاتیک توسط Vite & Vue.',

    // گزینههای تنظیمات سطح تم
    themeConfig: {
      sidebar: [
        ...posts.map((post) => ({
          text: post.name,
          link: `/posts/${post.name}`
        }))
      ]
    }
  })
}
```

همچنین میتوانید از `await` سطح بالا استفاده کنید. به عنوان مثال:

```ts
import { defineConfig } from 'vitepress'

const posts = await (await fetch('https://my-cms.com/blog-posts')).json()

export default defineConfig({
  // گزینههای تنظیمات سطح برنامه
  lang: 'en-US',
  title: 'ویتپرس',
  description: 'مولد سایت استاتیک توسط Vite & Vue.',

  // گزینههای تنظیمات سطح تم
  themeConfig: {
    sidebar: [
      ...posts.map((post) => ({
        text: post.name,
        link: `/posts/${post.name}`
      }))
    ]
  }
})
```

:::

### هوشمندی تنظیمات {#config-intellisense}

استفاده از تابع `defineConfig` هوشمندی تایپاسکریپت را برای گزینههای تنظیمات فراهم میکند. فرض کنید IDE شما از آن پشتیبانی میکند، این باید هم در جاوااسکریپت و هم تایپاسکریپت کار کند.

```js
import { defineConfig } from 'vitepress'

export default defineConfig({
  // ...
})
```

### تنظیمات تایپشده تم {#typed-theme-config}

به طور پیشفرض، تابع `defineConfig` انتظار دارد نوع تنظیمات تم از تم پیشفرض باشد:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    // نوع `DefaultTheme.Config`
  }
})
```

اگر از تم سفارشی استفاده میکنید و میخواهید بررسی نوع برای تنظیمات تم داشته باشید، باید به جای آن از `defineConfigWithTheme` استفاده کنید و نوع تنظیمات تم سفارشی خود را از طریق یک آرگومان جنریک منتقل کنید:

```ts
import { defineConfigWithTheme } from 'vitepress'
import type { ThemeConfig } from 'your-theme'

export default defineConfigWithTheme<ThemeConfig>({
  themeConfig: {
    // نوع `ThemeConfig`
  }
})
```

### تنظیمات Vite, Vue و Markdown {#vite-vue-markdown-config}

- **Vite**

  شما میتوانید نمونه پایه Vite را با استفاده از گزینه [vite](#vite) در تنظیمات ویتپرس خود پیکربندی کنید. نیازی به ایجاد فایل تنظیمات Vite جداگانه نیست.

- **Vue**

  ویتپرس از قبل پلاگین رسمی Vue برای Vite (@vitejs/plugin-vue) را شامل میشود. شما میتوانید گزینههای آن را با استفاده از گزینه [vue](#vue) در تنظیمات ویتپرس خود پیکربندی کنید.

- **Markdown**

  شما میتوانید نمونه پایه Markdown-It را با استفاده از گزینه [markdown](#markdown) در تنظیمات ویتپرس خود پیکربندی کنید.

## متادادههای سایت {#site-metadata}

### عنوان {#title}

- نوع: `string`
- پیشفرض: `ویتپرس`
- میتواند به ازای هر صفحه از طریق [frontmatter](./frontmatter-config#title) جایگزین شود.

عنوان سایت. هنگامی که از تم پیشفرض استفاده میکنید، این در نوار ناوبری نمایش داده میشود.

همچنین به عنوان پسوند پیشفرض برای تمام عناوین صفحات فردی استفاده میشود، مگر اینکه [`titleTemplate`](#titletemplate) تعریف شده باشد. عنوان نهایی صفحهای به محتوای متنی اولین هدر `<h1>` آن صفحه ترکیب میشود با `title` جهانی به عنوان پسوند. به عنوان مثال با تنظیمات زیر و محتوای صفحه:

```ts
export default {
  title: 'سایت فوقالعاده من'
}
```

```md
# سلام
```

عنوان صفحه خواهد بود `سلام | سایت فوقالعاده من`.

### قالب عنوان  {##titletemplate}

- نوع: `string | boolean`
- میتواند به ازای هر صفحه از طریق [frontmatter](./frontmatter-config#titletemplate) جایگزین شود.

اجازه میدهد پسوند عنوان هر صفحه یا کل عنوان را سفارشی کنید. به عنوان مثال:

```ts
export default {
  title: 'سایت فوقالعاده من',
  titleTemplate: 'پسوند سفارشی'
}
```

```md
# سلام
```

عنوان صفحه خواهد بود `سلام | پسوند سفارشی`.

برای سفارشی کردن کامل نحوه نمایش عنوان، میتوانید از نماد `:title` در `titleTemplate` استفاده کنید:

```ts
export default {
  titleTemplate: ':title - پسوند سفارشی'
}
```

اینجا `:title` با متن استنباط شده از اولین هدر `<h1>` صفحه جایگزین میشود. عنوان صفحه مثال قبلی خواهد بود `سلام - پسوند سفارشی`.

این گزینه میتواند به `false` تنظیم شود تا پسوندهای عنوان غیرفعال شوند.

### توضیحات {#description}

- نوع: `string`
- پیشفرض: `یک سایت ویتپرس`
- میتواند به ازای هر صفحه از طریق [frontmatter](./frontmatter-config#description) جایگزین شود.

توضیحات برای سایت. این به عنوان یک تگ `<meta>` در HTML صفحه رندر خواهد شد.

```ts
export default {
  description: 'یک سایت ویتپرس'
}
```

### head

- نوع: `HeadConfig[]`
- پیشفرض: `[]`
- میتواند به ازای هر صفحه از طریق [frontmatter](./frontmatter-config#head) افزوده شود.

عناصر اضافی برای رندر در تگ `<head>` در HTML صفحه. تگهای افزوده شده توسط کاربر قبل از بسته شدن تگ `head`، پس از تگهای ویتپرس رندر میشوند.

```ts
type HeadConfig =
  | [string, Record<string, string>]
  | [string, Record<string, string>, string]
```

#### مثال: اضافه کردن یک favicon {#example-adding-a-favicon}

```ts
export default {
  head: [['link', { rel: 'icon', href: '/favicon.ico' }]]
} // favicon.ico را در دایرکتوری عمومی قرار دهید، اگر base تنظیم شده است، از /base/favicon.ico استفاده کنید.

/* رندر خواهد شد:
  <link rel="icon" href="/favicon.ico">
*/
```

#### مثال: اضافه کردن فونتهای گوگل {#example-adding-google-fonts}

```ts
export default {
  head: [
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.googleapis.com' }
    ],
    [
      'link',
      { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }
    ],
    [
      'link',
      { href: 'https://fonts.googleapis.com/css2?family=Roboto&display=swap', rel: 'stylesheet' }
    ]
  ]
}

/* رندر خواهد شد:
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
*/
```

#### مثال: ثبت یک سرویس ورکر {#example-registering-a-service-worker}

```ts
export default {
  head: [
    [
      'script',
      { id: 'register-sw' },
      `;(() => {
        if ('serviceWorker' in navigator) {
          navigator.serviceWorker.register('/sw.js')
        }
      })()`
    ]
  ]
}

/* رندر خواهد شد

:
  <script id="register-sw">
    ;(() => {
      if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('/sw.js')
      }
    })()
  </script>
*/
```

#### مثال: استفاده از گوگل آنالیتیکس {#example-using-google-analytics}

```ts
export default {
  head: [
    [
      'script',
      { async: '', src: 'https://www.googletagmanager.com/gtag/js?id=TAG_ID' }
    ],
    [
      'script',
      {},
      `window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'TAG_ID');`
    ]
  ]
}

/* رندر خواهد شد:
  <script async src="https://www.googletagmanager.com/gtag/js?id=TAG_ID"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'TAG_ID');
  </script>
*/
```

### زبان {#lang}

- نوع: `string`
- پیشفرض: `en-US`

ویژگی زبان برای سایت. این به عنوان یک تگ `<html lang="en-US">` در HTML صفحه رندر خواهد شد.

```ts
export default {
  lang: 'en-US'
}
```

### پایه {#base}

- نوع: `string`
- پیشفرض: `/`

آدرس پایهای که سایت در آن مستقر خواهد شد. اگر قصد دارید سایت خود را در یک مسیر فرعی مستقر کنید، باید این تنظیم را انجام دهید، به عنوان مثال، صفحات GitHub. اگر قصد دارید سایت خود را در `https://foo.github.io/bar/` مستقر کنید، باید پایه را به `'/bar/'` تنظیم کنید. این باید همیشه با یک اسلش شروع و پایان یابد.

پایه به طور خودکار به تمام آدرسهای URL که با / شروع میشوند در سایر گزینهها اضافه میشود، بنابراین فقط باید آن را یک بار مشخص کنید.

```ts
export default {
  base: '/base/'
}
```

## مسیریابی {#routing}

### cleanUrls

- نوع: `boolean`
- پیشفرض: `false`

وقتی تنظیم شود به `true`، ویتپرس `.html` انتهایی را از URL ها حذف میکند. همچنین ببینید [تولید URL تمیز](../guide/routing#generating-clean-url).

::: هشدار نیاز به پشتیبانی سرور
فعال کردن این ممکن است نیاز به پیکربندی اضافی در پلتفرم میزبان شما داشته باشد. برای اینکه کار کند، سرور شما باید بتواند `/foo.html` را زمانی که `/foo` بازدید میشود **بدون ریدایرکت** سرو کند.
:::

### rewrites

- نوع: `Record<string, string>`

تعریف نقشهبرداریهای سفارشی دایرکتوری <-> URL. جزئیات بیشتر را در [مسیریابی: بازنویسی مسیرها](../guide/routing#route-rewrites) ببینید.

```ts
export default {
  rewrites: {
    'source/:page': 'destination/:page'
  }
}
```

## ساخت {#build}

### srcDir

- نوع: `string`
- پیشفرض: `.`

دایرکتوری که صفحات مارکداون شما در آن ذخیره شدهاند، نسبت به ریشه پروژه. همچنین ببینید [دایرکتوری ریشه و منبع](../guide/routing#root-and-source-directory).

```ts
export default {
  srcDir: './src'
}
```

### srcExclude

- نوع: `string`
- پیشفرض: `undefined`

یک الگوی glob برای تطبیق فایلهای مارکداون که باید به عنوان محتوای منبع حذف شوند.

```ts
export default {
  srcExclude: ['**/README.md', '**/TODO.md']
}
```

### outDir

- نوع: `string`
- پیشفرض: `./.vitepress/dist`

مکان خروجی ساخت برای سایت، نسبت به [ریشه پروژه](../guide/routing#root-and-source-directory).

```ts
export default {
  outDir: '../public'
}
```

### assetsDir

- نوع: `string`
- پیشفرض: `assets`

دایرکتوری برای قرار دادن داراییهای تولید شده را مشخص کنید. مسیر باید داخل [`outDir`](#outdir) باشد و نسبت به آن حل شود.

```ts
export default {
  assetsDir: 'static'
}
```

### cacheDir

- نوع: `string`
- پیشفرض: `./.vitepress/cache`

دایرکتوری برای فایلهای کش، نسبت به [ریشه پروژه](../guide/routing#root-and-source-directory). همچنین ببینید: cacheDir.

```ts
export default {
  cacheDir: './.vitepress/.vite'
}
```

### ignoreDeadLinks

- نوع: `boolean | 'localhostLinks' | (string | RegExp | ((link: string) => boolean))[]`
- پیشفرض: `false`

زمانی که به `true` تنظیم شود، ویتپرس به دلیل لینکهای مرده ساختها را شکست نخواهد داد.

وقتی به `'localhostLinks'` تنظیم شود، ساخت بر روی لینکهای مرده شکست خواهد خورد، اما لینکهای `localhost` بررسی نخواهند شد.

```ts
export default {
  ignoreDeadLinks: true
}
```

همچنین میتواند یک آرایه از رشتههای URL دقیق، الگوهای رگکس، یا توابع فیلتر سفارشی باشد.

```ts
export default {
  ignoreDeadLinks: [
    // نادیده گرفتن URL دقیق "/playground"
    '/playground',
    // نادیده گرفتن همه لینکهای localhost
    /^https?:\/\/localhost/,
    // نادیده گرفتن همه لینکهای شامل "/repl/""
    /\/repl\//,
    // تابع سفارشی، نادیده گرفتن همه لینکهای شامل "ignore"
    (url) => {
      return url.toLowerCase().includes('ignore')
    }
  ]
}
```

### metaChunk <Badge type="warning" text="experimental" /> {#metachunk}

- نوع: `boolean`
- پیشفرض: `false`

زمانی که به `true` تنظیم شود، فرادادههای صفحات را به یک قسمت جداگانه جاوااسکریپت استخراج میکند به جای درونگذاری آن در HTML اولیه. این کار باعث کاهش بار HTML هر صفحه میشود و فرادادههای صفحات قابل کش شدن میشود، که منجر به کاهش پهنای باند سرور میشود وقتی که صفحات زیادی در سایت دارید.

### mpa <Badge type="warning" text="experimental" /> {#mpa}

- نوع: `boolean`
- پیشفرض: `false`

زمانی که به `true` تنظیم شود، اپلیکیشن تولید شده در [حالت MPA](../guide/mpa-mode) ساخته خواهد شد. حالت MPA به طور پیشفرض 0 کیلوبایت جاوااسکریپت ارسال میکند، به هزینه غیرفعال کردن ناوبری سمت کاربر و نیاز به opt-in صریح برای تعامل.

## تمسازی {#theming}

### appearance

- نوع: `boolean | 'dark' | 'force-dark' | 'force-auto' | import('@vueuse/core').UseDarkOptions`
- پیشفرض: `true`

آیا حالت تاریک فعال شود یا نه (با اضافه کردن کلاس `.dark` به عنصر `<html>`).

- اگر گزینه به `true` تنظیم شود، تم پیشفرض با توجه به طرح رنگ مورد نظر کاربر تعیین میشود.
- اگر گزینه به `dark` تنظیم شود، تم به صورت پیشفرض تاریک خواهد بود، مگر اینکه کاربر آن را به صورت دستی تغییر دهد.
- اگر گزینه به `false` تنظیم شود، کاربران قادر به تغییر تم نخواهند بود.
- اگر گزینه به `force-dark` تنظیم شود، تم همیشه تاریک خواهد بود و کاربران نمیتوانند آن را تغییر دهند.
- اگر گزینه به `force-auto` تنظیم شود، تم همیشه با توجه به طرح رنگ مورد نظر کاربر تعیین میشود و کاربران نمیتوانند آن را تغییر دهند.

این گزینه یک اسکریپت داخلی تزریق میکند که تنظیمات کاربران را از حافظه محلی با استفاده از کلید `vitepress-theme-appearance` بازیابی میکند. این اطمینان حاصل میشود که کلاس `.dark` قبل از رندر شدن صفحه اعمال میشود تا از پرش جلوگیری شود.

`appearance.initialValue` فقط میتواند `dark` یا `undefined` باشد. Refs یا getters پشتیبانی نمیشوند.

### lastUpdated

- نوع: `boolean`
- پیشفرض: `false`

آیا زمان آخرین بهروزرسانی برای هر صفحه با استفاده از Git دریافت شود. این زمان در دادههای هر صفحه گنجانده خواهد شد و از طریق [`useData`](./runtime-api#usedata) قابل دسترسی خواهد بود.

وقتی از تم پیشفرض استفاده میکنید، فعال کردن این گزینه زمان آخرین بهروزرسانی هر صفحه را نمایش میدهد. میتوانید متن را از طریق گزینه [`themeConfig.lastUpdatedText`](./default-theme-config#lastupdatedtext) سفارشی کنید.

## سفارشیسازی {#customization}

### markdown

- نوع: `MarkdownOption`

گزینههای پارسر مارکداون را تنظیم کنید. ویتپرس از Markdown-it به عنوان پارسر استفاده میکند و Shiki را برای برجستهسازی نحو زبان استفاده میکند. در داخل این گزینه، میتوانید گزینههای مختلف مرتبط با مارکداون را بر اساس نیازهای خود ارسال کنید.

```js
export default {
  markdown: {...}
}
```

برای مشاهده اعلامیه نوع و jsdocs برای همه گزینههای موجود، type declaration and jsdocs را بررسی کنید.

### vite

- نوع: `import('vite').UserConfig`

پیکربندی خام Vite Config را به سرور توسعه داخلی / بستهبند Vite ارسال کنید.

```js
export default {
  vite: {
    // گزینههای پیکربندی Vite
  }
}
```

### vue

- نوع: `import('@vitejs/plugin-vue').Options`

گزینههای خام `@vitejs/plugin-vue` options را به نمونه افزونه داخلی ارسال کنید.

```js
export default {
  vue: {
    // گزینههای @vitejs/plugin-vue
  }
}
```

## قلابهای ساخت {#build-hooks}

قلابهای ساخت ویتپرس به شما امکان اضافه کردن عملکرد و رفتارهای جدید به وبسایت خود را میدهند:

- نقشه سایت
- شاخصبندی جستجو
- PWA
- Teleports

### buildEnd

- نوع: `(siteConfig: SiteConfig) => Awaitable<void>`

`buildEnd` یک قلاب CLI ساخت است، که بعد از اتمام ساخت (SSG) اجرا میشود اما قبل از خروج از فرآیند CLI ویتپرس.

```ts
export default {
  async buildEnd(siteConfig) {
    // ...
  }
}
```

### postRender

- نوع: `(context: SSGContext) => Awaitable<SSGContext | void>`

`postRender` یک قلاب ساخت است که زمانی که رندر SSG انجام شد، فراخوانی میشود. این امکان را به شما میدهد که محتوای teleports را در حین SSG مدیریت کنید.

```ts
export default {
  async postRender(context) {
    // ...
  }
}
```

```ts
interface SSGContext {
  content: string
  teleports?: Record<string, string>
  [key: string]: any
}
```

### transformHead

- نوع: `(context: TransformContext) => Awaitable<HeadConfig[]>`

`transformHead` یک قلاب ساخت است که برای تغییر head قبل از تولید هر صفحه استفاده میشود. این امکان را به شما میدهد که ورودیهای head اضافه کنید که نمیتوانند به صورت استاتیک به تنظیمات ویتپرس اضافه شوند. شما فقط باید ورودیهای اضافی را برگردانید، آنها به صورت خودکار با موارد موجود ترکیب میشوند.

::: warning هشدار
هیچچیزی را در داخل `context` تغییر ندهید.
:::

```ts
export default {
  async transform

Head(context) {
    // ...
  }
}
```

```ts
interface TransformContext {
  page: string // به عنوان مثال index.md (نسبت به srcDir)
  assets: string[] // همه داراییهای غیر js/css به عنوان URL عمومی کاملاً حل شده
  siteConfig: SiteConfig
  siteData: SiteData
  pageData: PageData
  title: string
  description: string
  head: HeadConfig[]
  content: string
}
```

توجه داشته باشید که این قلاب فقط زمانی که سایت به صورت استاتیک تولید میشود فراخوانی میشود. در زمان توسعه فراخوانی نمیشود. اگر نیاز به اضافه کردن ورودیهای head دینامیک در زمان توسعه دارید، میتوانید به جای آن از قلاب [`transformPageData`](#transformpagedata) استفاده کنید:

```ts
export default {
  transformPageData(pageData) {
    pageData.frontmatter.head ??= []
    pageData.frontmatter.head.push([
      'meta',
      {
        name: 'og:title',
        content:
          pageData.frontmatter.layout === 'home'
            ? `ویتپرس`
            : `${pageData.title} | ویتپرس`
      }
    ])
  }
}
```

#### مثال: اضافه کردن یک canonical URL `<link>` {#example-adding-a-canonical-url-link}

```ts
export default {
  transformPageData(pageData) {
    const canonicalUrl = `https://example.com/${pageData.relativePath}`
      .replace(/index\.md$/, '')
      .replace(/\.md$/, '.html')

    pageData.frontmatter.head ??= []
    pageData.frontmatter.head.push([
      'link',
      { rel: 'canonical', href: canonicalUrl }
    ])
  }
}
```

### transformHtml

- نوع: `(code: string, id: string, context: TransformContext) => Awaitable<string | void>`

`transformHtml` یک قلاب ساخت است که برای تغییر محتوای هر صفحه قبل از ذخیره به دیسک استفاده میشود.

::: warning هشدار
هیچچیزی را در داخل `context` تغییر ندهید. همچنین، تغییر محتوای html ممکن است باعث مشکلات هیدراتاسیون در زمان اجرا شود.
:::

```ts
export default {
  async transformHtml(code, id, context) {
    // ...
  }
}
```

### transformPageData

- نوع: `(pageData: PageData, context: TransformPageContext) => Awaitable<Partial<PageData> | { [key: string]: any } | void>`

`transformPageData` یک قلاب است که برای تغییر `pageData` هر صفحه استفاده میشود. شما میتوانید `pageData` را به صورت مستقیم تغییر دهید یا مقادیر تغییر یافته را برگردانید که به دادههای صفحه ادغام خواهند شد.

::: warning هشدار
هیچچیزی را در داخل `context` تغییر ندهید و دقت کنید که این ممکن است بر عملکرد سرور توسعه تاثیر بگذارد، به ویژه اگر در این قلاب درخواستهای شبکه یا محاسبات سنگین (مانند تولید تصاویر) داشته باشید. میتوانید برای منطق شرطی بررسی کنید `process.env.NODE_ENV === 'production'`.
:::

```ts
export default {
  async transformPageData(pageData, { siteConfig }) {
    pageData.contributors = await getPageContributors(pageData.relativePath)
  }

  // یا دادهها را برای ادغام برگردانید
  async transformPageData(pageData, { siteConfig }) {
    return {
      contributors: await getPageContributors(pageData.relativePath)
    }
  }
}
```

```ts
interface TransformPageContext {
  siteConfig: SiteConfig
}
```