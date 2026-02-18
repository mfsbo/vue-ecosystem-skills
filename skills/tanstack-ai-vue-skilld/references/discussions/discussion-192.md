---
number: 192
title: Type inference for config parameter is lost in new OpenAITextAdapter(...), resulting in no IntelliSense
category: Q&A
created: 2025-12-27
url: "https://github.com/TanStack/ai/discussions/192"
upvotes: 1
comments: 0
answered: false
---

# Type inference for config parameter is lost in new OpenAITextAdapter(...), resulting in no IntelliSense

`new OpenAITextAdapter(config: OpenAITextConfig, model: TModel)` does not infer the type of `config` correctly, causing missing code completion in TypeScript. I'm not sure whether this is an issue with my TypeScript configuration or with the published package.
<img width="1880" height="470" alt="image" src="https://github.com/user-attachments/assets/371d7cc4-251c-4fa3-8c31-8eefcbc55db6" />

