---
number: 1540
title: "[Bug]: Dialog / Sheet should NOT add `pointer-events: none` to body tag when opened"
type: question
state: open
created: 2024-11-28
url: "https://github.com/unovue/reka-ui/issues/1540"
reactions: 5
comments: 9
labels: "[question]"
---

# [Bug]: Dialog / Sheet should NOT add `pointer-events: none` to body tag when opened

### Reproduction

https://stackblitz.com/run?file=src%2FApp.vue

### Describe the bug

(Would actually like a "Discussion" tag as this isn't really a _bug_)

Both the Dialog and Sheet components are setting `pointer-events: none` to the body tag when opened. This prevents using things like lightboxes above the Sheet, or emoji pickers inside of a Dialog. I've had numerous issues with this already and just now realized the cause of the issue.

I don't think it's necessary to set this on the body tag and would likely be better not to due to these issues.
If there are edge cases, users can simply add a `z-index` to solve the vast majority of issues.

Would like to see some discussion about this and find a better way to cover whatever reasons there were when this was first added.

For now, I'm just manually removing it as needed, but the issue isn't at first obvious and could cause a lot of wasted time for devs.




### System Info

```bash
"nuxt": "^3.14.1592",
"radix-vue": "^1.9.10",
"shadcn-nuxt": "^0.10.4"
```


### Contributes

- [ ] I am willing to submit a PR to fix this issue
- [ ] I am willing to submit a PR with failing tests