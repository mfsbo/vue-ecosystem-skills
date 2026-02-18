---
number: 3966
title: Unified API for VitePress Plugins
type: question
state: open
created: 2024-06-18
url: "https://github.com/vuejs/vitepress/issues/3966"
reactions: 17
comments: 2
labels: "[help wanted]"
---

# Unified API for VitePress Plugins

### Is your feature request related to a problem? Please describe.

The VitePress community has develop a range of amazing plugins which elevate the user experience of VitePress to another level.

Unfortunately, there isn't a clear and unified way of how users add these plugins to their VitePress setup. For example

- Sometime we have to add options to `markdown` and the Theme `enhanceApp` https://vitepress-plugins.sapphi.red/tabs/#usage
- Sometimes we have to register plugins to the underlying Vite instance https://github.com/ATQQ/sugar-blog/tree/master/packages/vitepress-plugin-pagefind#usage
- Sometimes a wrapper is provided https://emersonbottero.github.io/vitepress-plugin-mermaid/guide/getting-started.html#setup-it-up to wrap the entire `defineConfig` object
- Sometimes a wrapper is provided https://vvp.imb11.dev/guide/basic-setup#configuration-setup that replaces the `defineConfig` object

I understand the reason for why these different approaches are required, as different plugins might interact with different components of the VitePress stack (underlying architecture, markdown rendering, frontend Vue components...). 

However, for a user this can be very confusing. Furthermore, if more plugins would start to adapt the wrapper way, we would quickly end up in a world where a config.ts starts like this:

```js
export default withMermaid({withPageFind({withTabs({...
```

Which I (personally) find really hard to read and maintain.

### Describe the solution you'd like

It would be great to have a common "API" for Vite **Press** plugins? I.e. providing hooks for all that required, underlying components for plugins to hook into (plugin developers would have a much better understand how requirements could look like).
Once this is available, it would also be great to have a "suggested" plugin development guide.

### Describe alternatives you've considered

...

---

## Top Comments

**@Gugustinette**:

A proper plugin system would definitely be awesome 

Vite 6 just came out so I guess a first step would be to migrate VitePress to it ?
But it would be cool :
- Being able to access the configuration given by the user
- Running code at different steps during the build process
- Being able to leverage VitePress internal capabilities to modify pages content, add pages, sidebar configuration, styling,... All in an extensible and programmatical way

Not sure how hard it would be, I could work on a PR but I've never worked on VitePress codeba...