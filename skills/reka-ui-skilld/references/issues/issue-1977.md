---
number: 1977
title: "[Feature]: Allow passing `id` prop to `SelectRoot` for proper label association"
type: other
state: open
created: 2025-06-06
url: "https://github.com/unovue/reka-ui/issues/1977"
reactions: 5
comments: 3
---

# [Feature]: Allow passing `id` prop to `SelectRoot` for proper label association

### Describe the feature

## Summary

Currently, the `SelectRoot` component does not accept an `id` prop, making it impossible to associate a `Label` component with the underlying select element. This creates an accessibility issue, as every `label` element should be explicitly linked to its form control using the `for` attribute and a matching `id`.

## Why is this needed?

Inaccessible form elements create barriers for users relying on assistive technologies such as screen readers. Without the ability to pass an `id` to the `SelectRoot`, developers can't ensure that the `label` is properly linked to the select input.

## Proposed solution

Add support for passing a standard HTML `id` attribute to the `SelectRoot` component. This `id` should be applied to the internal focusable trigger element used to open the select dropdown.

## Example usage

```vue
<Label for="country">Country</Label>
<SelectRoot id="country">
  <SelectTrigger />
  <SelectContent>
    ...
  </SelectContent>
</SelectRoot>
```

Related
WCAG 2.1 - Success Criterion 1.3.1: Info and Relationships

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/label#labeling_form_controls