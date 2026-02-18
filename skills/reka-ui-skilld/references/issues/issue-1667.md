---
number: 1667
title: "[Feature]: support Shadow DOM compatibility"
type: feature
state: open
created: 2025-02-28
url: "https://github.com/unovue/reka-ui/issues/1667"
reactions: 13
comments: 10
labels: "[enhancement]"
---

# [Feature]: support Shadow DOM compatibility

### Environment

```bash
Can be provided if needed
```

### Link to minimal reproduction

Can be provided if needed

### Steps to reproduce

See description

### Describe the bug

First of all, thank you for this incredible component library! It is, in my opinion, the best unstyled component library available.  

However, I have noticed that some components do not work correctly when used inside a Shadow DOM. Specifically:  

1. When placing a `Popover` inside a `Dialog`, clicking on the `Popover` content causes the entire `Dialog` to close unexpectedly.  
2. When using an input field inside a `Dialog` that dynamically updates content within the `Dialog`, the focus keeps switching back to `DialogContent`, disrupting the user experience.  

It would be great if the library provided better support for Shadow DOM environments, especially for users leveraging Vue.js’s `defineCustomElement` function, where the entire application runs inside a Shadow DOM.  

### Possible Solution:  
In most cases, the issue arises from direct usage of `document` instead of retrieving the correct root node. A common fix is to use `.getRootNode()` on the element instead of `document`.  

For example, modifying FocusScope.vue (L125-L133) to use `container.getRootNode()` instead of `document` might (untested) resolve the focus issue with input fields inside a `Dialog`.  

Would love to hear your thoughts on this, and I’d be happy to help test any potential fixes!  

### Expected behavior

_No response_

### Context & Screenshots (if applicable)

_No response_

---

## Top Comments

**@zernonia** [maintainer] (+2):

Hi @danieldasilva-smake , yeah this is not a bug as currently we have not cater for the full use case for shadow DOM yet. We can move this as feature can be tackled in the future 

**@lepture**:

This is not a bug, it is a feature request.

We can add a default mount point config in `ConfigProvider`. Currently, by default, everything will be mounted to `document.body`.

**@danieldasilva-smake**:

> This is not a bug, it is a feature request.
> 
> We can add a default mount point config in `ConfigProvider`. Currently, by default, everything will be mounted to `document.body`.

Perhaps this is a feature request in the sense that Shadow DOM support is not explicitly mentioned, and I would like to see that support added. However, no changes to configuration or props are necessary for this. You can already define mounting points in the Portal component (e.g., `PopoverPortal` or `DialogPortal`) using the `to` prop.  

...