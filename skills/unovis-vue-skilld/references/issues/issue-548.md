---
number: 548
title: VisArea gradient doesn't work properly with non-zero yDomain
type: other
state: open
created: 2025-04-02
url: "https://github.com/f5/unovis/issues/548"
reactions: 1
comments: 4
---

# VisArea gradient doesn't work properly with non-zero yDomain

When using a custom `yDomain` that doesn't start at zero, the gradient in `VisArea` component doesn't render properly. The background gradient seems to be calculated from `y=0` rather than from the minimum value in the yDomain.

### Minimal reproduction (Vue):

```vue
<template>
  <VisXYContainer :data="data" : svg-defs="svgDefs" :y-domain="[145, undefined]">
    <VisLine :x="d => d.x" :y="d => d.y" />
    <VisArea :x="d => d.x" :y="d => d.y" color="url(#gradient)" />
  </VisXYContainer>
</template>

<script setup>
const svgDefs = `
  <linearGradient id="gradient" gradientTransform="rotate(90)">
    <stop offset="0%" stop-color="#3366FF" stop-opacity="1" />
    <stop offset="100%" stop-color="#3366FF" stop-opacity="0" />
  </linearGradient>
`;

...