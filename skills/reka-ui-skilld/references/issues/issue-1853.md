---
number: 1853
title: "[Bug]: Combobox item highlighting lost when populating from ajax search"
type: bug
state: closed
created: 2025-04-25
url: "https://github.com/unovue/reka-ui/issues/1853"
reactions: 6
comments: 1
labels: "[bug]"
---

# [Bug]: Combobox item highlighting lost when populating from ajax search

### Environment

```bash
Node version: 22.13.1
Reka UI version: 2.2.0
Vue version: 3.4.27
CSS framework: tailwindcss@4.0.17
Client OS: MacOS 14.2
Browser: Arc 1.91.0
```

### Link to minimal reproduction

https://stackblitz.com/edit/9c4y9ocg?file=src%2FApp.vue

### Steps to reproduce

In the StackBlitz sandbox example, you'll see I've simulated an ajax search that takes a little bit of time to return with results.

- From no results state, type in the letter `a`. You'll notice it will find results, but the first option will not be highlighted yet. But if you continue typing `apple`, it'll then highlight the result that was populated from the previously simulated ajax search (of `a`)...

    

- If you type `apple` really fast before the simulated ajax search returns any results, you'll notice the same issue, where it won't be able to highlight a result, if the previous combobox state was empty...

    

### Describe the bug

When the Combobox options are all hardcoded, there is no issue. However, when the Combobox options are dynamically computed, it seems Combobox is trying to highlight too soon before the computed options are rendered to DOM.

...