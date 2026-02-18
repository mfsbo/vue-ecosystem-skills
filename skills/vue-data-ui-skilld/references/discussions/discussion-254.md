---
number: 254
title: Is there any way to implement this?
category: Q&A
created: 2025-09-22
url: "https://github.com/graphieros/vue-data-ui/discussions/254"
upvotes: 1
comments: 3
answered: true
---

# Is there any way to implement this?

<img width="174" height="99" alt="image" src="https://github.com/user-attachments/assets/6a24ef22-34d9-49cd-8a47-c4b0f773faaf" />

Some of our chart need to transform as 3d style.

---

## Accepted Answer

**@graphieros** [maintainer]:

@adoin 

You can upgrade to 3.2.1, which implements a 3d mode for `VueUiWheel`

The rendering is consistent with the spirit of the classic layout, therefore the style will not match your screenshot, which style is very specific and would not be 'universal' for this library. I hope this is a decent compromise for your use case.

https://github.com/user-attachments/assets/cdf09dd5-5ce4-4101-be83-bc2d61beb583

New config attributes:

```js
const config = ref({
  layout: "3d", // New. Default: 'classic' (previous behavior)
  style: {
    chart: {
      layout: {
        wheel: {
          tiltAngle3d: 50, // New. Default: 50, used in 3d mode
        },
        percentage: {
          offsetX: 0, // New. Default: 0
          offsetY: 0, // New. Default:  0
          stroke: 'transparent', // New. Default: 'transparent', apply border color on the label
          strokeWidth: 0, // New. Default:  0
        }
      }
    }
  }
})
```...