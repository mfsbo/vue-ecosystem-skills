---
number: 260
title: Dependency Mismatch with ai-gemini
type: other
state: open
created: 2026-02-01
url: "https://github.com/TanStack/ai/issues/260"
reactions: 2
comments: 3
---

# Dependency Mismatch with ai-gemini

### TanStack AI version

0.2.2

### Framework/Library version

React 19.2.0

### Describe the bug and the steps to reproduce it

There's an issue with the depenencies. If i run `npm create @tanstack/start@latest` and create a template with AI, or if i run `npm install @tanstack/ai @tanstack/ai-react @tanstack/ai-gemini`, i get error 

`npm error code ERESOLVE
npm error ERESOLVE could not resolve
npm error
npm error While resolving: undefined@undefined
npm error Found: @tanstack/ai@0.2.2
npm error node_modules/@tanstack/ai
npm error   @tanstack/ai@"*" from the root project
npm error   peer @tanstack/ai@"^0.2.2" from @tanstack/ai-gemini@0.3.2
npm error   node_modules/@tanstack/ai-gemini
npm error     @tanstack/ai-gemini@"^0.3.2" from the root project
npm error
npm error Could not resolve dep...