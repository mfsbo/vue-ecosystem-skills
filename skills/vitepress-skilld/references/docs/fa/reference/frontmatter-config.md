---
outline: deep
---

# تنظیمات Frontmatter {#frontmatter-config}

Frontmatter امکان پیکربندی بر اساس صفحه را فراهم میکند. در هر فایل markdown، شما میتوانید از تنظیمات frontmatter برای بازنویسی تنظیمات سطح سایت یا تم استفاده کنید. همچنین، تنظیماتی وجود دارند که فقط میتوانید آنها را در frontmatter تعریف کنید.

نمونه استفاده:

```md
---
title: مستندات با ویتپرس
editLink: true
---
```

شما میتوانید به دادههای frontmatter از طریق `$frontmatter` در بیانیههای Vue دسترسی داشته باشید:

```md
{{ $frontmatter.title }}
```

## title

- نوع: `string`

عنوان صفحه. همانطور که در [config.title](./site-config#title) است، این تنظیمات سطح سایت را بازنویسی میکند.

```yaml
---
title: ویتپرس
---
```

## titleTemplate

- نوع: `string | boolean`

پسوند برای عنوان. همانطور که در [config.titleTemplate](./site-config#titletemplate) است، این تنظیمات سطح سایت را بازنویسی میکند.

```yaml
---
title: ویتپرس
titleTemplate: Vite & Vue powered static site generator
---
```

## description

- نوع: `string`

توضیحات صفحه. همانطور که در [config.description](./site-config#description) است، این تنظیمات سطح سایت را بازنویسی میکند.

```yaml
---
description: ویتپرس
---
```

## head

- نوع: `HeadConfig[]`

تگهای head اضافی برای درج در صفحه فعلی. پس از تگهای head تزریق شده توسط تنظیمات سطح سایت، این تنظیمات درج میشوند.

```yaml
---
head:
  - - meta
    - name: description
      content: hello
  - - meta
    - name: keywords
      content: super duper SEO
---
```

```ts
type HeadConfig =
  | [string, Record<string, string>]
  | [string, Record<string, string>, string]
```

## فقط برای تم پیشفرض {#default-theme-only}

گزینههای frontmatter زیر فقط زمانی قابل استفاده هستند که از تم پیشفرض استفاده میکنید.

### layout

- نوع: `doc | home | page`
- پیشفرض: `doc`

تعیین چیدمان صفحه.

- `doc` - این چیدمان استایلهای مستندات پیشفرض را به محتوای markdown اعمال میکند.
- `home` - چیدمان ویژه برای "صفحه اصلی". شما میتوانید گزینههای اضافی مانند `hero` و `features` را اضافه کنید تا به سرعت یک صفحه نخست زیبا ایجاد کنید.
- `page` - مشابه `doc` عمل میکند اما هیچ استایلی به محتوا اعمال نمیشود. مفید است زمانی که میخواهید یک صفحه کاملاً سفارشی ایجاد کنید.

```yaml
---
layout: doc
---
```

### hero <Badge type="info" text="فقط برای صفحه اصلی" /> {#hero}

تعیین محتویات بخش hero صفحه اصلی هنگامی که `layout` به `home` تنظیم شده است. جزئیات بیشتر در [تم پیشفرض: صفحه اصلی](./default-theme-home-page).

### features <Badge type="info" text="فقط برای صفحه اصلی" /> {#features}

تعیین مواردی که در بخش ویژگیها باید نمایش داده شوند هنگامی که `layout` به `home` تنظیم شده است. جزئیات بیشتر در [تم پیشفرض: صفحه اصلی](./default-theme-home-page).

### navbar

- نوع: `boolean`
- پیشفرض: `true`

آیا باید [نوار ناوبری](./default-theme-nav) نمایش داده شود یا خیر؟

```yaml
---
navbar: false
---
```

### sidebar

- نوع: `boolean`
- پیشفرض: `true`

آیا باید [نوار کناری](./default-theme-sidebar) نمایش داده شود یا خیر؟

```yaml
---
sidebar: false
---
```

### aside

- نوع: `boolean | 'left'`
- پیشفرض: `true`

تعیین مکان کامپوننت aside در چیدمان `doc`.

- اگر این مقدار را به `false` تنظیم کنید، اجرای کانتینر aside جلوگیری میکند.
- اگر این مقدار را به `true` تنظیم کنید، aside به راست اجرا میشود.
- اگر این مقدار را به `'left'` تنظیم کنید، aside به چپ اجرا میشود.

```yaml
---
aside: false
---
```

### outline

- نوع: `number | [number, number] | 'deep' | false`
- پیشفرض: `2`

سطوح سرفصلهای مورد نمایش برای صفحه. همانطور که در [config.themeConfig.outline.level](./default-theme-config#outline) است، این مقدار سطح مجموعه سایت را بازنویسی میکند.

### lastUpdated

- نوع: `boolean | Date`
- پیشفرض: `true`

آیا متن [آخرین بهروزرسانی](./default-theme-last-updated) را در پاورقی صفحه فعلی نمایش دهد یا خیر؟ اگر تاریخ و زمان مشخص شده باشد، به جای زمان اصلاح شده git نمایش داده میشود.

```yaml
---
lastUpdated: false
---
```

### editLink

- نوع: `boolean`
- پیشفرض: `true`

آیا [پیوند ویرایش](./default-theme-edit-link) را در پاورقی صفحه فعلی نمایش دهد یا خیر؟

```yaml
---
editLink: false
---
```

### footer

- نوع: `boolean`
- پیشفرض: `true`

آیا [پاورقی](./default-theme-footer) را

نمایش دهد یا خیر؟

```yaml
---
footer: false
---
```

### pageClass

- نوع: `string`

افزودن نام کلاس اضافی به یک صفحه خاص.

```yaml
---
pageClass: custom-page-class
---
```

سپس میتوانید استایلهای این صفحه خاص را در فایل `.vitepress/theme/custom.css` سفارشی کنید:

```css
.custom-page-class {
    /* استایلهای مخصوص صفحه */
}
```
