---
number: 160
title: Date store not synced properly when using a selector
type: other
state: closed
created: 2025-01-19
url: "https://github.com/TanStack/store/issues/160"
reactions: 1
comments: 2
---

# Date store not synced properly when using a selector

### Describe the bug

given this store:
```ts
import { Store } from '@tanstack/react-store';

export const RootState = new Store({
    selectedDay: new Date(),
});
```
`a` is refreshed but `b` is not
```ts
export function DatePicker() {
  const a = useStore(RootState);
  const b = useStore(RootState, (s) => s.selectedDay);
  // ...
}
```

---

@thazlett16 said on discord:

> I'm guessing this has to do with the shallow compare:
> https://github.com/TanStack/store/blob/main/packages/react-store/src/index.ts#L34
> 
> I know in Redux they generally recommend storing dates in a serializeable format like the string form (RFC 3339, ISO 8601 etc)

### Steps to Reproduce the Bug or Issue

example here: https://stackblitz.com/edit/tanstack-store-thn7c7az?file=src%2Findex.tsx

...