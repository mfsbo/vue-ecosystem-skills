---
number: 1545
title: Dropdown Multiple Select with Ellipses Triggering Recursive Re-Render 
type: bug
state: open
created: 2024-11-01
url: "https://github.com/formkit/formkit/issues/1545"
reactions: 1
comments: 0
labels: "[ bug,  priority-2, Pro]"
---

# Dropdown Multiple Select with Ellipses Triggering Recursive Re-Render 

### Reproduction

https://formkit.link/f868c8c104cf1259f53bebf4482fbf4d

### Describe the bug

When using the multiple option on the dropdown with longer string options, when the number flag (e.g., the +2 icon) is displayed near the ellipses of one of the selected options, a recursive DOM render happens changing the data-test id and visibility of the options (see video and reproduction). 

https://github.com/user-attachments/assets/fe324655-4b64-47d0-a8eb-c36a1055edb7



### Environment

• OS: MacOS Ventura
• Browser Chrome
• Version Chromium: 130.0.6723.92
