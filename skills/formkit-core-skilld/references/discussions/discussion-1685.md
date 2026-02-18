---
number: 1685
title: How to use 2 validated Buttons
category: General
created: 2025-12-04
url: "https://github.com/orgs/formkit/discussions/1685"
upvotes: 1
comments: 1
answered: false
---

# How to use 2 validated Buttons

I have a problem. For my current project with "@formkit/nuxt": "1.6.5", I need a FormKit form with 2 buttons that both validate the data, but then do different things with it. I tried setting both as submit buttons, but then in the submit handler I don't get any information about which one I pressed. I also tried triggering the validation manually, but it doesn't find the validate() method.

Is there a way to solve this problem?

My Code Example: 

...

---

## Top Comments

**@pjrusso**:

Hi @sandrarum - I had a scenario where I needed to offer the ability save a partially complete form as well as using the normal submission process to validate and save the data.  

As @justin-schroeder has said on several other issues the second of these scenarios is automatically handled within FormKit itself - so you don't need to call validate() so the standard built-in mechanism was fine.

My custom save button however walks the errors collection to remove any 'required' rules so I can save validated but partially completed forms:

...