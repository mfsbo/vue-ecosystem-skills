---
number: 1280
title: "[Bug]: Blocked aria-hidden on a <input> element"
type: bug
state: open
created: 2024-08-23
url: "https://github.com/unovue/reka-ui/issues/1280"
reactions: 14
comments: 13
labels: "[bug]"
---

# [Bug]: Blocked aria-hidden on a <input> element

### Reproduction

Blocked aria-hidden on a <input> element

### Describe the bug

When I click on the Combobox, something like this will appear in the console
There is a similar situation in the console of https://www.shadcn-vue.com/docs/components/combobox

Blocked aria-hidden on a <input> element because the element that just received focus must not be hidden from assistive technology users. Avoid using aria-hidden on a focused element or its ancestor. Consider using the inert attribute instead, which will also prevent focus. For more details, see the aria-hidden section of the WAI-ARIA specification at https://w3c.github.io/aria/#aria-hidden. 


### System Info

```bash
window : window 11 23H2
Chrome : 128.0.6613.114
```


### Contributes

- [ ] I am willing to submit a PR to fix this issue
- [ ] I am willing to submit a PR with failing tests

---

## Top Comments

**@han1548772930** (+2):


https://github.com/user-attachments/assets/6861b36a-a419-4ede-823b-e576a6f4cd05



**@sadeghbarati** [maintainer]:

https://discord.com/channels/1121805548782878813/1121805549621743658/1276045976301473824

**@zernonia** [maintainer]:

Does this issue still happening? I tried to replicate it but not seeing the error 