---
number: 899
title: Detecting Partial Item Visibility in @tanstack/react-virtual Without Intersection Observer
category: Q&A
created: 2024-12-12
url: "https://github.com/TanStack/virtual/discussions/899"
upvotes: 1
comments: 1
answered: false
---

# Detecting Partial Item Visibility in @tanstack/react-virtual Without Intersection Observer

I'm working with @tanstack/react-virtual and want to implement a visibility-based animation mechanism where an item is considered "visible" even if just its first few pixels are in the viewport.
Current Approach
I've been exploring ways to determine item visibility directly within the virtualization library, specifically looking for a method that:

Works natively with react-virtual
Triggers when even a small portion of an item enters the view
Provides a reliable way to track partial visibility

Specific Questions

Is there a built-in method in react-virtual to detect partial item visibility?
Can the getVirtualItems() method or associated properties provide insights into partial viewport entry?
Are there any creative approaches within the library to track this without using Inte...

---

## Top Comments

**@piecyk** [maintainer] (+1):

Yes, on instance there is range property of type `{ startIndex: number; endIndex: number } | null` it can be used to detect what is visible. 