---
number: 680
title: Request | allow components instead html string options
type: other
state: open
created: 2025-11-26
url: "https://github.com/f5/unovis/issues/680"
reactions: 2
comments: 0
---

# Request | allow components instead html string options

I wish I could pass Vue (or React, Svelte, etc.) components as slots instead of raw HTML strings or elements.

Example (vue):

```vue
<VisTooltip>
  <template #default="{data, index}">
     <WhatEverHere :data="data" />
  </template>
</VisTooltip>
```