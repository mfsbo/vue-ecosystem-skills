---
number: 22
title: Cannot find module 'vue-data-ui' or its corresponding type declarations. ts-plugin(2307)
category: Q&A
created: 2024-05-09
url: "https://github.com/graphieros/vue-data-ui/discussions/22"
upvotes: 1
comments: 1
answered: true
---

# Cannot find module 'vue-data-ui' or its corresponding type declarations. ts-plugin(2307)

hello,
i using quesar framework and when i import vue-data-ui i getting this bellow error

how can i import this library type declarations

---

## Accepted Answer

**@graphieros** [maintainer]:

Hey :)

You can upgrade to `v2.1.38` or latest which solves this problem without having to copy the .d.ts file.

With prior versions you need to copy paste into your project the vue-data-ui.d.ts file, located in the package inside the types folder, which contains all the type declarations.

Cheers