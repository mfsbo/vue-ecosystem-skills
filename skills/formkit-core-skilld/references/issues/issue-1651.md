---
number: 1651
title: "PRO: Unit display-locale de not working properly if unitless"
type: bug
state: open
created: 2025-06-06
url: "https://github.com/formkit/formkit/issues/1651"
reactions: 3
comments: 1
labels: "[ bug, Pro]"
---

# PRO: Unit display-locale de not working properly if unitless

### Reproduction

https://formkit.link/6ab9cdf4d66215ca6ddd4ba477bb3f54

### Describe the bug

If 
- the unit input has no unit given (like described here https://formkit.com/inputs/unit#unitless) 
- **and** the display-locale is set to "de"
- **and** min-decimals is not set or 0
- **and** the value already has at least 4 digits (either entered manually or given in the value attribute) 

Then, on entering the next digit, the thousands separator (in German that's the point) is interpreted as the decimal separator (in German that's the comma) and everything is cut off after the second digit after the decimal separator.

...

---

## Top Comments

**@lazercaveman**:

Same issue here