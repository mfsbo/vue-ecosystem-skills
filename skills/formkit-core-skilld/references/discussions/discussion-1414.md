---
number: 1414
title: async server-side validation for complete form?
category: General
created: 2024-06-12
url: "https://github.com/orgs/formkit/discussions/1414"
upvotes: 1
comments: 1
answered: false
---

# async server-side validation for complete form?

I'm trying to add a validator which receives all form inputs and will return the validation state asynchronously. Unfortunately I did not yet find something in the docs on how to do that.

Just to be clear:
- My validation should be triggered just like any other field-level validation in FormKit.
- I need to access all form values in my custom validation function. These will be sent to the same endpoint on the server.
- Then I need to set the validation state manually but I saw some hints on how to do that.

What I found:
- A custom async validation function (as shown in the "Essentials / User Interface" examples) actually gets a `Node`(?) instance ...

---

## Top Comments

**@justin-schroeder** [maintainer]:

so basically this would be like a validation rule for the whole form? You can actually put validation rules on the `<FormKit type="form">` but I suppose what im unclear about is whether or not this is what you are really looking for, or if you just want to handle form-submitted data via server side validation and then display the results back on the inputs?