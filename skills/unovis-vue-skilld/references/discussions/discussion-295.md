---
number: 295
title: vue bundle size + ~2MB
category: Q&A
created: 2023-10-23
url: "https://github.com/f5/unovis/discussions/295"
upvotes: 1
comments: 6
answered: true
---

# vue bundle size + ~2MB

```ts
<script lang="ts" setup>
import { VisLine, VisScatter, VisXYContainer } from '@unovis/vue'

definePageMeta({
  middleware: ['protected'],
})

type Data = typeof data[number]
const data = [
  { revenue: 10400, subscription: 240 },
  { revenue: 14405, subscription: 300 },
  { revenue: 9400, subscription: 200 },
  { revenue: 8200, subscription: 278 },
  { revenue: 7000, subscription: 189 },
  { revenue: 9600, subscription: 239 },
  { revenue: 11244, subscription: 278 },
  { revenue: 26475, subscription: 189 },
]

const lineX = (d: Data, i: number) => i
const lineY = (d: Data) => d.revenue
</script>

<template>
  <div>
    <h1>Home</h1>
    <div class="w-[500px]">
      <VisXYContainer height="280px" :data="data">
        <VisLine :x="lineX" :y="lineY" :line-width="5" />
        <VisScatter :x="lineX" :y="lineY" :size="6" stroke-color="#fff" :stroke-width="2" color="white" />
      </VisXYContainer>
    </div>
  </div>
</template>

```...

---

## Accepted Answer

I believe it has something to do with nitro bundling all the dependencies for `@unovis/vue` in order to serve from server-side.

As suggested by @sadeghbarati , you should wrap the component as `ClientOnly`. (This applies to other charting library).

And thanks to the stackblitz provided by @sadeghbarati , can confirmed Nuxt does tree-shake properly.
Here's the Client bundle stats.



@rokotyan  we can close this issue as irrelevant. 