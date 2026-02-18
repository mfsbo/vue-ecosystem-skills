---
number: 282
title: Anthropic Adapter does not always return valid JSON
type: other
state: open
created: 2026-02-10
url: "https://github.com/TanStack/ai/issues/282"
reactions: 0
comments: 1
---

# Anthropic Adapter does not always return valid JSON

### TanStack AI version

0.4.2

### Framework/Library version

bun 1.3.6

### Describe the bug and the steps to reproduce it

With some prompts you get malformed JSON so zod cannot validate it. However Anthropic itself offers structured outputs, we should use those insteadof forcing the LLM to use a tool for responding.

### Your Minimal, Reproducible Example - (Sandbox Highly Recommended)

none

### Screenshots or Videos (Optional)

_No response_

### Do you intend to try to help solve this bug with your own PR?

Yes, I am also opening a PR that solves the problem along side this issue

### Terms & Code of Conduct

...