---
number: 3093
title: "Feature Request: Inline Syntax Highlight"
type: other
state: open
created: 2023-10-15
url: "https://github.com/vuejs/vitepress/issues/3093"
reactions: 16
comments: 3
labels: "[theme]"
---

# Feature Request: Inline Syntax Highlight

### Is your feature request related to a problem? Please describe.

Support syntax highlight on inline code in docs.

The picture below is from an HTML code snippet using Prism and a syntax like this:
```html
<code class="language-js">if (user.actionsHistory[0].type ==="undo")</code>
```




And the picture below is the same writing with Vitepress:
```md
`if (user.actionsHistory.at(-1).type ==="undo")`
```




As you see the Syntax Highlighting is gone. Could be cool to have an automatic inline Syntax Highlighting for md docs.

Here is another example for a CSS code snippet. On the left using markdown and viteperss, and on the right, using html and prism:




### Describe the solution you'd like

There'v been some suggestions before on vitepress: https://github.com/vuejs/vitepress/issues/1343 and vuepress: https://github.com/vuejs/vuepress/issues/1212 on how the syntax could look like. I personally do not have a preference. But I believe this syntax:
```md
And `if (someCondition === true)`{lang=js}
```
allows for future expansions:
```md
And `if (someCondition === true)`{lang=js,someFlag=false,someOtherFlag=true}
```

### Describe alternatives you've considered

Have not tried anything yet. Just faced this requirement while trying out vitepress. If I ever came up with a solution that did or did not work will share here.

### Additional context

There was already 1 issue about this: https://github.com/vuejs/vitepress/issues/1343, but was closed as "Not seeing any demand for this". So I re-created this issue as a demand.

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs:

Not sure why this issue and the associated PR were closed, seeing as it is a very simple addition.

In your style.css:

```css
.vp-doc span.inline-code-highlight > code {
    border-radius: 4px;
    padding: 3px 6px;
    white-space: normal;
    background-color: var(--vp-code-block-bg);
    font-size: var(--vp-code-font-size);
}

.vp-doc div[class*="language-"], .vp-doc span.inline-code-highlight > code {
    border: 1px solid var(--vp-code-bg);
}
```

In your config.mjs:

...

**@sharpchen**:

Shiki for Rehype supports the similar, can we have this?