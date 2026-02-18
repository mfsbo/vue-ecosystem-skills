---
number: 204
title: "Bar Chart: Labels"
category: Q&A
created: 2023-05-18
url: "https://github.com/f5/unovis/discussions/204"
upvotes: 1
comments: 4
answered: true
---

# Bar Chart: Labels

Hello, I have a horizontal bar chart and wish to add labels on each individual bar (towards the end) with some extra data. You can see what I mean here. 

Is this possible in Unovis? Sorry if I missed it somewhere.

---

## Accepted Answer

@errantmind Yes, you can achieve that by using the `XYLabels` component. We don't have docs for it yet, but here's a brief code snippet for React to give you an example:
```jsx
<VisXYContainer>
  <VisStackedBar data={data} x={d => d.x} y={accessors} />
  <VisXYLabels
    data={data}
    y={d => d.y / 2}
    x={d => d.x}
    label={d => `${d.y.toFixed(1)} bps`}
  />
  <VisAxis type='x' numTicks={10}/>
  <VisAxis type='y' tickFormat={(y: number) => `${y}bps`}/>
</VisXYContainer>
```

<img width="1048" alt="image" src="https://github.com/f5/unovis/assets/755708/fb13be5a-81ba-44a8-bde5-aced602e72e4">
