# Frontmatter

## استفاده {#usage}

ویتپرس پشتیبانی از frontmatter YAML در تمام فایلهای Markdown را دارد و آنها را با استفاده از gray-matter تجزیه میکند. Frontmatter باید در بالای فایل Markdown قرار داشته باشد (قبل از هر عنصر از جمله برچسبهای `<script>`) و باید به صورت YAML معتبر واقع در بین خطوط خط کشیده شود. به عنوان مثال:

```md
---
title: مستندات با ویتپرس
editLink: true
---
```

بسیاری از گزینههای پیکربندی سایت یا پیشفرض در تمام frontmatter گزینههای متناظر دارند. شما میتوانید از frontmatter برای لغو عملکرد خاص برای صفحه فعلی استفاده کنید. برای جزئیات بیشتر، به [مرجع پیکربندی Frontmatter](../reference/frontmatter-config) مراجعه کنید.

همچنین میتوانید دادههای اختصاصی frontmatter خود را تعریف کنید تا در بیانیههای پویا Vue در صفحه استفاده شود.

## دسترسی به دادههای Frontmatter {#accessing-frontmatter-data}

دادههای frontmatter میتوانند از طریق متغیر global ویژه `$frontmatter` دسترسی داشته باشند:

اینجا یک مثال از نحوه استفاده از آن در فایل Markdown شما است:

```md
---
title: مستندات با ویتپرس
editLink: true
---

# {{ $frontmatter.title }}

محتوای راهنما
```

شما همچنین میتوانید دادههای frontmatter صفحه فعلی را در `<script setup>` با استفاده از راهنمای [`useData()`](../reference/runtime-api#usedata) به دست آورید.

## فرمتهای جایگزین Frontmatter {#alternative-frontmatter-formats}

ویتپرس همچنین از نحوه نوشتاری frontmatter JSON با استفاده از تکیهگاههای آغازین و پایانی در آکولاد پشتیبانی میکند:

```json
---
{
  "title": "عنوان",
  "editLink": true
}
---
```