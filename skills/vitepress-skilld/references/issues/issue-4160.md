---
number: 4160
title: Client-side redirects
type: other
state: open
created: 2024-08-24
url: "https://github.com/vuejs/vitepress/issues/4160"
reactions: 6
comments: 12
---

# Client-side redirects

### Is your feature request related to a problem? Please describe.

I'm using Vitepress to document my Rust library called `bon`. I'm hosting it on Github Pages, which is quite a limited hosting provider, but it's a simple one and it's built into Github, so it's very convenient. Github Pages doesn't support server-side redirects, however, VitePress could just do redirects client-side.

I'm preparing a `2.0` release of my library. I'm organizing different versions of the docs under `v1/` and `v2/` path prefixes. However, I'd like to have a special prefix (e.g. `latest/`) that would forward to the latest version of the docs, such that I could use this link in my blog posts, for example. The version-specific URLs are used the doc-comments of my library.

Or.. ideally, prefix-less paths should forward to the latest version of the docs automatically. A similar thing is implemented on `docs.rs` (the default site that generates docs for Rust libraries):
- https://docs.rs/bon/1.2.1 (version-specific page)
- https://docs.rs/bon redirects to https://docs.rs/bon/latest/bon/

I want to have the same behaviour with Vitepress where
- https://elastio.github.io/bon/v2/guide/overview  (version-specific page)
- https://elastio.github.io/bon/guide/overview redirects to https://elastio.github.io/bon/v2/guide/overview 

### Describe the solution you'd like

There could be client-side redirects config in Vitepress `config.mts` file. For example, an...