---
number: 1680
title: show validation messages programmatically
category: General
created: 2025-11-13
url: "https://github.com/orgs/formkit/discussions/1680"
upvotes: 1
comments: 2
answered: false
---

# show validation messages programmatically

I'm building dynamic forms based on user schema. 
I can't use form groups or the multi-step plugin because it created an additional wrapper for the form fields. E.g. I get:
```
{
  step1: {field1: "", field2:""},
  step2: {field3: "", field4:""},
}
```
instead of flat object of fields. 
This is important for 2 reasons:
1. My server expects flat objects when submitting a form (easy to fix)
2. There are dynamic expressions that users write for showing or hiding fields, and they use just flat field names. With the wrapper I'd have to team my users that instead of using field names in their expressions, they'd have to use step.fieldName, and I don't want to do that. 
Therefore, I'm building my own wrapper for multi step forms, that uses simple divs, and tracks visibility of each st...

---

## Top Comments

**@danbars**:

I was able to show the errors doing this on all fields in the step:
```
field.store.set(
  createMessage({
    key: 'submitted',
    value: true,
    visible: false,
  })
)
```

**@danbars**:

Alternatively, is it possible to use the multi-step plugin (or the custom implementation example) without having the fields wrapped in objects for each step?
