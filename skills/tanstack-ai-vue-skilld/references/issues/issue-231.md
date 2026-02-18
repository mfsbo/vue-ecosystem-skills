---
number: 231
title: When submitting the model parameter in the useChat body, the received value is not the latest
type: other
state: open
created: 2026-01-17
url: "https://github.com/TanStack/ai/issues/231"
reactions: 0
comments: 2
---

# When submitting the model parameter in the useChat body, the received value is not the latest

### TanStack AI version

v.0.2.2

### Framework/Library version

v.0.2.2

### Describe the bug and the steps to reproduce it

When submitting the model parameter in the useChat body, the received value is not the latest。@tanstack/ai-react

### Your Minimal, Reproducible Example - (Sandbox Highly Recommended)

https://tanstack.com/ai/latest/docs/api/ai-react

### Screenshots or Videos (Optional)

```
const chatOptions = React.useMemo(
    () =>
      createChatClientOptions({
        id: `${model}_${new Date().getTime()}`,
        connection: fetchServerSentEvents('/api/tanchat'),
        body: { model },
        // todo Tools
      }),
    [model],
  )
  console.log(" ~ AiChat ~ chatOptions:", chatOptions)

...