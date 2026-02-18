---
number: 2257
title: Highlight active sidebar item when child page is loaded
type: other
state: open
created: 2023-04-19
url: "https://github.com/vuejs/vitepress/issues/2257"
reactions: 9
comments: 7
---

# Highlight active sidebar item when child page is loaded

### Is your feature request related to a problem? Please describe.

Not every page in my docs should be in the sidebar. For example having a top-level page "Learn to do X" and that page pointing to variants with different technologies. 

If the sidebar has /guide and I visit /guide, then the sidebar item for the route is highlighted with an active state. If I visit /guide/subpage, it does not. 

This makes it hard for users to know where they are on a website, and does not auto-expand the section they are in.

### Describe the solution you'd like

Either behavior that child pages make the parent page active in the sidebar, or provided as an option.

### Describe alternatives you've considered

_No response_

### Additional context

_No response_

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that asks for the same feature to avoid creating a duplicate.