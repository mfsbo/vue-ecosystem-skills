---
number: 2954
title: Sync code group selection
type: other
state: open
created: 2023-09-13
url: "https://github.com/vuejs/vitepress/issues/2954"
reactions: 13
comments: 7
labels: "[theme]"
---

# Sync code group selection

### Is your feature request related to a problem? Please describe.

In many cases, developers will provide code groups for multiple programming languages at the same time. I hope that after the user switches one, other code groups can automatically follow, and it is best to be persistent.

https://github.com/vuejs/vitepress/issues/2773, a solution is proposed here, but I don't think it's good enough
1. Only supports tab, but code group needs it more
2. This is a very commonly used feature, I think it should be officially supported, not by a plugin

### Describe the solution you'd like


::: code-group

\`\`\`js [config.js] :js <-- key
const config = {
  // ...
}

export default config
\`\`\`

\`\`\`ts [config.ts] :ts
import type { UserConfig } from 'vitepress'

const config: UserConfig = {
  // ...
}

export default config
\`\`\`

:::

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

**@pascalbaljet** (+1):

Here's how I did it (`.vitepress/theme/index.js`). It syncs the code group tab and reselects the tab on navigation and full-page refresh. It also keeps the scroll position of the selected tab in case the code groups above the tab are getting bigger or smaller. Demo: https://inertiaui.com/inertia-modal/docs/basic-usage

...

**@brc-dd** [maintainer]:

> Only supports tab, but code group needs it more.

Can you elaborate more on this point.

**@svanimpe**:

+1 from me. I was excited to use code groups, but find them useless without synchronisation.

@re-ovo FYI:  I added the following styles to make tabs look more like code groups:

```css
.plugin-tabs--content {
    padding: 0px !important;
}

.plugin-tabs--content div[class*='language-'] {
    background-color: var(--vp-code-block-bg) !important;
    border-radius: 0 !important;
}
```