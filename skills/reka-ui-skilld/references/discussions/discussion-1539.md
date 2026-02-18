---
number: 1539
title: How to set 'active' state on NavigationMenuLink when using client side routing
category: Q&A
created: 2025-01-03
url: "https://github.com/unovue/reka-ui/discussions/1539"
upvotes: 3
comments: 0
answered: false
---

# How to set 'active' state on NavigationMenuLink when using client side routing

The documentation recommends to wrap `RouterLink` inside `NavigationMenuLink` like so:


```vue
<NavigationMenuLink as-child>
  <RouterLink to="/">
    Home
  </RouterLink>
</NavigationMenuLink>
```

but that doesn't allow to read the `isActive` slot prop from `RouterLink` and pass it to the `NavigationMenuLink` in order to get the `aria-current` and `data-active` attributes set correctly.

normally, `RouterLink` would set the `aria-current` correctly - but due to attribute inheritance from `NavigationMenuLink`'s `Primitive`, this gets [overwritten](https://github.com/unovue...