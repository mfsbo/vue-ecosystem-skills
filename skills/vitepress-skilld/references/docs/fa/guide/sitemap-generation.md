# جنریت کردن Sitemap {#sitemap-generation}

ویتپرس با پشتیبانی بیرونی برای تولید فایل `sitemap.xml` برای سایت شما ارائه میشود. برای فعالسازی آن، موارد زیر را به فایل `.vitepress/config.js` خود اضافه کنید:

```ts
export default {
  sitemap: {
    hostname: 'https://example.com'
  }
}
```

برای داشتن تگهای `<lastmod>` در فایل `sitemap.xml` خود، میتوانید گزینه [`lastUpdated`](../reference/default-theme-last-updated) را فعال کنید.

## گزینهها {#options}

پشتیبانی از sitemap توسط ماژول `sitemap` ارائه شده است. میتوانید هر گزینهای که توسط این ماژول پشتیبانی میشود را به گزینه `sitemap` در فایل پیکربندی خود منتقل کنید. این گزینهها به طور مستقیم به سازنده `SitemapStream` منتقل میشوند. برای جزئیات بیشتر به مستندات sitemap مراجعه کنید. مثال:

```ts
export default {
  sitemap: {
    hostname: 'https://example.com',
    lastmodDateOnly: false
  }
}
```

اگر از `base` در پیکربندی خود استفاده میکنید، باید آن را به گزینه `hostname` اضافه کنید:

```ts
export default {
  base: '/my-site/',
  sitemap: {
    hostname: 'https://example.com/my-site/'
  }
}
```

## هوک `transformItems` {#transformitems-hook}

میتوانید از هوک `sitemap.transformItems` برای اصلاح موارد sitemap قبل از نوشتن آنها به فایل `sitemap.xml` استفاده کنید. این هوک با یک آرایه از موارد sitemap فراخوانی میشود و انتظار دارد که یک آرایه از موارد sitemap بازگردانده شود. مثال:

```ts
export default {
  sitemap: {
    hostname: 'https://example.com',
    transformItems: (items) => {
      // اضافه کردن موارد جدید یا اصلاح/فیلتر کردن موارد موجود
      items.push({
        url: '/extra-page',
        changefreq: 'monthly',
        priority: 0.8
      })
      return items
    }
  }
}
```