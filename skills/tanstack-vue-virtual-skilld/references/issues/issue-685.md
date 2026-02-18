---
number: 685
title: Rendering lag when using virtualised for both rows and columns along with Tanstack/table
type: other
state: open
created: 2024-03-04
url: "https://github.com/TanStack/virtual/issues/685"
reactions: 28
comments: 29
---

# Rendering lag when using virtualised for both rows and columns along with Tanstack/table

### Describe the bug

I'm currently using table + virtual in this example here:

I had the same performance issue (facing frame loss) while scorlling. Many will say its MUI, Chakra, Mantine issue and if you use native html elements directly it goes away, but I wonder, why then using https://github.com/bvaughn/react-window I do not face any performance issue

This for sure its a Tanstack virtual issue and has to be addressed, because the point to use virtualisation is to prevent frame loss or performance issues :D 

**@Muhammad-bK** (+5):

I am using Material React Table which uses TanStack Virtual for virtualization and I am experiencing this same problem

**@romlacerda** (+4):

> > Any solution???
> 
> @romlacerda is this happening more?
> 
> @danprat92 can you update virtual to latest, or covert the example to https://stackblitz.com/

@piecyk 
Unfortunately, yes.