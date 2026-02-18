---
number: 670
title: Offline search functionality
type: other
state: closed
created: 2022-05-28
url: "https://github.com/vuejs/vitepress/issues/670"
reactions: 32
comments: 38
labels: "[has-workaround]"
---

# Offline search functionality

ref #733

### Is your feature request related to a problem? Please describe.

We are using VitePress for internal documentation. Especially for larger projects such as our entire knowledge base, it can be hard to find exactly what you're looking for. A search bar would greatly help out. An Algolia search bar is already available, but since our docs are hosted on a private network and for internal use only, this is not an option for us.
 
From Algolia DocSearch documentation:
> Your website must be publicly available. We do not host search indices for websites that are only available after authentication or are hosted on a private network.

### Describe the solution you'd like

A search bar that works offline, or at least on a private network. I believe VuePress has a plugin, but the serach bar shows "Powered by Algolia" so I'm not sure.

### Describe alternatives you've considered

- Hosting our docs publicly: not an option.
- Using VuePress or a different static site generator altogether, but since our apps are built on top of Vite we'd rather not.
- Using VuePress Next/V2 since it seems to have a local search option, and supports Vite as well.

### Additional context

_No response_

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that asks for the same feature to avoid creating a duplicate.

---

## Top Comments

**@ed-fruty** (+17):

I think, that any static site generator must provide offline search out of the box. VuePress, Docusaurus etc. has this feature. 
And as an additional feature - search by algolia or another one engine.

**@fawazahmed0** (+8):

It would be great to have a search functionality similar to docsify, it supports multiple languages and doesn't depend on algolia(i.e works offline)

**@brc-dd** [maintainer]:

> but the workflow is not good since I'm reading the generate html.

@emersonbottero What if we could provide you a `transformHtml` hook that gives you access to stuff like: resolved site config/data, title, description, head config, content, html, filename? That should also prevent the running build twice thing IG?