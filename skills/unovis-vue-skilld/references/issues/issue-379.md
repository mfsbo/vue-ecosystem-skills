---
number: 379
title: Multiple XY components and Svelte 5
type: other
state: open
created: 2024-04-30
url: "https://github.com/f5/unovis/issues/379"
reactions: 5
comments: 5
---

# Multiple XY components and Svelte 5

I know Svelte 5 is still in RC but interesting finding(?) nonetheless. Or Not. Multiple XY components in the XY container crashes my application at least:

```svelte
<VisXYContainer
  {data}
  margin={{ left: 5, right: 5, top: 5, bottom: 5 }}
  height="100"
>
  <VisLine {x} {y} lineWidth={2} color="#80808080" />
  
  
</VisXYContainer>
```

Same code works in Svelte 4.

---

## Top Comments

**@lee00678** [maintainer] (+2):

@xmlking @david-plugge @hewliyang @Magnus-Ignitic 
Just release a beta version for the Svelte 5 fix 1.5.0-beta.3. Please feel free to test it out, and let us know if there is anything we've missed. Link https://github.com/f5/unovis/issues/484



**@lee00678** [maintainer]:

@hewliyang @Magnus-Ignitic, thanks for bringing this up. We are looking into this issue. Hopefully we can include a fix in our next release. 

**@hewliyang** (+1):

Any updates on Svelte 5 support? Seems that an example like this just causes an out of memory error on the browser