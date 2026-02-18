---
number: 4425
title: Support native CSS layers
type: other
state: open
created: 2024-12-14
url: "https://github.com/vuejs/vitepress/issues/4425"
reactions: 7
comments: 6
---

# Support native CSS layers

### Is your feature request related to a problem? Please describe.

Hello,

I'm building a component library for Vue. I use VitePress for the documentation and I want to display components in a custom Vue component in each page. I use Tailwind CSS 4 to style my component. So I use Tailwind CSS 4 in the VitePress documentation with the default theme. Everything was working fine until I add styles to components.

Because Tailwind CSS 4 now use native CSS layers, unlayered styles have more priorities that the layered styles (https://developer.mozilla.org/en-US/docs/Web/CSS/@layer#description). This is an issue because the `base.css` file (https://github.com/vuejs/vitepress/blob/main/src/client/theme-default/styles/base.css) reset styles and takes precedence over Tailwind CSS generated styles.

In order to fix this issue, I create a local patch where I add a layer around. This workaround works fine but what do you think of using native CSS layer in VitePress (maybe for v2 since the workaround is easy and working fine) and this new behavior could break some VitePress applications.

<details><summary>Patch</summary>
<p>

...

---

## Top Comments

**@dealenx** (+6):

The solution that helped me 3523

Install postcss:
```
$ npm add -D postcss
```
Create a file named postcss.config.mjs and add this to it:
```
import { postcssIsolateStyles } from 'vitepress'

export default {
    plugins: [
        postcssIsolateStyles({
            includeFiles: [/vp-doc\.css/, /base\.css/]
        })
    ]
}
```

And then use
```
:::raw
<TAILWIND HTML>
:::

```


Example: https://github.com/dealenx/vitepress-tailwind



**@brc-dd** [maintainer] (+1):

> but I wanted to import the search component and as soon as I did that it brought a bunch of extra styles that overrode my own

Import the component from dist:

```ts
import VPNavBarSearch from 'vitepress/dist/client/theme-default/components/VPNavBarSearch.vue'
```

That will only pull docsearch styles and scoped styles.

**@brc-dd** [maintainer] (+2):

Yeah maybe for v2. We will probably do a theme overhaul too with that (need to review a11y, use p3 colors / color-mix for brand colors?, font-relative units and dir-relative properties, zero specificity selectors and better internal naming so that overriding them via css is easier...)

Most likely support for older browsers will be dropped for things which can't be added progressively / down compiled by lightningcss.