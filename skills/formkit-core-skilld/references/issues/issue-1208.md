---
number: 1208
title: Submitting invalid multi-step form causes valid inputs to receive a red border
type: bug
state: open
created: 2024-02-16
url: "https://github.com/formkit/formkit/issues/1208"
reactions: 3
comments: 3
labels: "[ bug,  priority-3,  theme,  has-workaround]"
---

# Submitting invalid multi-step form causes valid inputs to receive a red border

### Reproduction

https://formkit.link/0d58e609776cff86c21451ff2829039e

### Describe the bug

Hi,

I am trying out the multi-step plugin and noticed when submitting an invalid form, all fields (valid and invalid) receive a red border. I would have expected only the invalid fields to be flagged.

Steps to reproduce:
1) Fill in name
2) Skip to last step
3) Press submit
4) Go back to first step
5) All fields (including valid name field) have a red border

This is really blocking my project at the moment, so I will look for a temporary workaround while this is pending.

Feel free to reach out with any questions.
-- Riki

### Environment

• OS: Windows 10 Pro
• Browser: Chrome
• Version: 121.0.6167.185


---

## Top Comments

**@andrew-boyd** [maintainer]:

That's a good workaround, thank you! I still think we can make this work at the theme level without any such shenanigans — but appreciate you taking the time to follow up.

**@Aellynd**:

I looked further into a workaround and `wrapper-class="$remove:group" outer-class="$remove:group">` on the multi step element seems to do the trick. Whether or not this is suitable for a permanent solution, I leave up to you to judge!

https://formkit.link/2cf9e275b4642fc83078ebc1746ac503

**@handasolo**:

Hi, I'm facing the same issue on one of the forms my team is building but we're using a schema to generate the form. This workaround didn't seem to work for that, any idea how to achieve this for a schema driven form?