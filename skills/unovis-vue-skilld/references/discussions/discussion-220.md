---
number: 220
title: Plotting Datetime data
category: Q&A
created: 2023-06-02
url: "https://github.com/f5/unovis/discussions/220"
upvotes: 1
comments: 1
answered: true
---

# Plotting Datetime data

Hey team,

does unovis support plotting datetime data where the x-axis behaves similar to numeric values? I want to use bar charts, where the x-axis represents the time axis and the y-axis represents counts. I was wondering if unovis has this "intelligent" tick behavior not only for numeric values but datetime values as well.

Thanks,
Pietz

---

## Accepted Answer

Yes, it's possible. By default, Unovis treats `Date` values or timestamps as regular numbers. I also recommend to use `Scale.scaleTime()` for your x-axis to make it produce nicer ticks, like in this example:

<img width="707" alt="image" src="https://github.com/f5/unovis/assets/755708/97da74e6-3581-42a3-a29c-88874ff61877">