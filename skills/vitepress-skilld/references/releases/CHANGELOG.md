## 1.6.4 (2025-08-05)

## 1.6.3 (2025-01-22)

### Bug Fixes

- docsearch not rendering properly (3e4120e)

## 1.6.2 (2025-01-22)

### Bug Fixes

- fix static content removal for lean chunks due to Vue 3.5 changes (#4508) (8214cae)

## 1.6.1 (2025-01-20)

### Bug Fixes

- **build:** escape `$` in replace pattern in dynamic routes plugin (e812916), closes #4499
- **theme/regression:** broken hero heading at certain viewports (37dbe89)

# 1.6.0 (2025-01-20)

### Bug Fixes

- **build:** out of order css in prod builds (241d17d), closes #4098
- **build:** properly strip vpi-social css declaration in debug mode (c61182a)
- **build:** respect `vite.clearScreen` in build (8ea776a), closes #4468
- **build:** specify mode for iconify (8a5e8ea)
- **theme:** apply `externalLinkIcon` option on `VPHome` (#4492) (fe48943)
- **theme:** don't show external link icon for images (096bba1)
- **theme:** ignore footnote-ref for outline (1832617), closes #4402
- **theme:** includes text to h1 tag for hero page (#4472) (bd896c6), closes #4453

### Features

- **build:** export normalize function from shared chunk (616f63f), closes #4401
- **theme:** allow customizing skip to content label (ff254dc), closes #4288
- **theme:** export VPNavBarSearch (23522ab), closes #4476
- **theme:** export VPFeatures (#4356) (6442e17)

### Miscellaneous

- **build:** shiki transformers now use v3 matching algorithm (373f9b9)

# 1.5.0 (2024-11-04)

### Features

- on-demand social icons (#4339) (05f2f0d), closes #4256 #4135 #4076 #3809 #3750 #1214 #2768 #2861

## 1.4.5 (2024-11-03)

### Bug Fixes

- lang lazy load not working with twoslash (fc92a77), closes #4334
- typo in missing language check (dcb8450)

## 1.4.3 (2024-10-31)

### Performance Improvements

- lazy load shiki languages (#4326) (8299778)

## 1.4.2 (2024-10-29)

### Bug Fixes

- cache markdown-it instance and properly dispose shiki on config reload (#4321) (45968cd) (acfe97f)
- **regression:** hmr not working with markdown includes due to wrong cache key (615aed5), closes #4289 #4303
- remove explicit chinese fonts (#4286) (668e9f7) (b893550), closes #4286
- **theme/a11y:** don't select search result unless mouse is actually moved (e638d85), closes #4297
- **theme:** add types for `VPLink`, `VPSocialLink` and `VPSocialLinks` exports (#4284) (fcae4d5)
- **theme:** don't escape html in `siteTitle` (#4308) (bd690d6)

## 1.4.1 (2024-10-13)

### Bug Fixes

- broken rewrites on windows (#4268) (b46d6d3)
- **client:** use `usePreferredDark` with `appearance: "force-auto"` (#4263) (3e8fc40)
- **client:** wrong script async check (461a5b0)
- **theme:** bind missing no icon prop in the menu link component #4260 (b96712c)
- **theme:** improve local search input a11y (#4066) (92b92ae)

### Features

- **experimental:** support passing function for rewrites (#4274) (8436472)

# 1.4.0 (2024-10-07)

### Bug Fixes

- `vueRE` conflicting with `lineNoRE` (#4247) (2ac64b8)
- hmr not updating page data in rewritten paths and file path is wrong in mdit for dynamic routes (c46e4b7), closes #4172
- remove font synthesis in webfont mode, google fonts now support italic axis in inter (1628918)
- **theme:** change the order of CSS rules of `VPFlyout` (#4225) (68150a6), closes #4224
- **theme:** respect custom tag prop in VPButton component (#4185) (9c5d348)

### Features

- add `data-title` attribute for code group label tag (#4152) (bc7271d)
- allow ignoring certain headers and their subtrees completely in outline (3e11b6a), closes #4171
- **client:** add `onAfterPageLoad` hook in router (#4126) (315c220)
- support adding extra attributes to snippet imports (useful for twoslash) (#4100) (e8f7dd1)
- **theme:** expose theme default VPLink & VPSocialLink(s) component (#4178) (615e33b)
- trigger `onContentUpdated` on frontmatter-only changes too (0db269a)

## 1.3.4 (2024-08-24)

### Bug Fixes

- check if `_importGlobMap` (vite internal) exists before using it (612d66f)

## 1.3.3 (2024-08-17)

### Miscellaneous

- bump deps (a20db24)

## 1.3.2 (2024-08-05)

### Bug Fixes

- multiple cache busting imports causing useData to fail (2b3e486), closes #3820, reverts #3398, reopens #3363
- **theme:** excerpt style in LocalSearchBox (#4050) (2bc0d39)

## 1.3.1 (2024-07-14)

### Bug Fixes

- don't reopen browser on restart when `vite.server.open` is specified (6263db1), closes #4040
- **theme/regression:** typo in component props resulting in nested titles not showing in navbar (01d0d45), closes #4042

# 1.3.0 (2024-07-07)

### Bug Fixes

- **build:** don't normalize links containing target or download property (e24899a), closes #3947
- **build:** respect frontmatter.lastUpdated for pageData.lastUpdated and sitemap generation (7fcf462), closes #3931
- **build:** sort pageToHashMap to ensure stable assets (e302328), closes #4016
- **client:** do nothing on anchor elements with empty href (6461f5d), closes #3950
- don't do git log on non-existent file (387acf7), closes #4008
- don't reopen browser on restart (d837e82), closes #4001
- properly handle svg anchor elements (b785bd6)
- **theme:** add styles for h4 too (b54d7b0)
- **theme:** deep watch sidebar groups and force render on match change (97f9469), closes #3613
- **theme:** dim color for all text like elements inside blockquotes (5d3ed87), closes #3929
- **theme:** force update title attribute on hydration (d348da7), closes #4004
- **theme:** show filled nav bar when nav screen is open (0fc70e2)

### Features

- allow using components in navigation bar (#4000) (fa87d81)
- **cli/init:** allow passing target dir as command argument (#3948) (99053ba)
- **markdown:** support including specific regions from markdown files (#3978) (143b1e9)
- support `force-auto` as an option for appearance (1e8bb48), closes #3946
- **theme:** export VPHomeContent (#3960) (8aa6ccb), closes #3954

## 1.2.3 (2024-06-04)

### Bug Fixes

- **theme,a11y:** handle overflow on long mathematical equation and make tables focusable (#3932) (closes #3914) (afc611d)
- **types:** wrong types generated for markdown-it > mdurl (48ca76c), closes #3935

## 1.2.2 (2024-05-21)

### Bug Fixes

- dont escape ampersand twice in title (7ea3572)

## 1.2.1 (2024-05-21)

### Bug Fixes

- **a11y:** make code blocks accessible with keyboard (#3902) (cb308b9)
- escape title properly in build (49b1233)
- **theme:** remove unnecessary navigation role on nav element (af4717d)

# 1.2.0 (2024-05-18)

### Bug Fixes

- **build:** show file info on error (f0debd2)
- **dev:** match dev and prod routing behavior (#3837) (b360ac8)
- **markdown:** entities and escapes not working properly (#3882) (d5dbd70)
- render 404 page completely on client to infer locale from browser path (#3858) (728cb15)
- **style:** prefer YaHei over DengXian (f0a37b4)
- **theme/regression:** custom font not applying in Chinese docs because of specificity (fa2f38a), closes #3864
- **theme:** external link icon not visible for target \_blank links (d08eeed), closes #3327
- **theme:** fix invalid vp-offset in ssr (9794877)

### Features

- **build/i18n:** support customizing copy code button's tooltip text (#3854) (ed6ada7)
- **build:** add localeIndex to md.env (#3862) (0cbb469)

## 1.1.4 (2024-04-27)

### Bug Fixes

- **dev:** multiple server instances being created when editing config too quickly (#3835) (729a890)
- **theme/a11y:** add unique name to footer prev / next navigation landmark (e60c101)
- **theme/a11y:** remove duplicate assistive text from outline nav (#3803) (733d986)
- **theme/i18n:** 404 page not showing localized text (#3833) (cc11b8e)
- **theme:** disable keypress effect on search button (ccc37bb)
- **theme:** don't use Chinese quotes on non-Chinese documents (#3834) (75115f4)
- **theme:** leaking event listener when going back/forward on Safari on iOS (#3658) (#3671) (1a72181)

## 1.1.3 (2024-04-18)

### Bug Fixes

- **build/regression:** markdown backslash escapes not working (d02d1e9), closes #3808

## 1.1.1 (2024-04-18)

### Bug Fixes

- **client:** don't reload page on hash change (#3777) (74b725a)
- let vue compiler handle entity decoding (f86ac56)
- hot updating config file suppresses error logs (#3592) (cd5adf3)

# 1.1.0 (2024-04-09)

### Bug Fixes

- **client:** hashchange should only be triggered for same page navigations (#3768) (2a9fc2a)
- **client:** emit correct `Event` instance in hashchange event
- **theme:** remove small layout shift on `On this page` button (#3767) (5f28e74)

### Features

- **client:** add `hash` property to `useData()`
- **theme:** update Inter to version 4 (#3693) (#3694) (ffafa31)

## 1.0.2 (2024-04-01)

### Bug Fixes

- **theme:** text containing html not showing properly in mobile nav menu (3c8b4c7)

## 1.0.1 (2024-03-22)

### Bug Fixes

- **build:** vendor vue-demi to avoid resolution issues with yarn berry (#3680) (5d3cb96)

# 1.0.0 (2024-03-21)

### Bug Fixes

- **build:** resolve pattern relative to srcDir instead of root in createContentLoader (#3638) (59183e9)
- **localSearch:** remove empty titles that may appear in search results (#3665) (f7aef3c)
- **theme:** fixed sidebar expand caret showing when no children are present (#3657) (e13f932)
- **theme:** ignore inner-page items in next/prev link (#3663) (b50a8a1)
- **theme:** local nav separator not visible on pages having no outline (1909041)

### Features

- **theme:** allow selectively disabling external link icon on navbar items (#3607) (5f6297c)

# 1.0.0-rc.45 (2024-03-06)

### Bug Fixes

- **router:** hashchange not emitted in certain cases (#3637) (f6bd99e...6c0125b)

### Features

- set `__VITEPRESS__` for easy detection by plugins and other tools (#3634) (f6bd99e)

# 1.0.0-rc.44 (2024-2-19)

### Reverts

- types for internal components (e703429)

# 1.0.0-rc.43 (2024-2-17)

### Bug Fixes

- handle process.env being undefined while process is not (b63e0a0), closes #3579
- make local search work in combination with vue-i18n (#3559) (6624bb7)
- **theme:** adjust mathjax svg styles (#3567) (2051100)

### Features

- **theme:** auto style markdown content in home page (#3561) (0903027)

### Performance Improvements

- **theme:** move svg icons to css (#3537) (636cca0)

### BREAKING CHANGES

- The default theme now styles the markdown content in the home page. If you have custom styles that rely on the markdown content not being styled, you may need to adjust your styles, or add `markdownStyles: false` to the frontmatter of your home page.

# 1.0.0-rc.42 (2024-2-6)

### Bug Fixes

- **md:** dont break on nesting blockquotes inside gfm alerts (8f8a6fe), closes #3512
- **theme:** correctly normalize paths ending with "index" (#3544) (c582a8d)

# 1.0.0-rc.41 (2024-2-1)

### Bug Fixes

- handle CRLF in snippet plugin (5811b62), closes #3499
- lazy evaluate known extensions to allow env set in config (04f794b)

### Features

- **home:** add target and rel attribute to home actions (#3528) (ab39fd8)
- rename shiki packages (#3506) (b8487d3)
- wrap site title in span (#3522) (6b1f951)
- **theme:** add hero slots that are inside container (#3524) (28870e6)

### BREAKING CHANGES

- vitepress now uses shiki instead of shikiji. If you’re on the latest version and using shikiji specific features, you just need to change imports. The shikijiSetup hook is renamed to shikiSetup.

# 1.0.0-rc.40 (2024-1-22)

### Bug Fixes

- **client:** handle head orphans added in initial load (#3474) (5e2d853)
- **theme:** avoid selecting summary on toggling details (77a318c)
- **theme:** hover color for code links inside custom containers (#3467) (d529ed4)
- **type:** fix missed `VPBadge` type in `theme.d.ts` (#3470) (fcf828c)

### Features

- support GitHub-flavored alerts (#3482) (ac87d19)
- support specifying custom extensions to escape routing (#3466) (c22f5d9)
- **theme:** add npm icon (#3483) (c882fa1)

# 1.0.0-rc.39 (2024-01-16)

### Bug Fixes

- **theme:** misaligned outline indicator (#3458) (0ce5ece)
- **theme:** enter key behavior conflict with IME in search box (#3454) (cd8ee6f)
- **theme:** use`--vp-c-tip-` CSS variable for badge/block colors with type`tip` (#3434) (78abf47)

### Features

- **theme:** export VPBadge (#3431) (18981c1)

# 1.0.0-rc.36 (2024-1-8)

### Bug Fixes

- avoid pushing to history when clicking on the current link (#3405) (d279e63)
- **theme/regression:** external link icon not working (c236570), closes #3424
- **theme/regression:** inter getting bundled even importing without-fonts entry (#3412) (b03fb83)

# 1.0.0-rc.35 (2024-1-3)

### Bug Fixes

- **client:** add computed dir and lang to html root (c2b4c66), closes #3353
- fill all empty code lines (563020b), closes #3305
- fix theme chunking logic causing out-of-order styles (#3403) (a6cd891)
- invalidate module cache for subsequent builds (#3398) (27f60e0)

### Features

- allow passing options to emoji plugin (09e48db), closes #3174
- **theme:** allow specifying rel and target in logoLink (6c89943), closes #3264 #3271

### Performance Improvements

- **localSearch:** add concurrency pooling, cleanup logic, improve performance (#3374) (ac5881e)

# 1.0.0-rc.34 (2023-12-30)

### Bug Fixes

- **build:** clear cache after build (9568fea), closes #3363
- **default-theme:** remove use of reactify for search i18n (8687b86)
- print errors when importing an invalid dynamic route (#3201) (6d89a08)
- remove double title from home pages (9f1f04e), closes #3375
- **theme/i18n:** support customizing dark mode switch titles (#3311) (50c9758)

### Features

- support custom image lazy loading (#3346) (55be3f1)
- support dir in frontmatter (#3353) (203446d)
- **theme/i18n:** allow customizing sponsor link's text (#3276) (9c20e3b)
- **theme:** allow using VPBadge classes in sidebar (#3391) (50a774e)
- **theme:** new design for local nav and global header (#3359) (d10bf42)

# 1.0.0-rc.33 (2023-12-26)

### Features

- allow explicitly mark code element as `.vp-copy-ignore` (#3360) (93122ee)
- **build:** enable VUE_PROD_HYDRATION_MISMATCH_DETAILS when DEBUG is truthy (f4d4280), closes #422

### Performance Improvements

- implement concurrent promise pooling for render task (#3366)

# 1.0.0-rc.32 (2023-12-16)

### Features

- allow ignoring node in header (#3331) (e4bf1e4)
- expose `shikijiSetup` hook (#3344) (d12e23d)
- update shikiji, support twoslash (#3339) (8800195)

# 1.0.0-rc.31 (2023-11-25)

### Bug Fixes

- **build:** make assets go through vite pipeline during dev too (#3258) (c3d7f22)
- **theme:** use VPLink for links in VPDocFooter (#3248) (479a320)

# 1.0.0-rc.30 (2023-11-23)

### Bug Fixes

- **client:** no onAfterRouteChanged called after popstate (#3227) (60fc8fd), closes #3226
- **theme:** remove double padding from sidebar (ef6d8d1), closes #3228

### Features

- migrate to shikiji (#3237) (75f18e4)

### BREAKING CHANGES

- VitePress now uses shikiji instead of shiki for syntax highlighting. If you're using features like adding extra languages or custom aliases, please refer shikiji docs for migration guide or comment on #3237 if you need help.

# 1.0.0-rc.29 (2023-11-19)

### Bug Fixes

- **client:** regression - router not working without .html present (d63cb86), closes #3225

# 1.0.0-rc.28 (2023-11-18)

### Bug Fixes

- **ally:** clear up confusion with the title of theme switch (#3215) (6761036)
- **build:** support nested assetsDir (02161d0)
- wrong recognition of non-html extension leads to route error (#3218) (c4abc95)

### Features

- **build:** html head meta generator (#3219) (672e494)
- **client:** allow disabling link auto-prefetching (#3220) (563dc89)

# 1.0.0-rc.27 (2023-11-17)

### Bug Fixes

- CSS missing after build (#3217) (da73b58), closes #3216

# 1.0.0-rc.26 (2023-11-16)

### Bug Fixes

- "VPNavScreenMenuGroup" component HTML not supported (#3148) (237ad85)
- **build:** remove frontmatter in md file inclusion (dbbffa2), closes #3195
- style links in footer (#3178) (a482611)

### Features

- switch to vite 5 and bump deps (#3200) (d2238ee)

### BREAKING CHANGES

- VitePress now runs on Vite 5. Please refer https://vitejs.dev/guide/migration for breaking changes and migration guide if you're relying on some Vite-specific things.

# 1.0.0-rc.25 (2023-11-05)

### Bug Fixes

- double-slash format url should be external link (#3165) (7dbeac6)
- missing export types in localSearch (#3157) (0761062)
- **theme:** table row background-color in custom containers (#3179) (beecec1)
- **theme:** theme switch is not hidden on force-dark (#3155) (2276c1d)

### Features

- export `mergeConfig()` (#3143) (a850786)

### Performance Improvements

- reduce duplicate rendering in localSearch (#3170) (878f437)

# 1.0.0-rc.24 (2023-10-24)

### Bug Fixes

- lock plugin-vue version (aa75fd6)
- **styles:** large blur radius is causing color issues with safari (a31e143)

### Features

- **template:** add types for theme config (#3122) (56b3ce5)

# 1.0.0-rc.23 (2023-10-22)

### Bug Fixes

- don't normalize non-html/non-http links (#3114) (da3d781)
- **mpa:** properly emit assets in mpa mode (#3115) (6cf1de5)
- **theme/search:** prevent reactivity loss with i18n (#3121) (50d61fa)

# 1.0.0-rc.22 (2023-10-15)

### Bug Fixes

- fixes a regression related with nanoid v5 (#3090)

# 1.0.0-rc.21 (2023-10-12)

### Bug Fixes

- **build:** handle .mjs/.mts files as data / path loaders (#3058) (7991180)
- **client:** only update head if needed (#3017) (f2fc3dc)
- **theme:** search's configuration about buttonAriaLabel doesn't work (#3070) (c08bd46)

### Features

- **md:** allow customizing container titles globally (#3044) (bdb0800)

# 1.0.0-rc.20 (2023-09-24)

### Bug Fixes

- **build:** consistent route.path across dev and ssr (#2997) (0d56855)
- **build:** don't show missing lang warnings with text specifiers in fences (aa40cec)
- handle references in container titles (7fbfe71), closes #3004
- **hmr:** handle hmr in imported code snippets (#3005) (e84f313)
- snippet hmr not working with rewrites (a275049)
- selectively pass env for container titles (1a9c32d), closes #3007
- **types:** add RegExp to markdown's allowed attributes (#3008) (bc96b2b)

# 1.0.0-rc.15 (2023-09-20)

### Bug Fixes

- **build:** allow using symlinks with code snippets (f186901), closes #1617
- **build:** handle importing code snippets not having an extension (#2978) (e99aaad)
- **build:** indentation being lost in code blocks (5bb6bb0), closes #2988
- **compat:** reset setRawMode on process exit (#2994) (70fe47c)

### Features

- allow passing fast glob options to `createContentLoader` (4f9a60b), closes #2985

# 1.0.0-rc.14 (2023-09-16)

### Bug Fixes

- **client:** router in invalid state after 404 (#2972) (28ef0ea)
- **client:** scripts loading out of order when added through head (#2970) (98679c9)
- customizing the starting line number even if globally set (#2941) (0cd87b1)
- make algolia search work with indices that don't return absolute urls (#2956) (2a34c6b), closes #336 #805
- **theme:** remove extra padding from top when navbar is hidden (#2575) (fd46dc9)

### Features

- mathjax support (#2977) (7271a95)
- **theme:** allow forcing dark mode (#2974) (1fb5d22)
- **theme:** allow forcing site locale in last updated format (#2973) (a18e5e4)

# 1.0.0-rc.13 (2023-09-13)

### Bug Fixes

- **theme:** allow wrapping feature icons (a1e1267), closes #2923
- **theme:** local search enter key with the search result (#2937) (00ef2f1)

### Features

- **theme:** add search insights boolean to algolia search (#2940) (32aa2a7)

### Reverts

- Revert "feat(theme): use inert to avoid traverse menus and content with keyboard" (#2953) (54891df), closes #2953 #2932

# 1.0.0-rc.12 (2023-09-10)

### Bug Fixes

- **theme:** prevent closing local search box on key enter (#2933) (e544b41)
- **theme:** use brand color on search highlight (dfc0fbf), closes #2902

### Features

- highlight nav by default when one of the items is matched (#2893) (b1fbece)
- process md includes before building local search index (#2906) (c6ff5c7)
- support for customizing the starting line number in a code block (#2917) (c0ce7f7)
- **theme:** allow setting target in home features (#2897) (cb49673)
- **theme:** use inert to avoid traverse menus and content with keyboard (#2932) (070fc0a)

# 1.0.0-rc.11 (2023-09-10)

### Bug Fixes

- **init:** missing mts extension on windows (195ebe9), closes #2886
- respect attrs on custom containers (8b76167)
- temp workaround for broken navigation from 404 to home (a18d544), closes #2891
- **theme:** dropdown menu partially hidden by the homepage footer when it is too long (#2904) (a60f079)
- **theme:** improve contrast of search highlight text (#2887) (20f9770)
- **theme:** link hover color inside a custom block (#2876) (39784ca)
- **theme:** prevent layout shift in search button key (#2889) (0088434)
- **theme:** search button key misplaced on safari (18adc07)
- **types:** NavItem can only have either link or items (#2880) (12ef12d)

### Features

- detect bun package manager (#2874) (83270fe)
- skip rendering if env.BUNDLE_ONLY is truthy (#2890) (d40eb19)

# 1.0.0-rc.10 (2023-08-28)

### Bug Fixes

- pseudo styles being removed with postcssIsolateStyles (21b4f8c), closes #2868 #2867
- resolve snippets from original file path - align with include behavior (8aa032f)

### Features

- allow overriding mdit-vue/component options (4f01f1a)

### Reverts

- "fix: createContentLoader generates invalid url when sets `base`" (#2865) (6be5a7e)

# 1.0.0-rc.9 (2023-08-28)

### Bug Fixes

- **a11y/theme:** disable transitions if user prefers reduced motion (fc5092f)
- **build:** respect preserveSymlinks (#2780) (1bda710)
- **cli/init:** print the correct packageManager (#2787) (b388b0a)
- **cli/init:** terminal message has not enough contrast (#2786) (4d9d977)
- restart server on theme creation/deletion (#2785) (e0be677)
- scroll-to-top in iOS when opens sidebar (#2803) (3dab9a6)
- stackblitz not working on firefox (877f643), closes #2817
- **theme:** docsearch variables not applying properly on ios beta (436e99a)
- **theme:** improve logo svg and add `art` dir (1f8c58a)
- **theme:** prevent sidebar re-render unless there is actual change (33962e0), closes #2796
- **theme:** revert 79 to 179 in yellow-soft (#2858) (74fcb60)
- **theme:** show only one carbon ad at a time (5ced0cc)
- **theme:** ssr issues on deno (e8edd0a)

### Features

- allow customizing markdown renderer used for local search indexing (#2770) (00dc1e6)
- export postcssIsolateStyles for vp-raw (3c736c1)
- **theme:** allow overriding code copied text from css (#2833) (e8ef1aa)
- **theme:** allow overriding last updated time in doc footer from frontmatter (#2848) (9a062a6)
- **theme:** allow providing custom `toggle-appearance` function (#2844) (a5f2eac)
- **theme:** allow setting rel and target on sidebar links (e477cdf), closes #2851
- **theme:** export VPButton and VPSponsors (#2767) (6960ec1)
- **theme:** export VPImage (#2814) (f242140)
- **theme:** improve color system (#2797) (e4f5c51), closes #2100

### BREAKING CHANGES

- `pathname://` protocol is dropped. Specify `target="_self"` or `target="_blank"` instead. Refer docs to learn more.
- Shiki's default theme is now changed to `github-light` and `github-dark`. If you want to use the old theme, you can set `markdown.theme` in your config to `'material-theme-palenight'`.
- Internal logic of `isDark` is changed to use vueuse. It might impact your custom theme. You can customize its behavior using `appearance` option.
- Default theme's color system is updated to make it more easily customizable. Refer the PR for new variables.

# 1.0.0-rc.4 (2023-08-08)

### Bug Fixes

- `createContentLoader` generates invalid url when `base` is set (#2714) (0f38eb4)
- **build:** make outDir from cli work properly (17378c0), closes #2716
- **build:** nested rewrites not working properly (0f421d7)
- **client:** handle empty hash in links (#2738) (c6c983e)
- fix sitemap path resolution (481a5e3), closes #2749
- **theme:** align max-width media queries (d31051a)
- **theme:** allow using h1 headings in outline (e3f8fc7), closes #1529
- **theme:** close dropdown menus after an item is clicked (#2380) (e54eea3)
- **theme:** don't reset scroll position on changing tab in code groups (039798a), closes #2732 #2362
- **theme:** dont show transparent navbar other than home (#2742) (1d6254b)
- **theme:** hide outline marker on scroll to top (81e7405)
- **theme:** outline marker flicks when navigating towards above (e8ebf1b), closes #2665 #2676
- **theme:** override docsearch button bg (063b0e5), closes #2735
- **theme:** respect feature icon dimensions set from frontmatter (93823a8), closes #1886
- **theme:** scroll code group tab into view on selection (1a6efba), closes #2355
- **theme:** update sidebar active link status on hash change (#2736) (3840eaa)
- **regression/theme:** fix sidebar collapsing (#2753) (9a4ee07)
- **cli:** generate mjs file on init if `"type": "module"` is not present (23d7511)
- **theme:** language menu undefined text (#2755) (c9d4655)

### Features

- **theme:** final re-brand (#2727) (c0d838b)
- allow html blocks inside code groups (#2719) (7f0c18e)
- **build:** add `markdown.preConfig` option (ce85726), closes #1382
- **build:** allow overriding vite config loading (#2750) (1bed154)
- **client:** allow customizing scrollOffset padding (20b509c), closes #2739
- **client:** allow overriding props on Content (1179484), closes #2712
- i18n with sitemap (#2708) (7778187)
- **search:** allow enabling detailed view by default (4af5975), closes #2690
- **theme:** allow adding custom layouts (f4a5c43), closes #2547
- **theme:** allow customizing default theme's 404 page (d7e2254), closes #2715
- **theme:** allow customizing prev/next text from config file (09a4fdc), closes #1373
- **theme:** allow overriding logo link (2a7422b), closes #1683
- **theme:** allow passing html in nav links (69251b7), closes #1652
- **theme:** allow setting base path in sidebar items (#2734) (52884d9)

### Reverts

- #2689 (#2722) (a56d608)

### BREAKING CHANGES

- Node v18+ is now required to run VitePress.
- VitePress now only provides ESM API. Refer #2703 for details.

# 1.0.0-beta.7 (2023-07-29)

### Bug Fixes

- **build:** `createContentLoader` generates invalid url when `srcDir` is set (#2578) (74d9ba2)
- **build:** duplicate description tags with transformHead (#2702) (68f25f5)
- **build:** use vue dev build when DEBUG is truthy (#2689) (b61f36d)
- **build:** remove index.html when using createContentLoader (#2693) (6fc88a5)
- **search:** add useFocusTrap and mark.js to optimizeDeps (#2682) (fb048a6)
- **theme:** incorrect header anchor icon position with multline headers (#2694) (77c1b4d)
- **theme:** code group tab divider not showing full-width (#2701) (b39b491)
- **theme:** fix feature component always generating anchor tags (51f28bf)
- **theme:** respect empty rel and target (#2705) (60dd0a4)

### Features

- sitemap generation (#2691) (5563695)
- **build:** custom excerpt for `createContentLoader` (#2698) (13f94a6)
- **theme:** rel for feature links (#2704) (5d18fd8)
- **theme:** support custom page class (#2696) (2ae90a2)

### BREAKING CHANGES

- **build:** `createContentLoader` will now resolve globs relative to `srcDir` instead of `root`

# 1.0.0-beta.6 (2023-07-22)

### Bug Fixes

- **build:** cannot handle file name containing single quote (#2615) (9949f00)
- **build:** remove `=""` from boolean attributes in head (#2620) (e02adfe), closes #1131 (comment) #2607
- **build:** resolve nested md inclusions properly (e8074e6), closes #2584 #2586
- **compat:** disable stdin-discarder (#2640) (08c4bac)
- **hmr:** allow disabling md cache during dev (#2581) (f60b32f)
- invalid css (b199885)
- **lastUpdated:** use author date instead of commit date (#2618) (47bf5bf)
- **theme:** code block style is broken inside custom block (#2664) (8ff431a)
- **theme:** don't show external link icon on social links (f3a4597)
- **theme:** fix doc footer's prev and next's size difference (#2600) (f52a262)
- **theme:** fix sidebar's caret alignment issue with long text (#2599) (01120a5)
- **theme:** fix theme without fonts emitting inter (#2588) (71eb11f)
- **theme:** invalid html -- article inside span (d0e7374)
- **theme:** re-export default (#2606) (9fdee9c)
- **theme:** respect `--vp-nav-height` in local nav calculations (#2663) (3912951)
- **theme:** support missing meta description tag (#2639) (cfa870f)
- **theme:** two outlines at 1280px (ceedb68), closes #2668
- **type:** `useSidebar()` type error (#2643) (a07f959)

### Features

- **build:** add `metaChunk` option to extract metadata to separate chunk (#2626) (700fad1)
- **build:** support custom `assetsDir` (#2497) (64d7c3b)
- **build:** support overriding meta viewport tag (#2642) (94e2966)
- **search:** allow excluding content from search results (#2602) (37d5b27), closes #2344
- **search:** support `minisearch` customization (#2576) (9fee554)
- **theme:** allow using html text in VPHero (#2635) (ec7643d)
- **theme:** make navbar logo's height customizable by css variable (#2644) (c2e79aa)
- **theme:** support footer frontmatter config (#2574) (e79a13e)

### Performance Improvements

- fix race conditions with cache (#2579) (32d65d4)

# 1.0.0-beta.5 (2023-07-03)

### Bug Fixes

- **types:** `Sidebar` was exported multiple times breaking the config (#2573) (a99dcf9)

# 1.0.0-beta.4 (2023-07-02)

### Bug Fixes

- **build:** add `@vue/devtools-api` to `optimizeDeps.include` (#2543) (b2a129f)
- **client:** bypass client router for links explicitly specifying target (#2563) (e95015f)
- **client:** don't throw on using special chars in element ids (#2560) (6b98113)
- **client:** scroll not working on clicking an anchor in search box (#2527) (c30e758)
- **theme:** unresponsive back button with empty input in search box (#2566) (fa3780f)

### Features

- **build:** support nested markdown includes (#2545) (0c4210b)
- **client:** add onBeforePageLoad hook for router (#2564) (665f3b0)
- support selecting line range when importing md file (#2502) (1ef33fe)
- **theme:** allow customizing last updated date time format options (#2332) (24abc7c)
- **theme:** allow hiding navbar on specific pages via frontmatter (#2565) (1e15001)
- **theme:** expose `useSidebar` (#2496) (c4909e4)
- **theme:** option to show icon for external links (#2501) (52cfbc3)

### BREAKING CHANGES

- **client:** specifying `target="_self"` for internal links will now perform full reload.

# 1.0.0-beta.3 (2023-06-20)

### Bug Fixes

- **build:** disable validation for rewrite compiling (69b2625)
- **theme:** prevent glitch when algolia chunk is loaded (#2519) (51661de)
- use extends in template custom theme (#2500) (7e39e02)

- revert!: sync defineConfig types with vite (#2529) (cd03db8), closes #2529

### Features

- **build:** allow using regex in rewrites (f831767)
- **client:** expose dataSymbol (a547530), closes #2489

### BREAKING CHANGES

- reverts the breaking changes in beta-2. `defineConfig` and `defineConfigWithTheme` no longer accept functions as argument.

# 1.0.0-beta.2 (2023-06-11)

### Bug Fixes

- **build:** create markdown env for localSearchPlugin (#2322) (c9a98ac)
- **build:** use rimraf to handle temp folder deletion in windows (#2483) (2f75769)
- **search:** detailed view not working when page contains script setup (80e734d), closes #2485
- **theme:** adjust z-index for active code group marker (#2413) (06c0fc5)
- **theme:** properly show divider between navs (#2481) (2bd55ec)
- **theme:** use brand color in skip link in dark theme (#2431) (62d1110)
- **theme:** use document !== undefined check for browser (#2417) (c869ea6)
- **types:** sync defineConfig types with vite (b3ded34)
- **types:** theme-without-fonts types for node (#2416) (8e87c14)

### Features

- **build:** support relative path for code snippet (#1894) (90478b3)
- **cli:** add shortcut for restarting server (#2403) (64b06db)
- **theme:** add custom label for social links (#2466) (c995b9f)
- **theme:** add semantic markup to local search dialog (#2325) (4ddb96f)
- **theme:** allow prev/next links to be disabled globally (#2317) (29a9647)

### Performance Improvements

- parallelize mpa chunks copy (#2389) (6d7d195)
- **search:** use dom apis instead of regex-based section parsing (#2486) (d62e6f6)
- **theme/search:** prevent repeated rendering of same page (#2398) (e7be720)

### BREAKING CHANGES

- **types:** `defineConfig` and `defineConfigWithTheme` can now accept functions that return the config object. This might break typings in some third-party plugins that rely on the type of these functions.

# 1.0.0-beta.1 (2023-05-22)

### Bug Fixes

- **config:** set scrollOffset to 0 is not effect (#2395) (8153f23)
- **theme:** make features section layout consistent (#2382) (26f21d9)
- **theme:** missing global properties in localSearch (#2396) (4896811)
- **theme:** support custom target and rel in navbar links for mobile (#2400) (f364a5d)

# 1.0.0-alpha.76 (2023-05-18)

### Bug Fixes

- **a11y:** mobile and theme switcher (#2354) (d6c0985)
- **build:** uniform handling of windows slash in localSearchPlugin (#2358) (b31933f)
- hmr when `base` is set (#2375) (484ff5d)
- **theme:** don't update opacity on hover (#2326) (35f8b89)

### Features

- **cli:** add shortcuts (#2353) (97065ce)
- **theme:** add focus trap to local search dialog (#2324) (2f482af)
- **theme:** open search box on pressing slash too (#2328) (c20bd28)

# 1.0.0-alpha.75 (2023-04-30)

### Bug Fixes

- **build:** reset regex lastIndex before testing (188893c)
- **cli/init:** remove trailing slash from npm scripts (64ecedc)
- **theme:** hide local nav on home page (f07587a), closes #2312
- **theme:** local search get 404 on build when use route rewrites in windows (#2301) (494c634)
- **theme:** vitepress data not properly injected in app when use localSearch (#2299) (69c7646)

### Features

- add `filePath` to `PageData` (#2140) (b24acc6)
- **build:** allow using `@` prefix with `@include` (#2292) (a3b38d1)
- preserve user log level (#2310) (a647cd3)
- **theme:** support light shiki themes (#2319) (d0f0012)

### BREAKING CHANGES

- **theme:** Styling for code blocks might break, especially if you were earlier overriding it for light theme. Those workarounds are no longer required. VitePress will now show code blocks and groups in light mode too if a light shiki theme is specified.

# 1.0.0-alpha.74 (2023-04-24)

### Bug Fixes

- **build:** allow data-loaders files in packages to be found (closes #2272) (84cf457)
- **router:** scroll back to the hash anchor even if it is already selected (#2265) (f3d3332)

### Features

- allow using html in member description (#2269) (f744364)
- **search:** support custom `disableQueryPersistence` in local search (#2273) (2f0f2d5)
- **theme:** mobile view show outline button after removing sidebar (#2274) (25b9111)

# 1.0.0-alpha.73 (2023-04-20)

### Bug Fixes

- **search:** fix highlighting in detailed view (1f4920c)
- **search:** local search showDetailedList not working in windows (#2253) (09be057)

### Features

- outline link add title attribute (#2261) (1f5798e)

# 1.0.0-alpha.72 (2023-04-17)

### Bug Fixes

- **search:** don't directly access userConfig (3e0e9d2)
- **search:** ready event is not fired on mac (e37e5cb)
- **theme:** local search showDetailedList not working in windows (#2248) (8354f8f)

# 1.0.0-alpha.71 (2023-04-16)

### Bug Fixes

- **search:** esm interop mark.js import (1b0a249)
- **search:** properly group nested headings (b1c956c), closes #2238

# 1.0.0-alpha.70 (2023-04-16)

### Bug Fixes

- **a11y:** increase touch target size of search icons (4449867)
- **search:** avoid body scroll when using local search (#2236) (144a7d8)
- **search:** better highlighting in detailed view (#2234) (be83524)
- **search:** fix keyword highlighting and scrolling in excerpts (ca8db8a)
- **search:** remove double base on importing excepts (185213c), closes #2230
- **search:** remove extra /index from routes (9e04b43)
- **search:** show escape to close on footer (6d5b4cd)

### Features

- **search:** allow force disabling detailed view (40f1d1b)
- **search:** make styling more configurable, align more with the theme (#2233) (b2077c7)

# 1.0.0-alpha.69 (2023-04-15)

### Bug Fixes

- **search:** fix errors on empty titles (6d363ec)
- **theme:** fix color of blockquote in custom containers (#2173) (712a57f)

# 1.0.0-alpha.68 (2023-04-15)

### Bug Fixes

- **theme:** fix top of scrollbar being unusable (#2224) (7178a22)

# 1.0.0-alpha.67 (2023-04-15)

### Bug Fixes

- **search:** avoid double base (25a1fe9)
- **theme:** navbar style (#2202) (8ee6b90)

### Features

- allow passing props and children/slots to defineClientComponent (#2198) (4c24960)

# 1.0.0-alpha.66 (2023-04-15)

### Bug Fixes

- **search:** properly resolve page link (609d447)
- **theme:** fix meta key not showing on search button (e295160)

### Features

- offline search (#2110) (6c92675)

# 1.0.0-alpha.65 (2023-04-04)

### Bug Fixes

- **build:** remove extra line at end of code blocks (#2191) (a681fd1)

# 1.0.0-alpha.64 (2023-03-29)

### Bug Fixes

- **build:** make `lastUpdated` work with git submodules (#2149) (4c23003)
- **theme:** fix color of table head row in custom containers (#2160) (51ecd58)
- **theme:** hide outline dropdown scrollbar when it does not overflow (#2151) (ff26ff1)

### Features

- **build:** provide `siteConfig` in `transformPageData` context (#2163) (3714741)
- **theme:** add `page-top/bottom` and `doc-top/bottom` slots (#2139) (53d0099)
- **theme:** allow moving aside to left (#2138) (9e3cf0f)

# 1.0.0-alpha.63 (2023-03-26)

### Bug Fixes

- **theme:** allow adding html as feature icons (e5bc1e1)
- **theme:** remove label background of code-group tabs (#2136) (eac03f2)

### Features

- more flexible `ignoreDeadLinks` (#2135) (3235c23)

# 1.0.0-alpha.62 (2023-03-25)

### Bug Fixes

- make md includes work with rewrites (#1898) (3553f01)
- **theme:** don't show outline when no header is there (#2117) (42a0ef2)
- **theme:** fix aside position when footer is there (#2115) (aecdeb9)
- **theme:** properly align not found icon in algolia (#2116) (83ce1b8)
- **theme:** use locale lang instead of navigator lang for last updated (#2118) (56a7d9a)

# 1.0.0-alpha.61 (2023-03-20)

### Bug Fixes

- **build:** skip warning for `txt` language (#2109) (ac953ce)
- decode when query selecting current hash (1f2f1ff), closes #2089
- **theme:** prevent code-groups conflict with shiki-twoslash (#2059) (ee6cda4)

# 1.0.0-alpha.60 (2023-03-15)

### Features

- support multiple selectors for scrollOffset (86e2a6f)
- **theme:** add animation to mobile page outline dropdown (a6b18a8)

# 1.0.0-alpha.59 (2023-03-15)

### Bug Fixes

- handle async enhanceApp when extending themes (52b04f3)
- **theme:** improve Chinese font handling (81ae1c7), closes #2036
- **theme:** move doc-footer-before slot into the footer (b0160bc), closes #2082

### Features

- defineClientComponent helper (2ad668c)

# 1.0.0-alpha.58 (2023-03-14)

### Bug Fixes

- fix optional component imports from default theme (7b0f289)

# 1.0.0-alpha.57 (2023-03-14)

### Bug Fixes

- **types:** allow void return in transformHead hook (32dfaf5)

### Features

- expose page and assets on build hooks TransformContext (468c049)
- **theme:** a11y improvements (3b6a6d1)
- **theme:** aria-label for social links (6ca34c4)
- **theme:** page outline for mobile (7182c42)
- **theme:** support extending default theme without importing fonts (da1691d)
- **theme:** use more accessible header anchors #2040

### Performance Improvements

- **theme:** preload font (24735db)

### BREAKING CHANGES

- `markdown.headers` is now disabled by default. This means `PageData` will no longer include extracted headers by default unless this option is explicitly enabled. This is because the default theme now extracts page headers at runtime, so the data is no longer needed by default.

# 1.0.0-alpha.56 (2023-03-13)

### Bug Fixes

- do not include head tags in inlined site data (2f26693)

# 1.0.0-alpha.55 (2023-03-13)

### Bug Fixes

- fix scroll to hash on new tab during dev (9aafc88), closes #653
- gracefully handle config update with syntax error (470ce3d), closes #2041

### Performance Improvements

- inline site data on page (22ace7b)
- kickoff main chunk fetch earlier in browsers without modulepreload support (d64a76e)

# 1.0.0-alpha.54 (2023-03-13)

### Bug Fixes

- fix chunking logic that causes breakage (bed202d), closes #2072 #2073 #2074 #2075

# 1.0.0-alpha.53 (2023-03-13)

### Bug Fixes

- avoid circular dependency between siteData virtual module and useData() (905f58b), closes #2072 #2073 #2074

### Features

- createContentLoader (d2838e3)
- **theme:** editLink can accept function (#2058) (192708d)

# 1.0.0-alpha.52 (2023-03-11)

### Bug Fixes

- fix line higlighting for empty lines (9708510)
- fix rewrites with non ascii chars (6ce88da), closes #2017
- fix same page hash links with encoded chars (e05a3f2), closes #1749
- properly serialize header in outline (8ab36d0)
- remove @vue/devtools from force include (9bd940f)
- respect user vue alias (63f33d2), closes #1065
- **theme:** re-support dynamic headers (657a7d3)
- trim spaces from outline headers (9ceff1d)

### Features

- allow disabling markdown.headers (868a9ff)

### Performance Improvements

- improve default theme chunking (f6cb4c0)

### BREAKING CHANGES

- default theme config option `outlineBadge` has been
  removed. Badges in headers are now always excluded when generating
  outline text.

# 1.0.0-alpha.51 (2023-03-09)

### Bug Fixes

- **theme:** align number to code line (#2044) (27e3adf)
- **theme:** remove log in VPContent (747a04d)

### Features

- **theme:** add not-found layout slot (#2054) (41987b6)

### Performance Improvements

- **a11y:** add aria-label to language button (#2025) (322c633)

# 1.0.0-alpha.50 (2023-03-07)

### Bug Fixes

- avoid deprecation warning when using --force (0c0b6cc)
- ensure HMR works properly for page outline (1457681), closes #1281
- extract all headers by default (580a8e1)
- respect command line minify and outDir options (22047f3)
- **theme:** make tip box text color darker (3158115)
- **theme:** prevent text wrapping in nav dropdown menu (2a1abbe)

### Features

- **data-loader:** defineLoader() type helper (4673bb1)
- **data-loader:** pass watched files into load() (e29b6a0)
- deprecate Theme.setup (868a586)
- export loadEnv from vite (7609704)
- expose isNotFound on PageData, deperecate Theme.NotFound (74caccd)
- expose params at top level in useData() (66f94fd)
- support $params in page components (a4ac055)
- support Theme.extends (f39b6a9)
- **theme:** add `as` prop to `Content` (#2011) (254e15b)
- **theme:** add `home-hero-info` slot (#1807) (996a5f4)
- vitepress init command (#2020) (38bbdad), closes #1252

# 1.0.0-alpha.49 (2023-02-28)

### Bug Fixes

- disable fuzzy link recognition by default (2450710)
- dyamic routes w/ srcDir + relative imports (b075ee5)
- hmr on deps change of data loaders (5913ebc)
- normalize all paths in config (8e8fcd9)
- **theme:** "copy code" button not readable on hover state (#819) (#1892) (#1998) (c2de4ca)
- **theme:** tip custom container has wrong bg color for `<code>` block (d9a2e6e)
- update route configs on file add / delete (bccce98)

### Features

- dynamic routes (24fa862)
- **theme:** enhance readability of custom containers (#1824) (#1989) (472b6ec)

# 1.0.0-alpha.48 (2023-02-26)

### Bug Fixes

- **compat:** remove use of array.at (fd99590)
- **theme:** add height constraints to hero image (#1983) (803d5b6)
- **theme:** allow empty details in home feature (#1936) (#1963) (b56351c)
- **theme:** show external link icon in navbar (#1881) (8e6e8d9), closes #1948
- **theme:** show external link icon on same line (#1880) (6218b10)

### Features

- **build:** add support for custom languages (#1837) (5a6d384)
- **theme:** make prev/next links changeable (#1972) (b8a5e8e)
- **theme:** support custom target and rel in navbar links (#1993) (e2d4edf)

# 1.0.0-alpha.47 (2023-02-20)

### Bug Fixes

- **build:** show error stack in logs (#1960) (c4d8d72)
- custom titles of code snippets inside code groups (#1834) (bcb8cbf)
- **types:** augment vite user config (#1946) (5c9b75e)

### Reverts

- "docs: add linkage for `code-groups` in `getting-started`" (#1943) (ed90724), closes #1906

# 1.0.0-alpha.46 (2023-02-12)

### Bug Fixes

- **build:** prepend base to all internal non-relative links (#1908) (dcf2941)
- **theme-default:** avoid preconnect without algolia (#1902) (616fe5b)
- **theme-default:** remove duplicate judgments in `preconnect()` (#1903) (48c9b11)
- **theme:** make features support line wrapping (#1913) (ea43076)

### Features

- **build:** use vite logger (#1899) (a00bb62)
- **shiki:** support `ansi` code highlight (#1878) (f974381)
- **theme:** support disabling aside globally (#1925) (dd0c4c6)

### BREAKING CHANGES

- **build:** `base` is now prepended to all internal (non-relative) links, including any reference to a file present in the public directory. If you want the earlier behavior for such links, use absolute links.

# 1.0.0-alpha.45 (2023-01-31)

### Bug Fixes

- safari use `window.requestIdleCallback` (#1871) (507b193)

# 1.0.0-alpha.44 (2023-01-31)

### Bug Fixes

- take `<a>` in SVG into account (#1850) (010b3e5)
- **theme:** infer collapsible from collapsed (#1865) (dea6cfa)

### Features

- **theme:** preconnect algolia when idle (#1851) (1f77577)

### BREAKING CHANGES

- **theme:** `collapsible` is dropped from sidebar, use `collapsed` instead

# 1.0.0-alpha.43 (2023-01-29)

### Bug Fixes

- **build:** hmr with rewrites when base is set (a05956f)

# 1.0.0-alpha.42 (2023-01-29)

### Bug Fixes

- **build:** consider base when checking actual pathname (#1858) (cf8ad1a)

# 1.0.0-alpha.41 (2023-01-28)

### Bug Fixes

- check document instead of window to detect browser (#1833) (0f145cb)
- **router:** avoid duplicate history entries (#1827) (1553dbc)
- **theme:** don't show border on navbar when sidebar is there (#1845) (3db532e)

### Features

- **build:** allow ignoring only localhost dead links (#1821) (fe52fa3)
- **build:** expose vitepress site config to vite plugins (#1822) (05430e4)
- **build:** support rewrites (#1798) (00abac6)
- stable `cleanUrls` (#1852) (5ae4fbd)
- **theme:** allow removing badge text from outline (#1825) (5d2fc3f)
- **theme:** enable multi level sidebar nesting (#1360) (#1835) (c35a1f0), closes #1361 #1680

# 1.0.0-alpha.40 (2023-01-20)

### Bug Fixes

- **theme:** nav bg not being applied on some viewport (39294e0)

# 1.0.0-alpha.39 (2023-01-20)

### Bug Fixes

- **theme:** adjust the position of the curtain to avoid block sidebar (#1816) (48f0b01)
- **theme:** sidebar scrollbar is cropped by nav bar (bd36224)

# 1.0.0-alpha.38 (2023-01-17)

### Bug Fixes

- **theme:** spacing between aside sponsors and ads section is missing (5c2eb1b)

# 1.0.0-alpha.37 (2023-01-17)

### Bug Fixes

- **build:** don't warn on blank lang in fences (99ad162)
- **theme:** prevent vertical scrollbar on code group tabs (#1793) (#1805) (4314b57)

### Features

- add i18n feature (#1339) (8de2f44), closes #291 #628 #631 #902 #955 #1253 #1381
- support for teleports to body (#1642) (09c2c52)
- **build:** don't hard fail on unknown languages in fences (#1750) (1ae0596)
- **theme:** refine overall styles (#1049) (#1790) (471f00a)

# 1.0.0-alpha.36 (2023-01-11)

### Bug Fixes

- **build:** handle cleanUrls without trailing slash (#1772) (2a80fbd)
- **theme:** `activeMatch` support regexp (#1754) (0913e0f), closes #1771
- **theme:** add cursor for summary of custom block details (#1774) (167a474)
- **theme:** wrap long words in `li` (#1782) (48a42c1), closes #1783 #1405

### Features

- allow `enhanceApp` to return a `Promise` (#1760) (01ac579)
- **build:** support interpolation inside code blocks (#1759) (3b7ff8d)

# 1.0.0-alpha.35 (2023-01-03)

### Bug Fixes

- **theme:** adjust styles for copied button (#1751) (565ae71)
- **theme:** adjust styles for diff indicator in code blocks (#1755) (a642ea2)
- **theme:** prevent layout shift on carbon ads (f6c5e1f)
- **theme:** refresh ads per page navigation (#1734) (8db20fe)

# 1.0.0-alpha.34 (2023-01-01)

### Bug Fixes

- **build:** dedent of a single-line region (#1687) (7de7fff)
- **build:** handle `-` in title of code blocks with line highlighting (#1743) (ce9467e)
- handle cleanUrls with subfolders when using a trailing slash (#1575) (195d867)

### Features

- **build:** allow specifying default language for syntax highlighter (#1296) (f40df31)
- **build:** fence-level config for line-numbers (#1733) (c048076)
- **theme:** add `home-hero-image` slot (#1528) (e72998b)
- **theme:** add mastodon icon (#1736) (7a73784)
- **theme:** allow adding images as icons in features section (#1738) (9df598f)

### Performance Improvements

- **a11y:** make menu traversable only when it is open (#1491) (257f9e6)
- preload css to improve loading speed (bf1315a)

# 1.0.0-alpha.33 (2022-12-21)

### Bug Fixes

- **theme:** remove experimental fonts (#1710) (1ebde66)

### Features

- **build:** provide a `pathname://` protocol to escape SPA (#1719) (ae21a3a)
- **theme:** headings anchor should not be selectable (#1701) (505a4f8)

# 1.0.0-alpha.32 (2022-12-16)

### Bug Fixes

- **build:** fix code groups for line numbers mode (#1700) (135b797)

### Features

- add code-group feature (#728) (#1560) (a684b67), closes #1242
- **build:** support `cacheDir` (#1355) (f899764)

# 1.0.0-alpha.31 (2022-12-10)

### Features

- **build:** switch to rollup 3 and vite 4 (#1591) (ae33896)

### Performance Improvements

- **a11y:** add aria-hidden to line numbers wrapper (#1675) (4c5a892)

# 1.0.0-alpha.30 (2022-12-05)

### Bug Fixes

- **build:** allow importing files having numbers in extension (#1618) (0565c38)
- **build:** allow serving files in dev from workspace root (#1647) (dc59662)
- **theme:** default to vertical align top on badges inside headings (#1584) (8a488de)
- **theme:** ignore removed diff lines while copying code (f4d5417)
- **theme:** move background colors to theme-default style (#1347) (4f0194f)

### Features

- **build:** add preview as an alias for serve in cli (#1651) (4ba33da)

# 1.0.0-alpha.29 (2022-11-15)

### Bug Fixes

- **build:** explicitly specify asset and entry file names (#1607) (8601e15)
- **theme:** typo in attribute name (#1597) (cc91d55)

# 1.0.0-alpha.28 (2022-11-08)

### Bug Fixes

- **theme:** use faux italics only with web fonts (#1581) (124158e)

### Features

- **theme:** sidebar nav slots (#1582) (d410d4d)
- **theme:** use v-html in VPDocFooter (#1580) (9d10b1d)

# 1.0.0-alpha.27 (2022-11-03)

### Bug Fixes

- **build:** use addClass from shiki-processor (#1557) (4b0b1ef), closes #1555
- **build:** use default slugify from mdit-vue (#1554) (8cd1f7c)
- prevent overlay getting hidden behind navbar (#1547) (87d6c08)
- remove shell code copy trailing newline (#1561) (f36cd0d)
- **theme:** use stored preference to be the value of `userPreference` (#1543) (a7abf73)

### Features

- **theme:** add built-in global component `Badge` (#1239) (ac8619f)
- **theme:** add link feature in homepage features (#984) (#1404) (84b4abc), closes #1070
- **theme:** sort multiple sidebars (#1552) (db1c343)

### Reverts

- **#1530:** explicitly exit process after build to prevent hangup (#1572) (01719fa), closes #1530

# 1.0.0-alpha.26 (2022-10-27)

### Bug Fixes

- properly apply dark/light classes in code blocks (#1546) (178895f)

# 1.0.0-alpha.25 (2022-10-25)

### Bug Fixes

- **banner:** prevent hidden local nav on scroll (63449ca)

# 1.0.0-alpha.24 (2022-10-25)

### Bug Fixes

- **banner:** broken layout on smaller viewports (#1536) (028cc2c)

# 1.0.0-alpha.23 (2022-10-25)

### Bug Fixes

- **build:** explicitly exit process after build to prevent hangup (#1530) (09fcc46)

### Features

- **build:** add `useWebFonts` option (#1531) (c9f04e0)
- support focus, colored diffs, error highlights in code blocks (#1534) (04ab0eb)
- **theme:** add --vp-layout-top-height to adjust banner (#1521) (a29a4a6)

# 1.0.0-alpha.22 (2022-10-22)

### Bug Fixes

- **types:** change ComponentOptions to DefineComponent (#1499) (5711660)

### Features

- expose isDark (#1525) (d327811)
- **theme:** allow defining dark as the default theme (#1498) (d404753)
- **theme:** support html strings for SidebarGroup headings, SidebarItem text (#1489) (946c579)
- transformPageData hook (#1492) (afeb06f)

# 1.0.0-alpha.21 (2022-10-14)

### Bug Fixes

- **build:** better align server and client side filename sanitization (3fd20fe)
- **theme:** match switch background transition with page transition (#1479) (962065a)
- **theme:** prevent body scrolling when sidebar has opened on small screens (#1391) (3daabdc)

### Features

- **theme:** allow specifying common alt for logo (#1451) (55688a8)

# 1.0.0-alpha.20 (2022-10-12)

### Bug Fixes

- **a11y:** add title to copy code button (#1437) (f79bb78)
- **router:** don't intercept download links (#1452) (54cf6ce)
- **theme:** disable transitions on theme toggle (#1447) (067e1a9)
- **theme:** make text prop of VPHero optional (#1445) (95e4f2a)

### Reverts

- "fix(build): remove leading underscore from chunks" (#1471) (18f0fb4)

# 1.0.0-alpha.19 (2022-10-02)

### Bug Fixes

- **build:** ignore tsconfig target in dev (#1428) (a13bc86)

# 1.0.0-alpha.18 (2022-10-01)

### Bug Fixes

- **theme:** break long words on overflow (#1405) (2114d13)

# 1.0.0-alpha.17 (2022-09-27)

### Bug Fixes

- **theme:** add cursor for collapsible sidebar title (#1397) (ed37b9a)
- **theme:** remove extra space before docsearch key (#1396) (6cb79bb)

### Reverts

- #1064 (9d70ca5)

# 1.0.0-alpha.16 (2022-09-24)

### Bug Fixes

- **build:** line numbers mode when language specifier has symbol (#1353) (9c04a10)
- **build:** remove leading underscore from chunks (#1394) (66cd164)
- **compat:** use default export of dns module (#1388) (fa6fa56)
- **theme:** always add alt attribute to images (#1348) (a621c69)

### Features

- **build:** allow using `transformIndexHtml` (#1380) (ce8d139)

# 1.0.0-alpha.15 (2022-09-15)

### Bug Fixes

- **build:** properly resolve node_modules (#1337) (0672a69)
- **theme:** hide extra navbar when no content (#1338) (4482c50)
- **theme:** remove trailing `#` from outline (#1344) (f1cf1e8)

# 1.0.0-alpha.14 (2022-09-14)

### Bug Fixes

- prevent jumping on clicking docsearch action buttons (#1140) (86413e6)
- **theme:** break long words (#1064) (9c739fd)
- **theme:** don't nest sidebar links (#1279) (f840dbc)
- **theme:** keep display copied hint when click multiple times (#1262) (bb11d0f)
- **theme:** show progress bar after delay (#1278) (496bd34)
- **theme:** use pointer cursor only on enabled buttons (#1300) (d7eac98)
- **theme:** use pointer-events auto instead of all (#1290) (6fac5b2)
- **types:** allow non async `transformHtml` and `buildEnd` (#1270) (ee37eaa)

### Features

- add `transformHead` hook (#1323) (6b16dad)
- add `vp-raw` container (#1104) (9a6e1ea)
- bundle type definitions of dev-deps (#1257) (12591a9)
- **theme:** add page load progress bar (#1264) (ecf5515)
- **theme:** allow disabling whole layout (#1268) (8f63033)
- **theme:** support dynamic headers and nesting in outline (#1281) (288aa48)

### Performance Improvements

- **a11y:** add aria-checked attribute to switch (#644) (eb9026d)
- render pages asynchronously (#1320) (8e4ff4d)

### Reverts

- **#1264:** add page load progress bar (#1311) (5378a49), closes #1264

# 1.0.0-alpha.13 (2022-08-30)

### Features

- use global delegation for copy code interaction (b5bd73f)

# 1.0.0-alpha.12 (2022-08-26)

# 1.0.0-alpha.11 (2022-08-26)

### Features

- support markdown sfc options (#1238) (d700a66)

# 1.0.0-alpha.10 (2022-08-22)

### Bug Fixes

- avoid circular deps when extending default theme + importing feature components (5fb7948), closes #1210

### Features

- **build:** support markdown frontmatter options (#1218) (bfb0220)

# 1.0.0-alpha.9 (2022-08-20)

### Bug Fixes

- **theme:** fix typo in carbon ads components (#1192) (e0932ce)
- **theme:** show footer message/copyright only if present (#1191) (da2f8d2)
- **theme:** show outline even without sidebar (#1189) (3714ea3)
- **types:** explicitly re-export to resolve ambiguities (#1193) (eacc18c)
- use junctions in Windows (#1217) (0e14211)

### Features

- **theme:** extend titleTemplate by replacing the title (#1200) (c7def73)

# 1.0.0-alpha.8 (2022-08-17)

### Bug Fixes

- fix client build entry (04c4d0f)

# 1.0.0-alpha.7 (2022-08-17)

### Bug Fixes

- fix static data file support in vite 3 (19ec22c)

# 1.0.0-alpha.6 (2022-08-17)

### Breaking Changes

- `/@theme` import alias has been removed. Use `@theme` instead.

### Bug Fixes

- **theme:** remove extra padding in code blocks with line numbers (f6d6c62)
- **theme:** restore styles for code blocks (#1170) (2c89afb)
- **theme:** set pointer events all on VPNavScreen (#1182) (b36656a)

### Features

- **build:** switch to vite 3, support clean urls and esm mode (#856) (0048e2b)

# 1.0.0-alpha.5 (2022-08-16)

### Bug Fixes

- **build:** cache key should consider file path (#948) (1daeaa1)
- **build:** handle vite constants replacement (#419) (#888) (9d9db62)
- **build:** recreate server on config change (#1132) (93fe820)
- **build:** show workaround on encountering dead links (#822) (#868) (29d44e7)
- **build:** strip custom anchor with capital letters in outline (#1005) (f6d5697)
- **build:** update language regex for line number class (#1108) (708c361)
- can't detect that the page has scrolled to the bottom (#956) (#970) (98e45af)
- de-duplicate head tags while merging (#975) (#976) (f7e9cfe)
- decode href before using as query selector (#951) (22006e8)
- decode image src so that rollup can process it (#933) (bb41a9f)
- don't add base to external urls while preloading (#1045) (7295033)
- don't change url hash while scrolling (#991) (0826944)
- layout inconsistencies and remove sidebar from 404 page (#964) (0257ea8)
- line highlighting in custom code block (#959) (#969) (7a9e4d9)
- normalize link in VPButton (#919) (bed68f1)
- only check for duplicate meta tags (#977) (1ef7a18), closes /github.com/vuejs/vitepress/issues/975#issuecomment-1183507200
- regression caused by #887 (30249dc)
- remove duplicate router logic (#1087) (63584c2)
- remove explicit noopener from external links (#871) (e4c60ab)
- support urls with query during dev (35b7361)
- **theme:** change sponsor link class name to bypass adblock (#866) (#867) (e33955e)
- **theme:** close menu on route change (#887) (fcd7642)
- **theme:** don't let navbar obstruct clicks to top part of scrollbar (#1168) (44953dc)
- **theme:** fix custom NotFound component rendering (#1163) (4a6eda4)
- **theme:** hide doc footer if empty (#1126) (70da5f2)
- **theme:** make last updated time reactive (#879) (25a835f)
- **theme:** navbar menu may exceed the screen (#988) (#989) (8a46413)
- **theme:** prevent docsearch button key from changing (#986) (d65667b)
- **theme:** tweak styles of nav title (#962) (#968) (d91f3b1)
- **theme:** typo in color name (#1020) (4b38736)
- treat all URI schemes as external (#945) (#946) (1e9a7ac)
- **types:** add client and theme to `exports` field (#914) (1cc087d)
- **types:** fix broken syntax in `theme.d.ts` (#1101) (70b3060)
- use `router.go` if search string is not same (#1109) (5597165)

### Features

- allow adding custom social icons as inline svg (#738) (#953) (74e4950)
- allow html in footer (#1034) (ad9af83)
- allow using custom syntax highlighting themes (#992) (d5ed66c)
- **build:** allow ignoring dead links (#586) (#793) (19b0758)
- **build:** allow using custom highlighter (#754) (#857) (ddf876d)
- **build:** handle change of config file dependencies (#1009) (8e6665b)
- **build:** improve code blocks and snippets (#875) (f789932), closes #861 #471 #884
- **build:** support code highlight in uppercase (#1082) (867f305), closes #772
- provide `transformHtml` hook (#1022) (2b4b800)
- provide build end hook (#709) (e0b730a)
- **theme:** add `doc-footer-before` slot (#1050) (#1052) (60c515c)
- **theme:** add navigation slots (#739) (#741) (0f0453c)
- **theme:** add option to customize search button text (#713) (#747) (00fe809)
- **theme:** auto open collapsed sidebar on entering (#1094) (f4f1a6c)
- **theme:** custom prev/next labels and text (#897) (836a246)
- **theme:** support hiding aside component from frontmatter (#980) (69ef299)
- **theme:** support multi-level sidebar (#851) (d1a2c76)

### Performance Improvements

- **a11y:** change copy code span to button (#1056) (fb9cee9)

### Reverts

- vuejs/vitepress#889 (#896) (e1339fd)

## 1.0.0-alpha.4 (2022-06-22)

### Bug Fixes

- **theme:** home image style is broken in big view port (2bd960d)

## 1.0.0-alpha.3 (2022-06-22)

### Bug Fixes

- **theme:** italic fonts are missing (#759) (#777) (fa00c83)
- **theme:** copy code in non-secure contexts (#792) (2935ed2)
- **theme:** copy code button has wrong tag closing syntax (#816) (75ca9e4)
- **theme:** edit link gets hidden when a page don't have siblings (#751) (9bc4330)
- **theme:** nav close icon not working correctly (#744) (75c9d80)
- **theme:** sidebar is shown on home layout (#825) (#829) (42cbd31)
- **theme:** sidebar collapsed option not working on layout change (#809) (#811) (7737699)
- **theme:** `DefaultTheme` type causes error in some cases (#804) (107724a)

### Features

- **build:** allow setting `base` from command line (2952638)
- **theme:** add active status to nav menu group (#820) (fdb5720)
- **theme:** add global layout slots (#760) (#812) (1f1e298)
- **theme:** support themeable images for logo and hero (#745) (42813ce)
- **theme:** add team page feature (#828) (7cfe0f0)

## 1.0.0-alpha.2 (2022-06-14)

### Bug Fixes

- use h1 for title in hero instead of p (#776) (919d230)
- add background color in navbar to avoid contrast issues (#695) (305bcc0)
- add default value for base in `createMarkdownRenderer` (#555) (#556) (78a2e84)
- allow lang='ts' on scripts in markdown (#693) (#701) (59df105)
- better nav item types (#714) (263607b)
- double base in sidebar links (#756) (aa65cb5)
- use `pre-wrap` for text and tagline (#746) (94704c9)
- nav nested items type error (#710) (#711) (e5bf15a)
- page layout breaks when page name matches the css class name (#696) (#699) (9c0ed93)
- remove title bg transition to avoid flush on sidebar on/off (1942418)
- sidebar right blur notch (#712) (64c3654)
- typo (#708) (#716) (1fe5153)
- title in containers not working with markdown content (#765) (#768) (c5c3c64)
- use base in links (#717) (#718) (8e50154)
- use h2 for feature headers (#774) (b1ff725)

### Features

- add `lastUpdated` option to frontmatter (b31fbf3)
- add doc before and after slot (#762) (#786) (9c2a36f)
- allow custom edit links (#698) (535e176), closes #694 #697
- allow custom outline title (#689) (#690) (a8a1623)
- allow external links in sidebar (#205) (#686) (ce17f50)
- support custom content in home layout (#702) (92659a2)
- emit 404.html on build (#729) (#740) (23276ba)
- setup devtools and remove debug component (#721) (421f641)

## 1.0.0-alpha.1 (2022-06-01)

Complete rewrite on default theme, with bunch of features added. Please refer to the docs for the new feature and changes.

## 0.22.4 (2022-05-06)

### Bug Fixes

- **plugin:** set content-type header for serving index.html (#616) (1656f03)
- remove 404 from title on initial route (#590) (216e129), closes #589

## 0.22.3 (2022-02-22)

### Bug Fixes

- append base to links (#502) (804954c), closes #252
- avoid minimizing non-javascript inline scripts (#517) (779b789), closes #538 #540
- **client router:** tolerant invalid hash selector typo (#506) (ffe0c40)
- don't add .html to urls of non-html files (#515) (34d1542), closes #265
- normalize relative img src (#514) (9270477), closes #450
- require at least node v14 (#546) (7cf7011)
- reset page data on 404 (#497) (28eaa3b)

## 0.22.2 (2022-02-14)

### Features

- improve default chunk strategy + page hash stability (1ef69e2)

## 0.22.1 (2022-02-14)

### Features

- automatically update hash map + retry on failed page fetch (2324948)
- use git-based lastUpdated data (d32d8d4)

  Note: lastUpdated data is now disabled by default due to the performance overhead of retrieving the git information. This also means each page's metadata object no longer contains the `lastUpdated` property by default - it will only be present if the new `lastUpdated: true` config option is enabled.

# 0.22.0 (2022-02-11)

- Upgrade to Vite 2.8

## 0.21.6 (2022-01-19)

### Perf

- Avoid wrapping siteData as readonly proxy in production builds

## 0.21.5 (2022-01-16)

### Bug Fixes

- allow overriding title if home is true (#493) (88d57a9)
- **types:** fix vitepress/theme type (eabf6d2), closes #489 #438 #494 #442

### Features

- scrollOffset option (b66785d)

## 0.21.4 (2022-01-07)

### Bug Fixes

- set \_\_data in md.render (dfbc932)

## 0.21.3 (2022-01-06)

### Bug Fixes

- prioritize vue installed in user project root (9b3243b)

## 0.21.2 (2022-01-06)

## 0.21.1 (2022-01-06)

### Performance Improvements

- do not include head config in client bundle for production (6f3a96f)

# 0.21.0 (2022-01-06)

### Bug Fixes

- Chinese file link build failed (#425) (ae029ae), closes #424
- initial render of 404 pages (#418) (a3bf52f)
- remove `.` for mjs in `supportedConfigExtensions` (#447) (fb6a4ad)
- **serve:** respect base config in serve mode (#470) (08a0b12), closes #416
- set tempDir outside package root (#439) (bd35451), closes #435
- use algolia search lang (#459) (444562c)

### Features

- add details custom container (#455) (a8f147f)
- catch localhost links as dead links (7387649)
- expose `__path` and `__relativePath` on md instance for md plugins (4cec660)
- improve typescript support for config file, add `defineConfigWithTheme` (#465) (ba41bb9)
- properly remove `{#custom-anchor}` syntax in headers (6120da2)
- user configurable `outDir` (#448) (5b04bb9)

## 0.20.10 (2021-12-25)

### Features

- minify head inline scripts (e61db62)

## 0.20.9 (2021-12-15)

### Features

- shouldPreload hook (e721d60)
- support array of patterns in data loaders (f5308d7)

## 0.20.8 (2021-12-14)

## 0.20.7 (2021-12-14)

### Features

- **types:** re-export vite client type (4caa7b2)

## 0.20.6 (2021-12-14)

### Features

- support static data loaders (26fe81c)

## 0.20.5 (2021-12-12)

- Bump vue & vite versions

## 0.20.4 (2021-12-07)

### Bug Fixes

- **build:** fix typing files (ae11dc0)

## 0.20.3 (2021-12-07)

### Features

- expose createMarkdownRenderer (d54c7d8)

## 0.20.2 (2021-12-06)

### Bug Fixes

- handle potential string quote mismatch in generated code (dfa7c05)
- improve createStaticVNode match for rollup codegen compat (abb1b57)
- lazy require @vitejs/plugin-vue to respect NODE_ENV (a051e66)
- static string strip regex for mulitiline static strings (bc486aa)

### Features

- upgrade docsearch version (#441) (1b245e2)

## 0.20.1 (2021-11-05)

### Bug Fixes

- **hmr:** avoid relying on revertd vite hmr behavior (4114674)

# 0.20.0 (2021-10-07)

### Bug Fixes

- fix code line hightlighting (4c042b6), closes #408
- invalid active props when `base` option is added (#342) (383d8ff)
- make config hmr work in window (#364) (58663bb)
- print urls again (df69b76)
- support vite plugins provided via `config.vite` (#394) (4b76617)
- **theme-default/algolia:** avoid creating multiple algolia searches (#292) (389e863)
- **theme:** fix algolia search filter (5fd7db2)
- tolerant invalid hash (#399) (efc5e1b)

### Features

- support ts/esm config file + defineConfig() helper (d3b1521), closes #339 #376
- **theme-default:** home slot for customizing the entire homepage easily (#314) (07bf145)

## 0.19.2 (2021-09-28)

### Bug Fixes

- encode urls that conflict w/ vite built-in replacements (3940625)

## 0.19.1 (2021-09-21)

- Fix build

# 0.19.0 (2021-09-21)

### Features

- upgrade vue, simplify deps (9030486)
- use `markdown-it-attrs` for markdown-it plugins (#393) (610e9b7)

## 0.18.1 (2021-09-16)

### Bug Fixes

- ensure stable pages entry order across builds (929bcf5)

# 0.18.0 (2021-09-14)

### Features

- map mode + remove deprecated options (b94b163)
- support `<script client>` in mpa mode (e0b6997)

## 0.17.3 (2021-09-09)

### Bug Fixes

- emit prevented hashchange event (4fb387d)

## 0.17.2 (2021-09-08)

### Bug Fixes

- improve fs allow (2e9264f)

### Features

- support config.extends (f749b27)

## 0.17.1 (2021-09-08)

### Bug Fixes

- avoid using spread for client code (03abee7)
- **default-theme:** use description as tagline by default (b94c827)
- handle case when there is no themeConfig (034c737)

### Performance Improvements

- minor optimizations (96bcdda)

# 0.17.0 (2021-08-31)

### Bug Fixes

- allow vite server access to theme and local files (9b9fdc7)
- **code:** code block highlight bug in ul (#352) (9245226)
- **css:** remove 720px breakpoint in home layout (#347) (0c1a1f2)
- **i18n:** fix locales reading, add site.langs (#353) (bc78adb), closes /vuepress.vuejs.org/guide/i18n.html#site-level-i18 /v2.vuepress.vuejs.org/guide/i18n.html#site-i18
- include emoji text in nav link to match toc (#284) (80ff360)
- use useData() instead of $site (#365) (1e64773)

### Features

- support function config (e74c5f0)
- support partial include directive (7b3a9e5)
- upgrade markdown-it-anchor (#350) (26b5aa9)

### BREAKING CHANGES

- the `markdown.anchor` option is updated. Refer to
  valeriangalliat/markdown-it-anchor#permalinks for
  instructions to upgrade your existing `markdown.anchor.permalink`
  option. **This doesn't affect you if you weren't changing the header
  permalinks behavior**.

## 0.16.1 (2021-08-11)

### Features

- info custom container (4925fb5)

# 0.16.0 (2021-08-10)

This version uses Vue 3.2.0.

### Bug Fixes

- override target and rel links attribute in config (#332) (9d98dbb)
- **edit-link:** let frontmatter overwrite global editLink (#340) (cfbba80)

## 0.15.6 (2021-07-02)

### Bug Fixes

- automatically escape vite user defined variables in markdown (3cec536)
- skip external URLs in `withBase` (#328) (53bb961)

## 0.15.5 (2021-06-23)

### Bug Fixes

- **nav:** display nav if locales are present (#321) (e76e6ec)
- **search:** correctly detect multilang (c046905), closes #316

### Performance Improvements

- only update necessary head tags in prod (e6bb5a4)

## 0.15.4 (2021-06-19)

### Bug Fixes

- avoid scroll behavior reliance on .nav-bar class (9b35dfc)

## 0.15.3 (2021-06-15)

### Bug Fixes

- avoid error when theme does not have .nav-bar class (a9d5800)
- avoid resetting head tags on hmr/page switch (f52f20e)
- watch config file when using srcDir (348f19a)

## 0.15.2 (2021-06-15)

### Bug Fixes

- force optimize vue to avoid duplication when linked (eefba39)

## 0.15.1 (2021-06-14)

### Features

- support passing vite config in vitepress config file via `vite` option (3737b10)
- support srcDir config option (aaf4910)

### Performance Improvements

- avoid double resolve user config on startup (5733fc6)

### BREAKING CHANGES

- Some config options have changed.

  - `vueOptions` renamed to `vue`
  - `alias` option has been removed. Use `vite.resovle.alias` instead.

# 0.15.0 (2021-06-14)

### Bug Fixes

- fix frontmatter sidebarDepth for headers (424a4ca)
- fix vue code block type indication (76fa173)

### Features

- more efficient `useData()` method that exposes all data (0661063)

### BREAKING CHANGES

- The following methods are removed.

  - `useSiteData`
  - `useSiteDataByRoute`
  - `usePageData`
  - `useFrontmatter`

  Instead, use the new `useData()` method:

  ```js
  // before
  import { useSiteDataByRoute, usePageData } from 'vitepress'
  const site = useSiteDataByRoute()
  const page = usePageData()
  const theme = computed(() => site.value.themeConfig)

  // after
  import { useData } from 'vitepress'
  const { site, page, theme } = useData()
  ```

  All destructured values are computed refs injected from app root
  so they are created only once globally.

- All global mixin properties (e.g. `$site`) except `$frontmatter` are removed. Always use `useData()` to retrieve VitePress data in Vue components.

## 0.14.1 (2021-06-08)

### Bug Fixes

- functional templates with vue v3.1 (#312) (8988aad)

# 0.14.0 (2021-05-27)

### Bug Fixes

- chinese filenames can't build (#217) (#262) (b940397)
- **theme:** set search box min-width for >=751px (#286) (9589a5d)
- detect public folder for dead link (#290) (3aa185f)
- remove unnecessary 'vite/dynamic-import-polyfill' (6b4a4aa)

### Features

- Vite version bumped to `^2.3.4`
- exclude option (#281) (71a5e1c)
- Render titles for social sharing and improve home page sharing (#263) (e651f97)

## 0.13.2 (2021-04-26)

### Bug Fixes

- **search:** silence warning for prop (0716ffa)

## 0.13.1 (2021-04-26)

### Bug Fixes

- **locales:** use correct lang (#283) (de89c1e)

# 0.13.0 (2021-04-08)

### Bug Fixes

- build fails without css chunks (#209) (#239) (fa469fd)
- **css:** reuse css vars (#256) (8d91524)
- **docs:** global-component link (#271) (a43933c)
- **locales:** use correct lang (#276) (f505db9)
- **navbar:** use css var for background-color (#264) (f385bc4)
- badge for language-javascript (#245) (f8b4aa5)

### Features

- detect dead links (74f5ada)
- import code snippet with region (#237) (#238) (d1a62e1)

## 0.12.2 (2021-02-15)

### Bug Fixes

- **theme-default:** avoid ad image distortion on mobile (4a40e1f)

## 0.12.1 (2021-02-15)

### Bug Fixes

- `@` alias for import code snippet being always `undefined` (#204) (2aa8ab2)
- `base` option not generating correct multi sidebar (#231) (#234) (a613df4)
- ads display causing layout break in mobile view (#230) (7ceaf34)
- home action link not being reactive (#195) (#212) (5678dc3)
- nav home title not having locale based link (#195) (#233) (6538c8e)

# 0.12.0 (2021-02-09)

### Bug Fixes

- `base` option not working on dev mode (#223) (0b5b306)
- frontmatter description duplication (#194) (#170) (338e845)
- sidebar 'auto' not working (#178) (#224) (5deaf6a)
- render document with standards mode in dev (#207) (8a0db65)
- utf-8 character not working on safari in dev mode (#228) (b82d8f2)
- use brand color in algolia search box (2330023)

### Features

- add vue options config (expose @vitejs/plugin-vue) (#215) (5b34c6a)

### BREAKING CHANGES

- If sidebar option is `undefined` it will be treated as `auto`, where previsouly it looked like it was treated as `false`. It was always treated as `auto`, but due to this bug, the sidebar was hidden, therefore it looked like it was treated as `false`.

## 0.11.5 (2021-01-29)

### Bug Fixes

- avoid layout shift due to ads (#176) (78b026c)
- support symbolic links in building docs dist (#184) (#185) (5190604)
- update base option usage (8cfdd19)

### Features

- $lang and $localePath globals (#166) (#167) (481c451)

## 0.11.4 (2021-01-19)

- Latest Vite beta.32 compat (internal changes).

## 0.11.3 (2021-01-13)

### Bug Fixes

- ignore non-html links in router and prefetch (3e6e61b)

## 0.11.2 (2021-01-12)

### Bug Fixes

- aria label id (a0f463a)

### Performance Improvements

- generate preload directives for dynamicImport chunks too (b9fc0cb)

## 0.11.1 (2021-01-12)

### Features

- render content on home page (ca631c7)

# 0.11.0 (2021-01-12)

### Code Refactoring

- move default theme to 'vitepress/theme' (a79e1e1)

### Features

- support customData in config (4072dc5)

### BREAKING CHANGES

- the default theme is now exposed via 'vitepress/theme',
  instead of a named export from 'vitepress'. This change fixes the case where
  when a completely custom theme is used, importing anything from 'vitepress'
  also imports the entire default theme.

## 0.10.8 (2021-01-11)

### Bug Fixes

- resolve page hash case-insenstively, close #202 (#203) (bac1ce2)

## 0.10.7 (2021-01-05)

### Features

Bump to Vite 2.0.0-beta.8

### Bug Fixes

- scrollbar when using line highlight (#200) (b6ba8a9)

## 0.10.6 (2021-01-04)

### Bug Fixes

- bump vite and fix win32 path resolving (#198) (da2c4f6)

## 0.10.5 (2021-01-02)

### Bug Fixes

- vite 2.0.0-beta.2 compat (991a443)

## 0.10.4 (2021-01-01)

### Bug Fixes

- ensure the same vue dep in all cases (d6b8568)
- respect root during build (055e3fd)

## 0.10.3 (2021-01-01)

### Bug Fixes

- always define theme globals (8769b4b)
- avoid unexpected vite define replacements in markdown content (a41928e)
- loosen navLink active matching (8a2ff33)

### Features

- **theme-default:** nav.item.activeMatch (e262ef6)
- add altAction for home (9a17ddf)

## 0.10.2 (2020-12-31)

### Bug Fixes

- adjust multi sidebar matching logic (7e4b16e)

## 0.10.1 (2020-12-30)

### Bug Fixes

- disable css code split (04dc058)
- minify (e3d7fc0)

### Features

- production ready serve (2d77eaf)

### Performance Improvements

- avoid including optional features in build when not used (c878e6d)

# 0.10.0 (2020-12-30)

- Upgrade to Vite 2.0

### Bug Fixes

- port fixes to parseHeader utils from vuepress (#172) (dd312ce)
- revert datetime handling (a1daf2b)
- style pollution on custom theme (#190) (46e99ba)
- temporarily disable slot usage causing hydration mismatch (0239159)
- **md:** avoid normalising markdown "mailto:" links (#173) (18d18d2)

## 0.9.2 (2020-12-10)

Fix build files

## 0.9.1 (2020-12-05)

### Bug Fixes

- **theme:** the actionLink miss withBase (#168) (#169) (ffaca73)
- align $title with vuepress (#158) (#163) (30740d3)
- fix h2 anchor hover (9bd79e8), closes #174
- fix inline code not inheriting the parent font size (f5a570f)
- fix link prefetch (ade6ddd)
- hydration mismatch when home page having action link (a7686b7)
- make home page look better (#154) (a084cd3)
- prevLinks and nextLinks config type (#165) (1b6981a)
- siteData passed to enhanceApp being siteDataByRoute (#159) (01d2837)

### Features

- built-in ClientOnly component (8809d2d)
- **default-theme:** support customLayout: true in frontmatter (f32771f)
- add `$withBase` global app function (15e18df)
- add Algolia DocSearch (#40) (#153) (5bb4730)
- add native support for carbon ads (#86) (9d6b8ca)
- support customizing default theme via slots (b8e892e)
- add more global and computed properties (#152) (c6bdcfb), closes #152

# 0.9.0 (2020-11-24)

### Bug Fixes

- avoid 300ms click delay on touch devices (621ca3e)
- fix nested list having too much margin (b0cf2be)
- fix sidebar active status not working as expected (#140) (#149) (0b181e7)
- make code block look prettier (#146) (242fcc1)
- some color in code block not working as expected (#143) (da09266)

### Features

- add "last updated" feature (40d204b)

## 0.8.1 (2020-11-20)

### Bug Fixes

- fix "next and prev link" not working when `link` has extention (6dcf6b3)
- fix "next and prev links" not working when the `base` option is set (#139) (018a9b4)

# 0.8.0 (2020-11-20)

### Bug Fixes

- exit process with non-zero code on error (fb09f8e)
- fix edit link and prev and next links display (#97) (c3b7172)
- fix next and prev links not working (#130) (fdd498b)
- display header-anchor links when using keyboard navigation (ddc3640)
- show top part of scrollbar in sidebar (#129) (1ba209a)

### Features

- add ability to configure markdown options (#127) (#128) (463a03a)
- add serve command (#136) (67868bd)
- better build command output (e435eec)

## 0.7.4 (2020-11-11)

### Bug Fixes

- **css:** fix padding on mobile (9c7293b), closes #121

## 0.7.3 (2020-11-06)

### Bug Fixes

- Fix sidebar page switch layout shifting
- Fix production hydration mismatch

## 0.7.2 (2020-11-02)

### Bug Fixes

- adapt to vite fix of ssr build asset paths (6b3fbe3)

### Features

- add home page feature (#108) (3a0af0b)

## 0.7.1 (2020-10-30)

### Bug Fixes

- compat with latest vite + handle no export default script tags in md (b10da2f)
- fix switch language error (#103, #106) (#104) (d354d1e)

# 0.7.0 (2020-10-19)

### Bug Fixes

- **css:** theme specific (6891092)
- **router:** remove fakeHost when fixing url extenions (2eb3135)

### Features

- **client:** add slot for a searchbar (68d9b18)
- **i18n:** add nav dropdown language selector feature (#91) (294836c)
- **sidebar:** close when navigating (2094d53)
- add doctype html (02f2e10)
- add some space between 2 code blocks (5daa8d2)

# 0.6.0 (2020-09-17)

### Bug Fixes

- **client:** use relative import (725a04c)
- **links:** keep relative hash links as is (a90d971)
- **router:** allow open new tab with ctrl + click (#69) (092ee77)
- **sidebar:** no margin on mobile (#89) (218c729)
- sidebar not working correctly when path starts with slash (610cc17)
- **sidebar:** fix sidebar when you open a nested link (#73) (d2b6d39)

### Features

- add blockquote styling (8c1aada)
- add charset and viewport meta tags (#77) (2e8e1f5)
- add git repo link and edit links (#55) (0ea34cb)
- add prev/next links (#56) (f52b1d5)
- add responsive sidebar support (#75) (39dbd78)
- add table css from vuepress (#88) (8435e36)
- close the sidebar when clicking outside of the sidebar (#78) (e93ee09)
- navlinks in sidebar (#80) (a20bcf3)
- overwrite prev/next link (#61) (1b96f63)
- support config alias (#59) (63a3691)
- top and bottom slots for sidebar and page (#90) (1106013)
- **sidebar:** use base when creating link (#74) (79bc9fb)

# 0.5.0 (2020-07-21)

### Bug Fixes

- decode hash before selecting (e782c4c)
- fix navbar withBase (e9ab56b)
- typings field in package.json (#48) (692a490)

### Features

- add external link support for nav items (#46) (44e91bb)
- add multi sidebar support (#38) (#49) (050fa4c)
- i18n support (#50) (7802cb5)
- nav dropdown (#51) (5780461)

## 0.4.1 (2020-07-02)

### Bug Fixes

- avoid error when requesting non-existing md file (e77ea63)
- resolve relative path on windows (#27) (9116c9c)
- use resolve instead of join (#33) (6f10ed6)

### Features

- add array sidebar support (#35) (4a8388e)

# 0.4.0 (2020-06-19)

## 0.3.1 (2020-06-05)

### Bug Fixes

- avoid using **DEV** + throttle active header link (a63b0cf)

# 0.3.0 (2020-06-02)

### Bug Fixes

- lazy load @vue/server-render for production build (382e1b6)

### Features

- active sidebar links (d2ea963)

# 0.2.0 (2020-05-22)

### Bug Fixes

- avoid unnecessary prefetches (0a81525)
- handle links that embed other elements (#2) (4cbfc60)

### Features

- copy public dir (ddc9d51)
- lean builds (b61e239)
- prefetch in viewport inbound page chunks (da4852a)
- use hashed page file names (a873564)
- use modulepreload links (0025af1)

### Performance Improvements

- inject script tags for page common chunk imports (57d900d)

## 0.1.1 (2020-04-30)

- fix dependency versions

# 0.1.0 (2020-04-30)

### Features

- add markdown processing (5c47bbb)
- spa navigation (21d3cd8)
- update head tags during dev (bdbbdd5)
- update title & description during dev (0b9bf27)
