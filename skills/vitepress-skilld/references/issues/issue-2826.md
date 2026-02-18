---
number: 2826
title: Generate dynamic routes after performing build-time data loading
type: other
state: open
created: 2023-08-21
url: "https://github.com/vuejs/vitepress/issues/2826"
reactions: 9
comments: 7
---

# Generate dynamic routes after performing build-time data loading

### Is your feature request related to a problem? Please describe.

I am working on a blog based on VitePress. In my current situation, I need to extract tags from all my posts to generate pages similar to `tags/xxx/`.

My directory structure:

```
blog
  |- .vitepress
  |- posts
  |   |- example-post-1
  |       |- index.md
  |   |- example-post-2
  |       |- index.md
  |- tags
  |   |- [tag].md
  |   |- [tag].paths.ts
  |- posts.data.ts
```

Example post 1:

```markdown
---
title: Example Post 1
tags:
  - tag1
  - tag2
---
```

Example post 2:

```markdown
---
title: Example Post 2
tags:
  - tag2
  - tag3
---
```

I wrote a `posts.data.ts` as a build-time data loader to load all these posts:

```ts
import { createContentLoader } from 'vitepress'
import { getPostFromContentData } from "./utils"  // some internal processing

const loader = createContentLoader('posts/**/index.md')
export default {
  ...loader,
  async load() {
    const data = await loader.load()
    return data.map(getPostFromContentData)
  }
}
```

My aim is to generate some pages like `tags/tag1/`, `tags/tag2/` and `tags/tag3/`, so I created a `[tag].paths.ts`. 

I want to directly access the loader in it:

```ts
import { data as posts } from '../posts.data'

export default {
  paths() {
    const tags = new Set<string>()
    for (const post of posts)
      for (const tag of post.tags)
        tags.add(tag)
    return Array.from(tags)
  }
}
```...