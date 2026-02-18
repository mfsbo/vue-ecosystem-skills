---
number: 554
title: Unoviz 1.5.1 breaks Leaflet 1.9.4 path layer due to z-index
type: other
state: open
created: 2025-04-19
url: "https://github.com/f5/unovis/issues/554"
reactions: 0
comments: 0
---

# Unoviz 1.5.1 breaks Leaflet 1.9.4 path layer due to z-index

When adding Unoviz 1.5.1 to a project using Leaflet 1.9.4 it breaks the path rendering by defining `z-index: 1`, which overrides a higher `z-index` value of Leaflet.

Result: paths are not visible.

Problematic style: https://github.com/f5/unovis/blob/1.5.1/packages/ts/src/components/leaflet-map/leaflet.css#L96

It was globally injected from here: https://github.com/f5/unovis/blob/1.5.1/packages/ts/src/components/leaflet-map/style.ts#L9

You should not do that or use more specific selectors or allow consumers to disable the Leaflet functionality.


