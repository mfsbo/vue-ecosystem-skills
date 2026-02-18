---
number: 199
title: "[Enhancement] : Add transparent error recovery for state updates and derived computations"
category: Q&A
created: 2025-05-29
url: "https://github.com/TanStack/store/discussions/199"
upvotes: 1
comments: 0
answered: false
---

# [Enhancement] : Add transparent error recovery for state updates and derived computations

## Problem

Currently, errors in `setState` or derived computations cause the entire update chain to halt, potentially leaving the application in an inconsistent state

```typescript
// If updater throws, state becomes inconsistent
setState = (updater: TUpdater) => {
  this.prevState = this.state
  this.state = (updater as any)(this.prevState) // 🚨 throws, state corrupted
  this.options?.onUpdate?.() // never called
  __flush(this as never) // never called
}

// If computation throws, entire dependency chain stops
recompute = () => {
  this.state = this.options.fn({ ... }) // 🚨 throws, chain halts
}
```

## How other libraries handle this

### Zustand

```typescript
// By default, the error is thrown as is
const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => {
    if (someCondition) {
      throw new Error("Update failed") // 🚨 throw as is
    }
    return { count: state.count + 1 }
  })
}))

// Error handling with middleware
const useStore = create(
  devtools(
    (set) => ({ ... }),
    { 
      name: "store",
      onError: (error) => console.error(error) // Only error logging
    }
  )
)
```...