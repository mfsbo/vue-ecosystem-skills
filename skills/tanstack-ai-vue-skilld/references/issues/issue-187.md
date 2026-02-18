---
number: 187
title: toServerSentEventsResponse function missing from @tanstack/ai latest package
type: other
state: closed
created: 2025-12-26
url: "https://github.com/TanStack/ai/issues/187"
reactions: 9
comments: 2
---

# toServerSentEventsResponse function missing from @tanstack/ai latest package

### TanStack AI version

v0.2.0

### Framework/Library version

React v19.2.3

### Describe the bug and the steps to reproduce it

The `toServerSentEventsResponse` function is documented in the latest documentation and exists in the main branch, but it's not available in the published npm package @tanstack/ai@0.2.0.  
  
Steps to reproduce:  
1. Install @tanstack/ai@0.2.0  
2. Try to import: `import { toServerSentEventsResponse } from "@tanstack/ai"`  
3. Get error: `toServerSentEventsResponse is not exported from @tanstack/ai`  
  
The documentation (updated 2 days ago) shows this function as the recommended way to convert streams to SSE responses, but the npm package (released 4 days ago) doesn't include it.  
  
The function exists in the main branch at `packages/typescript/ai/src/stream-to-response.ts` but wasn't included in the v0.2.0 release.

### Your Minimal, Reproducible Example - (Sandbox Highly Recommended)

https://codesandbox.io/p/devbox/2mmljw?file=%2Fapp%2Fapi%2Fchat%2Froute.ts%3A1%2C16-1%2C42

### Screenshots or Videos (Optional)

<img width="2938" height="914" alt="Image" src="https://github.com/user-attachments/assets/7f919d81-1b71-4bfe-afa5-3e4798849b9a" />

### Do you intend to try to help solve this bug with your own PR?

None

### Terms & Code of Conduct

...

---

## Top Comments

**@cameo-js** (+2):

It seems the `toServerSentEventsResponse` related code doesn't seem to have been released yet.

The PR related to `toServerSentEventsResponse` was merged a week ago, but the latest version is 0.2.0, which was released two weeks ago.

It appears there's a discrepancy because the example documentation was updated when the PR was merged.

Based on the previous version of example, you can use `toStreamResponse(deprecated)` for now.

**@jjrise** (+1):

looks like the pattern now is to use `toServerSentEventsStream`?
`import { toServerSentEventsStream } from "@tanstack/ai"`

```ts
  return new Response(toServerSentEventsStream(stream), {
    headers: { "Content-Type": "text/event-stream" },
  });
```