---
number: 166
title: Histogram Plot
category: Q&A
created: 2023-03-24
url: "https://github.com/f5/unovis/discussions/166"
upvotes: 1
comments: 2
answered: true
---

# Histogram Plot

Hi there,

is it currently possible to create a histogram plot, where a bar represents a range of values?

For reference: https://plotly.com/python/histograms/

---

## Accepted Answer

@pietz You can create histograms using the Stacked Bar component; or using Area with the `curveType` property set to `'step'`:
<img width="909" alt="image" src="https://user-images.githubusercontent.com/755708/227635577-a0ca6db9-3ae1-494e-a9bb-5b2c06471fe3.png">

You'll need to bin your data yourself though.