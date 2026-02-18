# پاورقی {#footer}

وقتی `themeConfig.footer` حاضر باشد، ویتپرس پاورقی جهانی را در پایین صفحه نمایش میدهد.

```ts
export default {
  themeConfig: {
    footer: {
      message: 'Released under the MIT License.',
      copyright: 'Copyright © 2019-present Evan You'
    }
  }
}
```

```ts
export interface Footer {
  // پیام نمایش داده شده درست قبل از حق نسخه.
  message?: string

  // متن حق نسخه واقعی.
  copyright?: string
}
```

پیکربندی بالا همچنین از رشتههای HTML پشتیبانی میکند. بنابراین، به عنوان مثال، اگر میخواهید متن پاورقی دارای برخی از لینکها باشد، میتوانید پیکربندی را به شکل زیر تنظیم کنید:

```ts
export default {
  themeConfig: {
    footer: {
      message: 'Released under the <a href="https://github.com/vuejs/vitepress/blob/main/LICENSE">MIT License</a>.',
      copyright: 'Copyright © 2019-present <a href="https://github.com/yyx990803">Evan You</a>'
    }
  }
}
```

::: warning هشدار
تنها عناصر مستقیم میتوانند در `message` و `copyright` استفاده شوند زیرا در داخل یک عنصر `<p>` رندر میشوند. اگر میخواهید عناصر بلوکی را اضافه کنید، در نظر داشته باشید که به جای این، از [اسلات `layout-bottom`](../guide/extending-default-theme#layout-slots) استفاده کنید.
:::

توجه داشته باشید که پاورقی نمایش داده نمیشود زمانی که [نوار کناری](./default-theme-sidebar) قابل مشاهده باشد.

## پیکربندی Frontmatter {#frontmatter-config}

این میتواند برای هر صفحه با استفاده از گزینه `footer` در frontmatter غیرفعال شود:

```yaml
---
footer: false
---
```