---
number: 167
title: "(bug): Date values becoming stale"
type: other
state: closed
created: 2025-02-22
url: "https://github.com/TanStack/store/issues/167"
reactions: 0
comments: 3
---

# (bug): Date values becoming stale

### Describe the bug

I noticed that Date values get stale between navigation (tanstack router) and their values lag behind, while their String representation is correct.

### Steps to Reproduce the Bug or Issue

1. Reproduction: https://stackblitz.com/edit/github-99msu7h8?file=src%2Froutes%2Findex.tsx
2. Note the `String Value` and `Date Value` labels in the preview
3. Note the `Date should be [date]` label below the horizontal rule
4. The home page sets the date to 22nd March 2025, the About page sets it to 17th March, 2025
5. The default Date value is `Fri Dec 31 1999`. You can see that on the initial page load the `String value` gets returned correctly from the `useState` hook, while the `Date value` remains the default (1999)
6. Start navigating between Home and About
7. You'll see th...