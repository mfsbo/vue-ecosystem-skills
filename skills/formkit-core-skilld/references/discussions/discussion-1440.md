---
number: 1440
title: How to add classes (and other attributes to dynamically constructed form elements with FormKit Schema?
category: General
created: 2024-07-04
url: "https://github.com/orgs/formkit/discussions/1440"
upvotes: 1
comments: 1
answered: false
---

# How to add classes (and other attributes to dynamically constructed form elements with FormKit Schema?

I have a FormKit schema I dynamically generate. A bunch of checkboxes for example.

I now want to change (append, reset, remove) some classes to the input elements that are created. For non-form elements I can use `attr: { class: ["warning"]}}` but that does not work for form elements. How should I change the classes of those FormKit schema form elements?

Thanks!

---

## Top Comments

**@justin-schroeder** [maintainer]:

You just need to target the "section" inside the formkit input you want to target like `sectionName-class` (each input’s documentation page has a list of the available sections).  For example:

```js
{
  $formkit: 'text',
  outerClass: 'my classses go here'
}
```
