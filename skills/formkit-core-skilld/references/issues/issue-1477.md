---
number: 1477
title: Pro Inputs - Potential Memory Leak Issue
type: bug
state: closed
created: 2024-08-09
url: "https://github.com/formkit/formkit/issues/1477"
reactions: 9
comments: 11
labels: "[ bug,  release-ready,  priority-1]"
---

# Pro Inputs - Potential Memory Leak Issue

### Reproduction

https://github.com/njoswald/formkit-memory-leak

### Describe the bug

Recently, I noticed my company's node project started having a memory leak through our Heroku Metric logging. Through a lot of testing with chrome DevTools and clinic.js, I believe I have singled the issue down to FormKit Pro inputs. In my company's project, I recently created a form that has an autocomplete field with US states. This form was causing a memory leak, and switching the autocomplete input from "autocomplete" to "select" completely erased the leak in our metrics. (Screenshot showcases this change.)



After figuring this out, I created a test repository using the FormKit nuxt starter and ran my tests again using the new project and was able to recreate the issue. Every free input type did not cause any memory issues, but every pro input would cause an apparent memory leak. 

The instructions to reproduce the issue are located in the repository's README.md. 

## Clinic.js
The following screenshots showcase the clinic.js results with the following command
`clinic doctor --on-port 'autocannon -c -10 -a 500 localhost:3000' "--" node .output/server/index.mjs`

Here is without any pro inputs.


Here is with a single pro input.
:

@justin-schroeder same here! It's really critical for us
Any updates on this?

**@justin-schroeder** [maintainer] (+3):

Thanks for the report, we’ll look into it!

**@justin-schroeder** [maintainer] (+1):

no update. But I remarked the issue so it will be at the top of the list on our next bug blitz.