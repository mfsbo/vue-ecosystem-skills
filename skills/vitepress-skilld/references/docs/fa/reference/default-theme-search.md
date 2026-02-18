---
outline: deep
---

# جستجو {#search}

## جستجوی محلی {#local-search}

ویتپرس از جستجوی متن کامل نامتقارن با استفاده از یک فهرست در مرورگر با تشکر از minisearch پشتیبانی میکند. برای فعالسازی این ویژگی، کافی است گزینه `themeConfig.search.provider` را به `'local'` در فایل `.vitepress/config.ts` خود تنظیم کنید:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local'
    }
  }
})
```

نمونه نتیجه:

![تصویر نمایشی از مودال جستجو](/search.png)

همچنین، میتوانید از [Algolia DocSearch](#algolia-search) یا برخی افزونههای جامعهای مانند <https://www.npmjs.com/package/vitepress-plugin-search> یا <https://www.npmjs.com/package/vitepress-plugin-pagefind> استفاده کنید.

### بینالمللیسازی {#local-search-i18n}

میتوانید با استفاده از تنظیماتی مانند این برای جستجوی چندزبانه استفاده کنید:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        locales: {
          zh: { // اگر میخواهید زبان پیشفرض را ترجمه کنید، این را به `root` تغییر دهید
            translations: {
              button: {
                buttonText: 'جستجو',
                buttonAriaLabel: 'جستجو'
              },
              modal: {
                displayDetails: 'نمایش جزئیات',
                resetButtonTitle: 'بازنشانی جستجو',
                backButtonTitle: 'بستن جستجو',
                noResultsText: 'نتیجهای یافت نشد',
                footer: {
                  selectText: 'انتخاب',
                  selectKeyAriaLabel: 'ورود',
                  navigateText: 'پیمایش',
                  navigateUpKeyAriaLabel: 'کلید بالا',
                  navigateDownKeyAriaLabel: 'کلید پایین',
                  closeText: 'بستن',
                  closeKeyAriaLabel: 'esc'
                }
              }
            }
          }
        }
      }
    }
  }
})
```

### گزینههای miniSearch {#minisearch-options}

میتوانید MiniSearch را به این صورت پیکربندی کنید:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        miniSearch: {
          /**
           * @type {Pick<import('minisearch').Options, 'extractField' | 'tokenize' | 'processTerm'>}
           */
          options: {
            /* ... */
          },
          /**
           * @type {import('minisearch').SearchOptions}
           * @default
           * { fuzzy: 0.2, prefix: true, boost: { title: 4, text: 2, titles: 1 } }
           */
          searchOptions: {
            /* ... */
          }
        }
      }
    }
  }
})
```

برای کسب اطلاعات بیشتر به اسناد MiniSearch مراجعه کنید.

### سفارشیسازی رندر محتوا {#custom-content-renderer}

میتوانید تابع استفاده شده برای رندر محتوای Markdown قبل از فهرستبندی آن را سفارشیسازی کنید:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        /**
         * @param {string} src
         * @param {import('vitepress').MarkdownEnv} env
         * @param {import('markdown-it')} md
         */
        _render(src, env, md) {
          // بازگشت رشته HTML
        }
      }
    }
  }
})
```

این تابع از دادههای سایت سمت کلاینت پاک خواهد شد، بنابراین شما میتوانید از APIهای Node.js در آن استفاده کنید.

#### مثال: استثنای صفحات از جستجو {#example-excluding-pages-from-search}

میتوانید با اضافه کردن `search: false` به frontmatter صفحه، صفحات را از جستجو استثنا دهید. به طور جایگزین:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        _render(src, env, md) {
          const html = md.render(src, env)
          if (env.frontmatter?.search === false) return ''
          if (env.relativePath.startsWith('some/path')) return ''
          return html
        }
      }
    }
  }
})
```

::: warning توجه
در صورت ارائه تابع `_render` سفارشی، باید خودتان بررسی کنید که آیا frontmatter `search: false` را مدیریت میکند یا خیر. همچنین، شی env قبل از فراخوانی `md.render` کاملاً پر نمیشود، بنابراین هر بررسیای روی ویژگیهای اختیاری env مانند `frontmatter` باید بعد از آن انجام شود.
:::

#### مثال: تبدیل محتوا - افزودن لینکهای صفحه {#example-transforming-content-adding-anchors}

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'local',
      options: {
        _render(src, env, md) {
          const html = md.render(src, env)
          if (env.frontmatter?.title)
            return md.render(`# ${env.frontmatter.title}`) + html
          return html
        }
      }
    }
  }
})
```

## جستجوی Algolia {#algolia-search}

ویتپرس از جستجو در سایت مستندات شما با استفاده از Algolia DocSearch پشتیبانی میکند. به راهنمای شروع کار آنها مراجعه کنید. در فایل `.vitepress/config.ts` شما نیاز دارید که حداقل موارد زیر را فراهم کنید تا کار کند:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig: {
    search: {
      provider: 'algolia',
      options: {
        appId: '...',
        apiKey: '...',
        indexName: '...'
      }
    }
  }
})
```

### بینالمللیسازی {#algolia-search-i18n}

میتوانید با استفاده از تنظیماتی مانند این برای جستجوی چندزبانه استفاده کنید:

```ts
import { defineConfig } from 'vitepress'

export default defineConfig({
  themeConfig:

 {
    search: {
      provider: 'algolia',
      options: {
        appId: '...',
        apiKey: '...',
        indexName: '...',
        locales: {
          zh: {
            placeholder: 'جستجو در مستندات',
            translations: {
              button: {
                buttonText: 'جستجو در مستندات',
                buttonAriaLabel: 'جستجو در مستندات'
              },
              modal: {
                searchBox: {
                  resetButtonTitle: 'پاک کردن شرایط جستجو',
                  resetButtonAriaLabel: 'پاک کردن شرایط جستجو',
                  cancelButtonText: 'لغو',
                  cancelButtonAriaLabel: 'لغو'
                },
                startScreen: {
                  recentSearchesTitle: 'تاریخچه جستجو',
                  noRecentSearchesText: 'هیچ تاریخچه جستجویی وجود ندارد',
                  saveRecentSearchButtonTitle: 'ذخیره در تاریخچه جستجو',
                  removeRecentSearchButtonTitle: 'حذف از تاریخچه جستجو'
                },
                errorScreen: {
                  titleText: 'نمایش نتایج امکانپذیر نیست',
                  helpText: 'شما ممکن است نیاز به بررسی اتصال اینترنت خود داشته باشید'
                },
                footer: {
                  selectText: 'انتخاب',
                  navigateText: 'جابجایی',
                  closeText: 'بستن',
                  searchByText: 'جستجو توسط'
                },
                noResultsScreen: {
                  noResultsText: 'نتیجهای پیدا نشد',
                  suggestedQueryText: 'میتوانید امتحان کنید',
                  reportMissingResultsText: 'فکر میکنید باید نتایجی وجود داشته باشد؟',
                  reportMissingResultsLinkText: 'برای بازخورد کلیک کنید'
                }
              }
            }
          }
        }
      }
    }
  }
})
```

این گزینهها میتوانند بازنویسی شوند. برای یادگیری بیشتر درباره آنها به اسناد رسمی Algolia مراجعه کنید.

### پیکربندی Crawler {#crawler-config}

در اینجا یک پیکربندی نمونه بر اساس آنچه که این سایت استفاده میکند آمده است:

```ts
new Crawler({
  appId: '...',
  apiKey: '...',
  rateLimit: 8,
  startUrls: ['https://vitepress.dev/'],
  renderJavaScript: false,
  sitemaps: [],
  exclusionPatterns: [],
  ignoreCanonicalTo: false,
  discoveryPatterns: ['https://vitepress.dev/**'],
  schedule: 'at 05:10 on Saturday',
  actions: [
    {
      indexName: 'vitepress',
      pathsToMatch: ['https://vitepress.dev/**'],
      recordExtractor: ({ $, helpers }) => {
        return helpers.docsearch({
          recordProps: {
            lvl1: '.content h1',
            content: '.content p, .content li',
            lvl0: {
              selectors: '',
              defaultValue: 'Documentation'
            },
            lvl2: '.content h2',
            lvl3: '.content h3',
            lvl4: '.content h4',
            lvl5: '.content h5'
          },
          indexHeadings: true
        })
      }
    }
  ],
  initialIndexSettings: {
    vitepress: {
      attributesForFaceting: ['type', 'lang'],
      attributesToRetrieve: ['hierarchy', 'content', 'anchor', 'url'],
      attributesToHighlight: ['hierarchy', 'hierarchy_camel', 'content'],
      attributesToSnippet: ['content:10'],
      camelCaseAttributes: ['hierarchy', 'hierarchy_radio', 'content'],
      searchableAttributes: [
        'unordered(hierarchy_radio_camel.lvl0)',
        'unordered(hierarchy_radio.lvl0)',
        'unordered(hierarchy_radio_camel.lvl1)',
        'unordered(hierarchy_radio.lvl1)',
        'unordered(hierarchy_radio_camel.lvl2)',
        'unordered(hierarchy_radio.lvl2)',
        'unordered(hierarchy_radio_camel.lvl3)',
        'unordered(hierarchy_radio.lvl3)',
        'unordered(hierarchy_radio_camel.lvl4)',
        'unordered(hierarchy_radio.lvl4)',
        'unordered(hierarchy_radio_camel.lvl5)',
        'unordered(hierarchy_radio.lvl5)',
        'unordered(hierarchy_radio_camel.lvl6)',
        'unordered(hierarchy_radio.lvl6)',
        'unordered(hierarchy_camel.lvl0)',
        'unordered(hierarchy.lvl0)',
        'unordered(hierarchy_camel.lvl1)',
        'unordered(hierarchy.lvl1)',
        'unordered(hierarchy_camel.lvl2)',
        'unordered(hierarchy.lvl2)',
        'unordered(hierarchy_camel.lvl3)',
        'unordered(hierarchy.lvl3)',
        'unordered(hierarchy_camel.lvl4)',
        'unordered(hierarchy.lvl4)',
        'unordered(hierarchy_camel.lvl5)',
        'unordered(hierarchy.lvl5)',
        'unordered(hierarchy_camel.lvl6)',
        'unordered(hierarchy.lvl6)',
        'content'
      ],
      distinct: true,
      attributeForDistinct: 'url',
      customRanking: [
        'desc(weight.pageRank)',
        'desc(weight.level)',
        'asc(weight.position)'
      ],
      ranking: [
        'words',
        'filters',
        'typo',
        'attribute',
        'proximity',
        'exact',
        'custom'
      ],
      highlightPreTag: '<span class="algolia-docsearch-suggestion--highlight">',
      highlightPostTag: '</span>',
      minWordSizefor1Typo: 3,
      minWordSizefor2Typos: 7,
      allowTyposOnNumericTokens: false,
      minProximity: 1,
      ignorePlurals: true,
      advancedSyntax: true,
      attributeCriteriaComputedByMinProximity: true,
      removeWordsIfNoResults: 'allOptional'
    }
  }
})
```

