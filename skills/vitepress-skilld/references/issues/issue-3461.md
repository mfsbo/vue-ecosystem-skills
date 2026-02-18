---
number: 3461
title: support for single file output
type: other
state: open
created: 2024-01-16
url: "https://github.com/vuejs/vitepress/issues/3461"
reactions: 11
comments: 1
labels: "[build]"
---

# support for single file output

### Is your feature request related to a problem? Please describe.

It is sometimes useful to generate a single file with all JS, CSS, and other assets embedded inline. This allows it to be easily shared and opened locally without a web server or an Electron wrapper. Some examples:


* No JS
  * HTML-formatted email content
  * A portfolio or resume
* With JS
  * A simulation or game
  * A documentation site with hash-based client-side routing

The plugin `vite-plugin-singlefile` was made to support this, but doesn't work with vitepress: https://github.com/richardtallent/vite-plugin-singlefile/issues/82

Here are a couple past examples of people trying to achieve this:

* https://github.com/vuejs/vitepress/issues/1889
* https://github.com/vuejs/vitepress/issues/2829

Those were closed because of the challenges associated with relative base URLs. Is there a chance that forcing the router to use hash mode and outputting only a single _index.html_ file even for multiple routes would help here?


### Describe the solution you'd like

A config option to bundle everything into a single file, possibly in conjunction with MPA mode.

This mode would:
* output just a single HTML file
* force hash-based routing
* bundle / inline all CSS & JS into the header
* base-64 encode and inline binary assets



### Describe alternatives you've considered

A post-build script can achieve similar ends for very simple scenarios. For example, this one handles CSS and can be run after `vitepress build`:


...

---

## Top Comments

**@micobarac** (+1):

Any update on this? It's been marked as stale, but this feature would be appreciated.