---
number: 1627
title: I want avoid password field to Paste or Copy . how to do this in Formkit
category: General
created: 2025-03-07
url: "https://github.com/orgs/formkit/discussions/1627"
upvotes: 1
comments: 1
answered: false
---

# I want avoid password field to Paste or Copy . how to do this in Formkit

"<template>
  <FormKit
    type="password"
    label="A fancy password input"
    value="mySecretPassword!"
    prefix-icon="password"
    suffix-icon="eyeClosed"
    @suffix-icon-click="handleIconClick"
    suffix-icon-class="hover:text-blue-500"
  />
</template>
"
how do this in this code that it will not allow me to copy paste any text

---

## Top Comments

**@justin-schroeder** [maintainer] (+1):

Copy is already disabled by HTML on password inputs.

Not allowing paste in a password field is an antipatern: https://security.stackexchange.com/questions/131106/is-there-any-reason-to-disable-paste-password-on-login