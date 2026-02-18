# @tanstack/vue-virtual

## 3.13.18

### Patch Changes

- Updated dependencies [`9067574`]:
  - @tanstack/virtual-core@3.13.18

## 3.13.17

### Patch Changes

- Updated dependencies [`21d9a46`]:
  - @tanstack/virtual-core@3.13.17

## 3.13.16

### Patch Changes

- Updated dependencies [`db6df21`]:
  - @tanstack/virtual-core@3.13.16

## 3.13.15

### Patch Changes

- Updated dependencies [`5a273bf`]:
  - @tanstack/virtual-core@3.13.15

## 3.13.14

### Patch Changes

- Updated dependencies [`6d9274c`]:
  - @tanstack/virtual-core@3.13.14

## 3.13.13

### Patch Changes

- Fix: Notify framework when count changes to update getTotalSize() (#1085)

  Fixed an issue where `getTotalSize()` would return stale values when the `count` option changed (e.g., during filtering or search operations). The virtualizer now automatically notifies the framework when measurement-affecting options change, ensuring the UI updates correctly without requiring manual `useMemo` workarounds.

  **Before**: When filtering items, the list container would maintain its previous height, causing excessive blank space (when count decreased) or inaccessible items (when count increased).

  **After**: Height updates automatically when count changes, providing the correct user experience.

  This fix applies to all framework adapters and has minimal performance impact (< 0.1ms per change).

- Updated dependencies [`2542c5a`, `96e32a6`]:
  - @tanstack/virtual-core@3.13.13

## 3.13.12

### Patch Changes

- Updated dependencies [`d21ed98`]:
  - @tanstack/virtual-core@3.13.12

## 3.13.11

### Patch Changes

- Updated dependencies [`73fa867`]:
  - @tanstack/virtual-core@3.13.11

## 3.13.10

### Patch Changes

- Updated dependencies [`b3b7e7d`]:
  - @tanstack/virtual-core@3.13.10

## 3.13.9

### Patch Changes

- Updated dependencies [`9e33cdb`]:
  - @tanstack/virtual-core@3.13.9

## 3.13.8

### Patch Changes

- Updated dependencies [`60719f6`]:
  - @tanstack/virtual-core@3.13.8

## 3.13.7

### Patch Changes

- Updated dependencies [`e2d93c2`]:
  - @tanstack/virtual-core@3.13.7

## 3.13.6

### Patch Changes

- Updated dependencies [`042616f`]:
  - @tanstack/virtual-core@3.13.6

## 3.13.5

### Patch Changes

- Updated dependencies [`51656d9`]:
  - @tanstack/virtual-core@3.13.5

## 3.13.4

### Patch Changes

- Updated dependencies [`514b62d`, `f03d814`]:
  - @tanstack/virtual-core@3.13.4

## 3.13.3

### Patch Changes

- Updated dependencies [`02ef309`]:
  - @tanstack/virtual-core@3.13.3
