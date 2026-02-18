---
number: 2080
title: Unnecessary JS loaded due to inefficient tree-shaking
type: other
state: open
created: 2025-07-28
url: "https://github.com/unovue/reka-ui/issues/2080"
reactions: 22
comments: 2
---

# Unnecessary JS loaded due to inefficient tree-shaking

When importing one component e.g. `import { AspectRatio } from 'radix-vue'` in a barebone Vue app, it loads other irrelevant JS. Below is the unused JS based on Coverage Browser DevTools, where red is unused and gray is used.

<img width="2124" height="394" alt="Image" src="https://github.com/user-attachments/assets/736b410c-6ad9-47f9-ab4d-aa398508cd38" />

Vite recommend avoiding barrel imports. However, radix-vue v1 (and reka-ui v2) is using barrel imports which leads to vite's poor tree-shaking.

Is it possible to give the options to have a direct deep import e.g. `import { AspectRatio } from 'radix-vue/dist/AspectRatio'` so vite can tree-shake effectively and eliminate unused code, both during development and in build files? Currently, allowed exports are limited to `.` which is `import { ... } from radix-vue` and does not allow a more specific import

Alternatively, refactoring the barrel imports into deep exports can improve tree-shaking and dead code elimination a lot. This is better as developers can keep using `import { ... } from radix-vue` syntax and does not have to refactor into `import { moduleItem } from 'radix-vue/dist/{module}'` for reducing unused JS & faster page load.

I am using vite v5.2.8 & radix-vue v1.9.17. Tried upgrading to latest reka-ui but faced issues with unable to resolve alias for components in node_modules/reka-ui so I stay at radix-vue until reka-ui is mature enough.

---

## Top Comments

**@maxsolovev** (+4):

Any updates? 

**@Heartnett** (+3):

@zernonia @benjamincanac @cyyynthia @yyx990803 @atinux PING