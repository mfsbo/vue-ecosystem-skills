---
number: 2201
title: How to animate a Toast exit without force mount
category: Q&A
created: 2025-10-02
url: "https://github.com/unovue/reka-ui/discussions/2201"
upvotes: 3
comments: 0
answered: false
---

# How to animate a Toast exit without force mount

I'm currently having issues with the Toast component because it closes without any exit animation. The only way I make it works is by forcing the mounting of the `ToastRoot` component like : 
```html
<Toast.Root v-model:open="open" force-mount>
    <Transition
      enter-active-class="ease-out duration-300"
      enter-from-class="translate-x-full"
      enter-to-class="translate-x-0"
      leave-active-class="ease-in duration-300"
      leave-from-class="translate-x-0"
      leave-to-class="translate-x-full"
    >
      <div
        v-if="open"
        class="
          pointer-events-auto w-full max-w-sm overflow-hidden rounded-lg
          bg-white shadow-lg ring-1 ring-black/5
          dark:bg-gray-700
        "
      >
```

But I would prefer it to work without ...