---
number: 191
title: When `@standard-schema/spec` dependency is missing, the `chat` function returns `any`
category: General
created: 2025-12-27
url: "https://github.com/TanStack/ai/discussions/191"
upvotes: 2
comments: 0
answered: false
---

# When `@standard-schema/spec` dependency is missing, the `chat` function returns `any`

I followed the **Quick Start** documentation to create a new project to try out the TanStack AI development experience. However, I noticed that the parameter types of tool function definitions were inferred as `unknown`, and the return type of the `chat` function was inferred as `any`.

To investigate, I cloned the project https://github.com/AlemTuzlak/video-to-social-previews.git and gradually copied its `tsconfig.json` and `package.json` into my own project. After restarting VS Code, type inference worked correctly again.

Then I started removing dependencies one by one and restarting VS Code each time. I found that as soon as I removed `@standard-schema/spec`, type inference broke again. I’m not sure whether there are oth...