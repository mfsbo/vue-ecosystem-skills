---
number: 4419
title: Report dead link while running vitepress
type: other
state: closed
created: 2024-12-12
url: "https://github.com/vuejs/vitepress/issues/4419"
reactions: 7
comments: 2
---

# Report dead link while running vitepress

### Is your feature request related to a problem? Please describe.

`vitepress build` will throw errors when there are dead links, but `vitepress dev` does not. This requires me to run `vitepress build` after renaming or deleting a file even when I'm running vitepress. My IDE tries to warn when I delete a file that's being referenced or updates links, but sometimes overlooks a file.

### Describe the solution you'd like

`vitepress dev` should immediately check for dead links and report them to the console after deleting or removing a file. This gives me instant feedback whether I have forgotten to update or delete a reference.

### Describe alternatives you've considered

_No response_

### Additional context

_No response_

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that asks for the same feature to avoid creating a duplicate.

---

## Top Comments

**@TheGreatRefrigerator**:

This is still an issue in 1.6.3

**@xbzhang2020**:

I encountered the same question twice. It's frustrating.