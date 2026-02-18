---
number: 225
title: addToolApprovalResponse hangs execution
type: other
state: open
created: 2026-01-14
url: "https://github.com/TanStack/ai/issues/225"
reactions: 0
comments: 3
---

# addToolApprovalResponse hangs execution

### TanStack AI version

0.2.2

### Framework/Library version

"@tanstack/react-start": "^1.149.4",

### Describe the bug and the steps to reproduce it

I am following the documentation for implementing a client-side tool with approval using `@tanstack/ai`.

I have a tool `delete_local_data` configured with `needsApproval: true`. When the AI triggers the tool call, the UI correctly renders my approval component. However, when I call `addToolApprovalResponse({ id, approved: true })`:

1. **The tool implementation does not execute** (the `localStorage` item is not deleted).
2. **The AI does not respond back** after the approval.
3. The UI state seems stuck (likely `isLoading` remains active), preventing further input.

**Reproduction Code**

...