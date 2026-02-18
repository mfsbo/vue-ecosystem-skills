---
number: 257
title: Assistant's UIMessage contains no parts after upgrade to 0.3.0
type: other
state: open
created: 2026-01-30
url: "https://github.com/TanStack/ai/issues/257"
reactions: 15
comments: 3
---

# Assistant's UIMessage contains no parts after upgrade to 0.3.0

### TanStack AI version

0.3.0

### Framework/Library version

NextJS 16.1.4

### Describe the bug and the steps to reproduce it

When receiving Assistant UIMessage it contains no parts even tho the SSE stream clearly shows that it returns the full stream.

Assistant UIMessage object
`{
    "id": "msg-1769792562080-lm3kri",
    "role": "assistant",
    "parts": [],
    "createdAt": "2026-01-30T17:02:42.080Z"
}`


Stream response:
`data: {"type":"done","id":"resp_09013e7f2283eaec00697ce43268308196a79e858d6b032d6c","model":"gpt-5.2-2025-12-11","timestamp":1769792562413,"usage":{"promptTokens":96,"completionTokens":16,"totalTokens":112},"finishReason":"stop"}

data: [DONE]`

### Your Minimal, Reproducible Example - (Sandbox Highly Recommended)

Sorry none

### Screenshots or Videos (Optional)

_No response_

### Do you intend to try to help solve this bug with your own PR?

None

### Terms & Code of Conduct

- [x] I agree to follow this project's Code of Conduct
- [x] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@jherr** (+2):

i've got it. will have a fix soon.

**@AlemTuzlak**:

can anybody create a minimum repro for this?

**@oskarscholander**:

> i've got it. will have a fix soon.

Thank you!!