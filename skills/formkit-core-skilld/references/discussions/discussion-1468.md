---
number: 1468
title: Any way to set a locale per-form, i.e. non-globally?
category: General
created: 2024-07-31
url: "https://github.com/orgs/formkit/discussions/1468"
upvotes: 1
comments: 1
answered: false
---

# Any way to set a locale per-form, i.e. non-globally?

I'm working on an application where different forms need to be localized to different locales. The only internationalization options I see in the documentation are for changing/setting the locale globally. Is there any way to override the global locale on a per-form basis?

---

## Top Comments

**@fenilli** (+1):

Same way you can add `config` as a prop to the FormKit input, you can also use `<FormKitProvider />`