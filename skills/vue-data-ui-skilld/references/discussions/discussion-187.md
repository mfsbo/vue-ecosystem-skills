---
number: 187
title: Optimization Request for VueUiDonutEvolution Component - Label Overlapping and Zero-Value Handling
category: Q&A
created: 2025-04-08
url: "https://github.com/graphieros/vue-data-ui/discussions/187"
upvotes: 1
comments: 2
answered: true
---

# Optimization Request for VueUiDonutEvolution Component - Label Overlapping and Zero-Value Handling

Hello,

I'm encountering an issue with the VueUiDonutEvolution component when visualizing larger datasets. Specifically:

Label Overlapping: As the data set size increases, the labels/tags of smaller donut segments begin overlapping each other, significantly reducing readability.

Zero-Value Visibility: Segments with zero values are still being rendered, which adds unnecessary visual clutter.

Could you please advise if there are:

Built-in configuration options to prevent label overlapping (e.g., dynamic positioning, collision detection, or tooltip-only labels)

Methods to automatically hide zero-value segments

Recommended best practices for handling large datasets in this component?

Thank you for your guidance!

 which adds config options to hide labels under a given threshold.

This addresses the immediate overlapping issue, but is not a panacea solution. Ideally all labels should be able to be visible without overlap, which requires a rewrite with a collision detection algo. This would apply on all donuts of the library, I need to think about it. In the meantime I hope this fix helps you achieve a better result.