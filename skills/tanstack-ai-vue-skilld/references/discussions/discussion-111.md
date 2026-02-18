---
number: 111
title: Inconsistent Docs - Adapter creation & models availabe
category: General
created: 2025-12-07
url: "https://github.com/TanStack/ai/discussions/111"
upvotes: 1
comments: 0
answered: false
---

# Inconsistent Docs - Adapter creation & models availabe

The docs provide the following code as an example to create the Anthropic adapter. 

```
const adapter = anthropic({
  apiKey: process.env.ANTHROPIC_API_KEY!,
});
```

However,  the one that seems to work is the following 

```
const adapter = createAnthropic(process.env.ANTHROPIC_API_KEY!);
```

The list of supported models mentioned in the docs are also out of date (sonnet 3.5 etc. are mentioned) whereas the library supports the latest sonnet 4.5, haiku 4.5 etc. 

Just a heads up that the docs seem to be a inconsistent and updating them will help. Thanks!