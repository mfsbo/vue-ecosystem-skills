---
number: 1570
title: Datepicker Pro input overflows and jumps when opening
type: bug
state: open
created: 2024-12-09
url: "https://github.com/formkit/formkit/issues/1570"
reactions: 1
comments: 0
labels: "[ bug,  priority-3, Pro, datepicker]"
---

# Datepicker Pro input overflows and jumps when opening

### Reproduction

https://formkit.link/e90a1a309630aa0b836cb40dcc336d1d

### Description  
The datepicker input is not positioning correctly. It overflows its parent container, causing visual glitches, overflow and sometimes jumps unexpectedly when interacting with it.

1. Click on the datepicker field located near the bottom of the page to open the calendar.  
2. Observe how the datepicker's position is rendered (overflowing its container or jumping).  

---

### Expected Behavior  
The datepicker input should:  
- Be properly aligned within its container.  
- Not overflow or "jump" when interacting.  
- Maintain consistent positioning in different screen sizes and environments.

---


### Additional Context/Screenshots  

---
![image](https://github.com/user-attac...