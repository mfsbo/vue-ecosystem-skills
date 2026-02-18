---
number: 1011
title: Mask field doesn't fire dom-input-event on user's input
type: bug
state: closed
created: 2023-10-24
url: "https://github.com/formkit/formkit/issues/1011"
reactions: 7
comments: 2
labels: "[ bug,  release-ready,  priority-3, Pro]"
---

# Mask field doesn't fire dom-input-event on user's input

### Reproduction

https://formkit.link/9042cd4334b0e0cf8c02f3387c0f8781

### Describe the bug

Simple text field (`type="text"`) fires `dom-input-event`, but field with mask (`type="mask"`) not. I think that we can add such code https://github.com/formkit/formkit/blob/master/packages/inputs/src/sections/textareaInput.ts#L15 for `mask` field. I tested this solution for bundled mask and its working.

### Environment

• OS: macOS
• Browser: Chrome
• Version: 118.0.5993.88 (Official Build) (arm64)


---

## Top Comments

**@justin-schroeder** [maintainer]:

> @justin-schroeder It's been ready for release for 2 months, when can we expect a release with this fix?

Congrats on joining GitHub today! Release within perhaps the next week or so.

**@dreamerrrrrrrrr**:

@justin-schroeder It's been ready for release for 2 months, when can we expect a release with this fix?