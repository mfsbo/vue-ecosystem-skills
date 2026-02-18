---
number: 615
title: "Graph: how to disable panel label trimming"
category: Q&A
created: 2025-08-07
url: "https://github.com/f5/unovis/discussions/615"
upvotes: 1
comments: 2
answered: false
---

# Graph: how to disable panel label trimming

Hello!

I'm looking for help with graph panels. 

So, we have an ability to switch off node label's trim with the `nodeLabelTrim: false` setting. However I did not find an option to switch off trimming behaviour for labels of panels.

Is it a way to do this?

Thanks!

---

## Top Comments

**@lee00678** [maintainer] (+1):

Hi @restereo, I don't think that's currently supported. We are open for contributions! 

**@rokotyan** (+1):

@lee00678 @restereo We do support it, actually. I added it earlier this year https://github.com/f5/unovis/commit/8030adf2088e314fe1a3544c0116c08c98ee0f11.

You can set the `labelTrimLength` property of `GraphPanelConfig` to a large number to effectively disable trimming.