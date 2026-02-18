---
number: 209
title: Gemini Thinking output is added to content instead of thinking chunks.
type: other
state: closed
created: 2026-01-07
url: "https://github.com/TanStack/ai/issues/209"
reactions: 0
comments: 0
---

# Gemini Thinking output is added to content instead of thinking chunks.

### TanStack AI version

0.2.1

### Framework/Library version

React 19.0

### Describe the bug and the steps to reproduce it

When I enable thinking for Gemini with: 
`modelOptions: {
          thinkingConfig: {
            includeThoughts: true,
            thinkingBudget: 500,
          }
        }
`

I receive all the thinking output as part of the content chunks. 

This is caused by the processStreamChunks method in the Gemini text adapter: https://github.com/TanStack/ai/blob/1ce1e88300da473074c4e7b72586dfcf0656f4cc/packages/typescript/ai-gemini/src/adapters/text.ts#L214

When if (part.text) the code should further check if part.thought is true. If it is we shall yield { type: 'thinking', ... }. 

### Your Minimal, Reproducible Example - (Sandbox Highly Recommended)

--

...