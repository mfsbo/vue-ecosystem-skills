---
number: 150
title: Showing all tick labels in ordinal bar chart
category: Q&A
created: 2023-02-28
url: "https://github.com/f5/unovis/discussions/150"
upvotes: 1
comments: 1
answered: true
---

# Showing all tick labels in ordinal bar chart

Hi, I'm using unovis in my SvelteKit application because it's the best looking graphing library out there :)

I'm trying to format my timeseries data in stacked graphs so I've parsed my data into ticks going from 0 -> x with human readable times being stored in a seperate array to do ordinal labels (case 2 of the guide). This works perfectly for when there's 3 bars on the screen, for example:

<img width="300" alt="image" src="https://user-images.githubusercontent.com/30081702/221926015-dcf366f3-6001-41de-97d8-d77ed1f867fd.png">

The problem is that half of the labels vanish when 4 or more items appear:

<img width="300" alt="image" src="https://user-images.githubusercontent.com/30081702/221926225-6be8cd6b...

---

## Accepted Answer

Hi @Owez, thanks for choosing Unovis!

You can specify the exact tick values for `Axis` using the `tickValues` property. Here's the section in the docs about it: https://unovis.dev/docs/auxiliary/Axis/#set-ticks-explicitly. In your case `tickValues` should be equal to `graphData.map(d => d.x)`, if I understood your code correctly.