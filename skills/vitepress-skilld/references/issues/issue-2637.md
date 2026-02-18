---
number: 2637
title: "[Dynamic Routes]: Add `transformPageData` configure"
type: other
state: closed
created: 2023-07-17
url: "https://github.com/vuejs/vitepress/issues/2637"
reactions: 11
comments: 1
labels: "[build]"
---

# [Dynamic Routes]: Add `transformPageData` configure

### Is your feature request related to a problem? Please describe.

ref: https://github.com/vuejs/vitepress/issues/883#issuecomment-1614242193 https://github.com/vuejs/vitepress/discussions/2516

When I using Dynamic Routes. To uniformly manage and generate pages with a consistent structure, which involves changing the `header` `title` #2516, the suggestion is also to use `.vitepress/config.js` to use `transformPageData`

```js
// .vitepress/config.js
{
  // ...
  transformPageData: (pageData, { siteConfig }) => {
    if (page-foo) {
       // change header, title and resolve page data
    } else if (page-bar) {
       // ...
    }
}
```

### Describe the solution you'd like

I think if `transformPageData` would be in Dynamic Routes configure `[pkg].paths.js`. Avoid me adding too many logic  in `.vitepress/config.js`, and just managing it in only one place. clear and good management

```
.
└─ packages
   ├─ [pkg].md         # route template
   └─ [pkg].paths.js   # route paths loader
```

```js
// packages/[pkg].paths.js
export default {
  paths() {
    return [
      { params: { pkg: 'foo' }},
      { params: { pkg: 'bar' }}
    ]
  },
  transformPageData(pageData) {
    // ...
  }
}
```

### Describe alternatives you've considered

_No response_

### Additional context

_No response_

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that asks for the same feature to avoid creating a duplicate.

---

## Top Comments

**@davay42** (+3):

Very needed feature. I couldn't figure out how to populate just the 'title:' frontmatter for these dynamic pages without this option. @Zhengqbbb thanks for the tip with use of the `transformPageData`!