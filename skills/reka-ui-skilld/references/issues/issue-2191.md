---
number: 2191
title: "[Feature]: Calendar - Add interactive month/year selectors to calendar heading"
type: other
state: open
created: 2025-09-26
url: "https://github.com/unovue/reka-ui/issues/2191"
reactions: 7
comments: 0
---

# [Feature]: Calendar - Add interactive month/year selectors to calendar heading

### Describe the feature

##  Problem
Currently, the Calendar component displays the month and year as plain text in the `CalendarHeading` (e.g., "September 2025"). Users who need to navigate to a distant date must click through many months/years using the navigation buttons, which creates a poor user experience for date selection across larger time ranges.

##  Proposed Solution
Transform the static month and year text in the `CalendarHeading` into interactive select dropdowns, allowing users to:
- Quickly jump to any month within the current year
- Rapidly navigate to any year within the allowed range
- Maintain the existing navigation buttons for incremental changes

##  Implementation Details

### Validation & Constraints
The feature should respect all existing calendar constraints:
- **minValue/maxValue**: Selects should only show valid months/years
- **isDateDisabled/isDateUnavailable**: Months/years with no selectable dates should be disabled
- **Locale support**: Month names should be properly localized
- **Calendar systems**: Should work with different calendar systems (Gregorian, Persian, etc.)

### Accessibility Considerations
- Maintain keyboard navigation compatibility
- Provide appropriate ARIA labels for screen readers
- Ensure focus management when dropdowns are opened/closed
- Support arrow key navigation within selects

...