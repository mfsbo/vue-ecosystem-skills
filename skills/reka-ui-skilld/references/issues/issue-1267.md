---
number: 1267
title: "[Feature]: use vue 3.5 `useId`"
type: other
state: closed
created: 2024-09-04
url: "https://github.com/unovue/reka-ui/issues/1267"
reactions: 13
comments: 9
---

# [Feature]: use vue 3.5 `useId`

### Describe the feature

Since vue released 3.5 and has a ssr friendly useId, would be better to switch to it.

I can think something like this for backward compatibility

```ts
import * as v from 'vue';

// @ts-expect-error vue 3.5
if (v.useId) {
  // @ts-expect-error vue 3.5
  return v.useId();
}
```

### Additional information

- [ ] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.

---

## Top Comments

**@RayGuo-ergou** (+4):

Did a quick test

```js
// index.js

import * as util from './util'

util.foo()

```

```js
// util.js

function foo() {
  console.log('foo')
}
function bar() {
  console.log('bar')
}

export {
  bar,
  foo,
}
```

run `pnpx rollup index.js -f esm -o bundle.js`

get

```bash
cat bundle.js
───────┬──────────────────────────────────────────────────────────────────────────────────────────────────────────────────
       │ File: bundle.js
───────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1   │ function foo() {
   2   │   console.log('foo');
   3   │ }
   4   │
   5   │ foo();
```...

**@zernonia** [maintainer]:

Correct @RayGuo-ergou . Your suggestion here should eliminate the need of passing `idFunction` in Nuxt 3.13.1 onwards, and hence avoiding the ts error above 

**@RayGuo-ergou**:

The `ConfigProvider` is still required unless migrated vue's `useId` in this lib.

The error you see is because muxt changed their `useId` to be an alias of vue's. And it could be undefined if not in an instance ~~(e.g. toast)~~ so you have to handle it yourself.

update: toast is fine, the id was not from `radix-vue`, thus IMO in most case it should be defined.