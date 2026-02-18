---
number: 520
title: Random guid in xy-container clippath causes inconsistencies for DOM snapshot tests
type: other
state: open
created: 2025-01-14
url: "https://github.com/f5/unovis/issues/520"
reactions: 0
comments: 1
---

# Random guid in xy-container clippath causes inconsistencies for DOM snapshot tests

Seen in the `StackedBar` component, which gets a clippath id from `XYComponentCore`

https://github.com/f5/unovis/blob/main/packages/ts/src/containers/xy-container/index.ts#L51

I was adding DOM snapshot tests for a react page using `StackedBar` with react-testing-library snapshots and vitest, but a `clippath` id was different on every test run, so it would fail the snapshot comparison.

As a workaround you can mock `crypto.getRandomValues` that is used in the `guid` util function (https://github.com/f5/unovis/blob/main/packages/ts/src/utils/misc.ts#L6), but it would be good for snapshot testing to work out of the box and I don't know that these ids _need_ to be random guids.