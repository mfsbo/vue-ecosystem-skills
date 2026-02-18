---
number: 1068
title: "Hot Module Reload results in `Maximum recursive updates exceeded in component` when using `#default=\"{value}\"`"
type: bug
state: open
created: 2023-12-11
url: "https://github.com/formkit/formkit/issues/1068"
reactions: 5
comments: 5
labels: "[ bug,  priority-3]"
---

# Hot Module Reload results in `Maximum recursive updates exceeded in component` when using `#default="{value}"`

### Reproduction

https://github.com/TimDirks/FormKit-Recursive-Playground

### Describe the bug

During local development, triggering a Hot Module Reload results in a `Maximum recursive updates exceeded` warning in the console. For this to happen, two conditions need to be met;
* The `<FormKit type="form">` component needs either to have a `#default="{value}"` or `v-model="formData"` attribute.
* The `<FormKit type="form">` needs to get (some) FormKit input fields from child components.

With these conditions met, making a change in a .vue file in the script tag and saving it (and thus triggering HMR) will result in some recursive logic being executed.

Nothing actually breaks, it doesn't give this warning on page-load so my guess is that this would never show up in a production environment. However, it still hinders local development as it sometimes triggers many times over and over freezing up the main thread.

### Environment

• OS: macOS Ventura 13.5
• Browser: Chrome version 120.0.6099.71
• Version: FormKit 1.4.0, Node 20.9.0


---

## Top Comments

**@justin-schroeder** [maintainer]:

Many many changes to try and address this including a completely new build process, but for most cases (assuming vite HMR) this should be fixed on the `@next` tag. @TimDirks can you confirm/deny that this has helped with these symptoms?

**@justin-schroeder** [maintainer]:

Thank you for the good reproduction, we’ll look into this.

**@justin-schroeder** [maintainer]:

Unfortunately part of the fix for this issue in 1.5.0 caused an unintended knock-on effect and was reverted in 1.5.1. I’m reopening this so we can tackle it from a different direction.