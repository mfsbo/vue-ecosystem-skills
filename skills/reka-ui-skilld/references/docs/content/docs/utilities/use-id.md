---
title: useId
description: Generate random id
---

# useId

<Callout type="warning" title="Deprecated">

Vue 3.5 released an official client-server stable solution for `useId`.

</Callout>

<Description>
Generate random id
</Description>

## Usage

```ts
import { useId } from 'reka-ui'

const buttonId = useId() // reka-1
```

```ts
import { useId } from 'reka-ui'

const buttonId = useId('test-id') // test-id
```
