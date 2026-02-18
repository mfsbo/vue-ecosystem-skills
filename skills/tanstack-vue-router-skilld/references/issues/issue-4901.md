---
number: 4901
title: Link should accept external links
type: feature
state: open
created: 2025-08-09
url: "https://github.com/TanStack/router/issues/4901"
reactions: 34
comments: 8
labels: "[enhancement, types]"
---

# Link should accept external links

### Which project does this relate to?

Router

### Describe the bug

The `Link` component, custom link components created with `createLink()` and possibly `linkOptions()` only accept internal links but should accept external links (https, mailto, tel, ...) as well. 

The `Link` component could simply be replaced with a plain `a` element when using external links, but custom link components are often styled or may provide additional behavior which we want to use for external links as well.

There's already a check implemented for external links and passing an external URL for the `to` prop actually works at runtime but not on a type-level.

https://github.com/TanStack/router/blob/ef74fc661bb82cbc415fcc6645cffcaec9b3b8b7/packages/react-router/src/link.tsx#L88-L94


### Your Example Website or App

https://stackblitz.com/edit/github-qe1tnt6t?file=src%2Fmain.tsx

### Steps to Reproduce the Bug or Issue

The external links `<Link to="https://..." />` work at runtime but produce a TS error.
The link with just `<Link href="https://..." />`  doesn't work at runtime and also produces a TS error (because `to` is required).


### Expected behavior

There should be a way to use (custom) link components with external links without TypeScript errors.

### Screenshots or Videos

_No response_

### Platform

- Router / Start Version: 1.131.2
- OS: macOS
- Browser: Brave
- Browser Version: 1.81.31
- Bundler: Vite
- Bundler Version: 6.3.5


### Additional context

Related discussion on Discord: https://discord.com/channels/719702312431386674/1391990807225171968

---

## Top Comments

**@max-ae** (+10):

Chiming in here: when using the `href` prop for an external URL, TS complains about missing `to`. When adding additional `from` prop here, the TS error about `to` disappears, but the Link does not navigate to the external URL at runtime, but rather to `.`

Was also confused by the docs stating that this should work.

**@achou11** (+1):

Running into this as well. My initial approach was actually specifying the `href` prop instead as I thought that should work based on the documentation here, but it seems that it doesn't work for me:

> This can be used instead of `to` to navigate to a fully built href, e.g. pointing to an external target.

EDIT: Ah I see you noted the issue with the `href` prop not working at runtime. I feel like that should be highlighted as a bigger issue  

**@hornta** (+1):

I have this problem with the normal `Link` component imported from `import { Link } from "@tanstack/react-router";`. I don't think this problem is specific to only custom links.