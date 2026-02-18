---
number: 577
title: Component highlighting not working for Formkit-beta.15 with Nuxt 3.2.0
type: other
state: closed
created: 2023-02-10
url: "https://github.com/formkit/formkit/issues/577"
reactions: 3
comments: 7
labels: "[ release-ready]"
---

# Component highlighting not working for Formkit-beta.15 with Nuxt 3.2.0

### Reproduction

https://stackblitz.com/edit/nuxt-starter-kabg4x?file=package.json

### Describe the bug

Component highlighting in VS Code does not work with Nuxt 3.2.0 and Formkit-beta.15. When I hover over a component, the component is not recognised (image): 

<img width="409" alt="image" src="https://user-images.githubusercontent.com/80922251/218113615-ef959d02-c4ae-450b-b685-2644fe1ff02c.png">

**Expected results:** When I uninstall formkit it works again (after vscode restart):
<img width="1048" alt="image" src="https://user-images.githubusercontent.com/80922251/218113907-e4e16ff3-edfe-4824-8b2a-e41775de9874.png">


Component highlighting (expected result) works with these package combinations installed:

- Nuxt 3.0.0 + Formkit-beta.15
- Nuxt 3.2.0 + Formkit-Beta.4 (Beta...