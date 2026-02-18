---
number: 244
title: "Stacked Bar: De-emphasize one of the bars?"
category: Q&A
created: 2023-07-05
url: "https://github.com/f5/unovis/discussions/244"
upvotes: 1
comments: 1
answered: true
---

# Stacked Bar: De-emphasize one of the bars?

Hello,

I have a horizontal stacked bar chart with 3 bars. I'd like one of the bars (rightmost) to be de-emphasized as it is less important. One idea I had was to make the fill of the particular bar transparent with only a border. Another idea would be to have just a point marking the extent of the particular bar, instead of a bar. Are either of these feasible? Any other ideas?

---

## Accepted Answer

Thanks, this led me in the right direction. I actually needed to modify the individual stacked bars and, using something similar to your response I was able to do it:

```
[StackedBar.selectors.bar]: {
    fade: (d, i) => {
       if (i % 3 === 2) {
          return '';
       } else {
          return null;
       }
    }
 },
```