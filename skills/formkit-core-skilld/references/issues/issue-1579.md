---
number: 1579
title: It is not possible to enter the year
type: bug
state: open
created: 2024-12-18
url: "https://github.com/formkit/formkit/issues/1579"
reactions: 1
comments: 0
labels: "[ bug,  priority-2, Pro]"
---

# It is not possible to enter the year

### Reproduction

https://formkit.com/inputs/datepicker

### Describe the bug

Reproduction https://formkit.com/inputs/datepicker -> first example -> enter format="DD/MM/YYYY"

It is not always possible to enter a year, for example 1988.
Watch screen recording for understanding - Samsung Galaxy A55 screencast 
https://github.com/user-attachments/assets/0c9ea880-6682-459c-8df3-8242001df102
https://drive.google.com/file/d/168EbZrfRZ0yUealP3X_L0M-0gDU4CdXA/view?usp=sharing

On the Samsung Galaxy A04s device, using Chrome browser, it was not possible to enter the year at all.

My timezone https://www.timeanddate.com/worldclock/ukraine/kyiv

To avoid the issue [formkit/formkit#1447](https://gi...