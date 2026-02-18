---
number: 4590
title: Support llms.txt generation
type: other
state: open
created: 2025-03-02
url: "https://github.com/vuejs/vitepress/issues/4590"
reactions: 9
comments: 6
labels: "[has-workaround]"
---

# Support llms.txt generation

### Is your feature request related to a problem? Please describe.

VitePress lacks support for the emerging `llms.txt` "standard", which provides markdown content in a format optimized for LLM consumption. Documentation sites need a way to make their content more easily digestible by AI assistants for improved accuracy and context preservation.

### Describe the solution you'd like

Implement native `llms.txt` generation in VitePress:
- Auto-generate LLM-optimized versions of documentation
- Support structured content formatting for better AI comprehension
- Provide configuration options to customize output format

### Describe alternatives you've considered

Manual content transformation or post-processing scripts, but these create maintenance overhead and version inconsistencies.

### Additional context

The `llms.txt` standard focuses on making documentation more accessible to AI systems through optimized formatting and structure. Supporting this would enhance how VitePress documentation is consumed by AI assistants, resulting in more accurate responses when users query documentation content through LLMs.

### Validations

...

---

## Top Comments

**@okineadev** (+2):

Hello 

I created `vitepress-plugin-llms` which generates LLM-Friendly documentation

This plugin generates the following files:

```
.vitepress/dist
├── ...
├── llms-full.txt            // A file where all the website documentation is compiled into one file
├── llms.txt                 // The main file for LLMs with all links to all sections of the documentation for LLMs
├── markdown-examples.html   // A human-friendly version of `markdown-examples` section in HTML format
└── markdown-examples.md     // A LLM-friendly version of `markdown-examples` section in Markdown format
```...

**@brc-dd** [maintainer]:

It ultimately depends on how many users need that feature. Enabling `llms: true` in vitepress config is significantly more convenient for end-users compared to installing and setting up a separate plugin. The same applies to other popular vitepress features like mathjax/katex support, local search, sitemap generation - and we will likely bring back auto-sidebar mode as well. While all of these could be (and were/are) achieved with third-party plugins, the built-in options offer a much smoother experience. Performance is another key factor - by generating the necessary files within the core, we...

**@okineadev**:

The current solution for this is [`vitepress-plugin-llms`](https://github.com/okineadev/vitepress-plugin-llms) (https://github.com/vuejs/vitepress/issues/4545#issuecomment-2796036135)

The plugin is now quite stable and is [already used by many popular websites](https://github.com/okineadev/vitepress-plugin-llms#-projects-where-this-plugin-is-used).

---

Regarding embedding `llms.txt` generation into **VitePress** itself - I am against it because:

1. According to the UNIX philosophy, "_A program should do one thing, and do it well._" [^1]
2. _Make modular and extensible programs_ [^2]

...