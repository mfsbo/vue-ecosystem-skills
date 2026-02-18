---
number: 5704
title: Support streaming file uploads in server functions
type: feature
state: open
created: 2025-10-30
url: "https://github.com/TanStack/router/issues/5704"
reactions: 7
comments: 0
labels: "[enhancement]"
---

# Support streaming file uploads in server functions

### Which project does this relate to?

Start

### Describe the bug

Currently, TanStack Start automatically calls `await request.formData()` in server functions when the content-type is `multipart/form-data`, which loads the entire file into memory **before** the handler is invoked. This prevents implementing true streaming file uploads with size limit enforcement.

**Reference:** `server-functions-handler.js:49`

```javascript
if (formDataContentTypes.some(
  (type) => contentType && contentType.includes(type)
)) {
  // ...
  const formData = await request.formData();  // <-- File fully loaded into memory here
  // ...
  return await action(params, signal);  // Handler called after file is in memory
}
```

### Current Behavior

When a user uploads a large file (e.g., 100MB, 1GB, or even 10GB):
1. The entire file is loaded into server memory via `request.formData()`
2. Only then is the server function handler called
3. File size limits cannot be enforced before memory consumption
4. Large uploads can crash the server or cause OOM errors
5. True streaming from network → storage is impossible

### Expected Behavior

Server functions should be able to access the raw request body stream via `getRequest()` **before** TanStack Start parses the FormData, allowing developers to:

...