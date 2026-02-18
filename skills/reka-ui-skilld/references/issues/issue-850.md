---
number: 850
title: "[Bug]: Multiple tooltips displayed at once because of grace area"
type: bug
state: closed
created: 2024-04-15
url: "https://github.com/unovue/reka-ui/issues/850"
reactions: 9
comments: 0
labels: "[bug]"
---

# [Bug]: Multiple tooltips displayed at once because of grace area

### Environment

```bash
Stackblitz, edited from the docs at the time of writing: https://stackblitz.com/edit/gvosea?file=src%2FApp.vue
```


### Link to minimal reproduction

https://stackblitz.com/edit/gvosea?file=src%2FApp.vue

### Steps to reproduce

1. Have multiples tooltips with no open delay
2. Hover left trigger from the bottom (to create the widest possible triangle for the grace area)
3. Move slowly to the top right until it reaches the right trigger, but still in the first triangle

### Describe the bug

The second tooltip is displayed, but the first one is still visible

### Expected behavior

Not sure which one should be visible, but only one at once should be there :)

It seems almost impossible to achieve in real life with the reproduction, but in our application there is a case where it happens all the time (can't share sorry).

### Context & Screenshots (if applicable)

Demo:
https://github.com/radix-vue/radix-vue/assets/645641/9e429b06-f410-4236-9cc2-5b742e38d582

Seems like it's been fixed for other primitives already: https://github.com/radix-vue/radix-vue/commit/75748c60