---
number: 2389
title: "[Feature]: Add month & year view modes to <Calendar> component"
type: other
state: open
created: 2026-01-09
url: "https://github.com/unovue/reka-ui/issues/2389"
reactions: 6
comments: 1
---

# [Feature]: Add month & year view modes to <Calendar> component

### Describe the feature

The current Calendar component supports only day-level selection.
To build common UI patterns (MonthPicker, YearPicker, DateRange presets), we need additional view modes.

View modes:
view: 'day' | 'month' | 'year'

Events:
@month-select(month: number)
@year-select(year: number)

Example: https://primevue.org/datepicker/#monthpicker

Proposed minimal implementation:
- Add internal month grid (12 items)
- Add internal year grid (e.g. 12–20 years)

Thanks for considering this enhancement!



### Additional information

- [ ] I intend to submit a PR for this feature.
- [ ] I have already implemented and/or tested this feature.

---

## Top Comments

**@caiotarifa**:

Duplicated #1933