---
number: 1422
title: Can Autocomplete take arbitrary values?
category: General
created: 2024-06-20
url: "https://github.com/orgs/formkit/discussions/1422"
upvotes: 5
comments: 2
answered: false
---

# Can Autocomplete take arbitrary values?

Currently, Autocomplete always resets its value when the user starts typing and leaves the input without choosing a value.
In our usecase, we want to use Autocomplete only for suggestions, but also want to accept arbitrary inputs.
Is there an option for this (we did not find any), or can this somehow be solved somehow via an event callback or hook?

---

## Top Comments

**@sashamilenkovic** [maintainer]:

@sebastian-eggers-pcg The taglist has a prop `allow-new-values` that will allow for arbitrary values to be entered on press of the Enter key. There are also modifications you can make to allow for other key commands to input a value. Is that something you're looking for? Or rather, would you want the text itself to become a value without having to press a key?

**@nhedger**:

Also interested in this feature, thanks for creating the discussion!