---
tag: @tanstack/vue-virtual@3.13.13
version: 3.13.13
published: 2025-12-08
---

# @tanstack/vue-virtual@3.13.13

### Patch Changes

-   Fix: Notify framework when count changes to update getTotalSize() (#1085)

    Fixed an issue where `getTotalSize()` would return stale values when the `count` option changed (e.g., during filtering or search operations). The virtualizer now automatically notifies the framework when measurement-affecting options change, ensuring the UI updates correctly without requiring manual `useMemo` workarounds.

    **Before**: When filtering items, the list container would maintain its previous height, causing excessive blank space (when count decreased) or inaccessible items (when count increased).

    **After**: Height updates automatically when count changes, providing the correct user experience.

    This fix applies to all framework adapters and has minimal performance impact (< 0.1ms per change).

-   Updated dependencies \[`2542c5a`, `96e32a6`]:
    -   @tanstack/virtual-core@3.13.13
