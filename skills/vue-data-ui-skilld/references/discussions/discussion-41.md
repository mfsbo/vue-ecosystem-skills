---
number: 41
title: Component is positioned centered veritically?
category: Q&A
created: 2024-06-26
url: "https://github.com/graphieros/vue-data-ui/discussions/41"
upvotes: 1
comments: 1
answered: true
---

# Component is positioned centered veritically?

Dear

Is component positioned centered in your client rectangle area?
I could not find way for this one to make it vertically centered.

Please refer below picture,  top-padding and bottom padding seems to be different.






 if these component has style option with "padding, margin", it would be better

Thanks you.

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @manulsan 

Chart component are currently designed to work with titles.
When a title has content, the chart is centered as you would expect.

I will consider making changes to add config options to add padding on the container, however, you can already obtain the result you want by targeting the css class of the chart container and add padding top. For example:

```css
.vue-ui-gauge,
.vue-ui-wheel,
.vue-ui-thermometer {
  padding-top: 24px;
}
```
You may need to apply this style globally, not in a style scoped context.
