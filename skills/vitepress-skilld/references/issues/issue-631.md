---
number: 631
title: Add internationalization feature
type: other
state: closed
created: 2022-05-19
url: "https://github.com/vuejs/vitepress/issues/631"
reactions: 18
comments: 9
---

# Add internationalization feature

related https://github.com/vuejs/vitepress/issues/628

VitePress Next don't have this feature yet. Let's implement it. While doing so, I would also like to suggest new config structure for `locales` option.

Currently, we must define two `locales` when defining multi locale site. One in app config level, and one in theme config level.

I think it's much easier to just be able to define locale on top level only.

```js
export default {
  // Top level config for default and fallbacks.
  lang: 'en',
  title: 'VitePress',
  themeConfig: { ... }
  
  // All other locale settings.
  locales: {
    fr: {
      lang: 'fr',
      title: 'VitePress',
      themeConfig: { ... }
    },

    ja: {
      lang: 'ja',
      title: 'VitePress',
      themeConfig: { ... }
    }
  }
}
```

This should make typings much simpler too (maybe). It should eliminate weird situation like in #628  

Also, maybe not required for 1.0.0 release, but consider #291 as well.

---

## Top Comments

**@brc-dd** [maintainer] (+3):

@Zhengqbbb Yeah the Algolia part is not properly implemented yet.

@trincadev Actually this issue is for v1 (alpha, formerly next), and #41 was for v0 (it had i18n support).

**@MarkusKeck** [maintainer]:

@brc-dd  @kiaking Is there any update regarding this topic?

At the moment I need to have different .md files for each language, this results in different urls for each language, which can also lead to problems if you want to refer to your page from external sources, cause you already specify the language for the visiting person.

Is it possible to use the default browser locale for this and vitepress decides which language is needed and the .md files load the string from a json file for the current language like every other framework / library does?
The need to have the exact same page m...

**@lmtr0** (+3):

Hi there, whats the implementation status of this issue? is there a branch I can try out with the most advance features?