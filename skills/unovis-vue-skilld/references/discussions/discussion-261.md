---
number: 261
title: Possibility of multiple x / y axes
category: Q&A
created: 2023-08-09
url: "https://github.com/f5/unovis/discussions/261"
upvotes: 1
comments: 2
answered: true
---

# Possibility of multiple x / y axes

It would be nice if it was possible to have multiple x / y axes.

Especially when it comes to composing charts with differing scales. 

---

## Accepted Answer

@mirshko Currently we've no plans for adding dual-axis support since they can easily be misused.

However, if you really need to have a dual axis chart, you can achieve that by overlaying two XY Containers with manual margin configuration (`autoMargin` set to `false`, `margin` set to accommodate your axes). Here's a React example:
```jsx
   ...
  const margin = { left: 60, right: 60, top: 40, bottom: 40 }
  const style = { position: 'absolute', top: 0, left: 0, width: '100%', height: '40vh' }
  return (<>
    <VisXYContainer data={data} margin={margin} autoMargin={false} style={style}>
      <VisArea x={d => d.x} y={d => d.y} />
      <VisAxis type='x' />
      <VisAxis type='y' />
    </VisXYContainer>
    <VisXYContainer data={data} margin={margin} autoMargin={false} style={{ ...style, '--vis-axis-tick-label-color': '#FF6B7E' }}>
      <VisLine x={d => d.x} y={d => d.y2} color= '#FF6B7E' />
      <VisAxis type='y' position='right' gridLine={false} />
    </VisXYContainer>
  </>)
```...