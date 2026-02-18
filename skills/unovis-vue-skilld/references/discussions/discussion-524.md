---
number: 524
title: Tooltip for TopoJSON Map Areas?
category: Q&A
created: 2025-01-23
url: "https://github.com/f5/unovis/discussions/524"
upvotes: 1
comments: 1
answered: true
---

# Tooltip for TopoJSON Map Areas?

I've recently become a fan of Unovis, but am struggling to understand whether I can't find the information, or that this functionality is not existent: How can I activate tooltips for MapArea objects?

Using Vue I tried to embed `TopoJSONMap` :
```javascript
import { TopoJSONMap } from '@unovis/ts'
```
and then set the triggers:
```javascript
const triggers = { [TopoJSONMap.selectors.MapArea]: d => d.data }
```
I'm aware MapArea is not correct here, but couldn't find how to get the right selector, as there seem to be none for Areas?




---

## Accepted Answer

**@lee00678** [maintainer]:

Hi @jojugaad, I think what you are looking for is `feature`