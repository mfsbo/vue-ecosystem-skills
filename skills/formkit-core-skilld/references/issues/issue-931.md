---
number: 931
title: Invalid TypeScript types for custom element slots
type: docs
state: open
created: 2023-09-05
url: "https://github.com/formkit/formkit/issues/931"
reactions: 1
comments: 2
labels: "[ documentation]"
---

# Invalid TypeScript types for custom element slots

### Reproduction

https://github.com/jf908/formkit-repro

### Describe the bug

I tried following the docs for typing custom elements but the slot types always come out as `never`.

You can see the type error this produces by running `npm run typecheck` on the reproduction repo.

The type is almost identical to the docs:

```ts
declare module '@formkit/inputs' {
  interface FormKitInputSlots<Props extends FormKitInputs<Props>> {
    'test-text': FormKitBaseSlots<Props> & {
      slotName: FormKitFrameworkContext & {
        fooBar: string;
      };
    };
  }
}
```

and this is how it's being used in Vue:

```vue
<FormKit type="test-text">
  <template #slotName="{ fooBar }">{{ fooBar.toUpperCase() }}</template>
</FormKit>
```...