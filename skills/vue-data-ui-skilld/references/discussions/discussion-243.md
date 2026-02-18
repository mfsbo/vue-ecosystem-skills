---
number: 243
title: PDF orientation
category: Q&A
created: 2025-08-31
url: "https://github.com/graphieros/vue-data-ui/discussions/243"
upvotes: 1
comments: 1
answered: true
---

# PDF orientation

How to change PDF orientation? If there is no such option, then in the future it will be very necessary
_// Excellent library for the professional class! You were clearly inspired by Highchart :)_

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @glazkoag 

Thank you :)

You can upgrade to v3.0.13 to use the new orientation features

As you may know, using the PDF feature implies users install the JsPDF peer dependency.
The other way to generate PDF is to use the userOptions.callbacks.pdf callback which returns base64 which users can plug to their own PDF generation method.

The new orientation features will therefore apply  in the case where users choose to use JsPDF.