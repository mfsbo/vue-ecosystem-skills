---
number: 40
title: Component is not reacting by dataset in using VueUiGauge and VueUiWheel
category: Q&A
created: 2024-06-25
url: "https://github.com/graphieros/vue-data-ui/discussions/40"
upvotes: 1
comments: 2
answered: true
---

# Component is not reacting by dataset in using VueUiGauge and VueUiWheel

# Reactive Issues
```text
This is the first time using this component that it has well featured and  various components.

while using this one,  view rendering seems to be "not rendered" by data changes,
if someone has same issues, please share with me.
Thank you advance.
```
## Dev environment
- Vue3
- Composition API
- Quasar Framework

## Usoing components
- VueUiGauge 
- VueUiWheel

## Result In Vue
- Even if data is changed, Chart Drawing is not re-rendered
- Picture 



##  Codes
### DataSet
```code
const wheelData = computed(() => {
  return {
    percentage: props.liveData.widgetData.value.dataValue,
  };
});

const gaugeData = computed(() => {  
  return {
    series: [
      {
        from: 0,
        to: 5,
        color: '#6376DD',
        id: '111',
      },
      {
        from: 5,
        to: 100,
        color: '#42d392',
        id: '222',
      },
    ],
    value: props.liveData.widgetData.value.value,
  };
});
```...

---

## Accepted Answer

**@graphieros** [maintainer]:

Hi @manulsan :)

You can upgrade to version [2.2.18](https://github.com/graphieros/vue-data-ui/releases/tag/v2.2.18) which solves reactivity issues for these components.
Thank you for pointing it out, and for trying out the library!

Let me know if you still have issues with these components.

I don't think you should update the `from` and `to` attributes of the dataset series. They are meant to be fixed to convey information about how bad or good is the current value.

PS.
Another way to force re-redering while waiting for a solution would have been for you to add a key to the component, and increment it whenever dataset changes.

```js
const step = ref(0);

watch(() => props.liveData.widgetData.value.value, () => {
  step.value += 1;
})
```

```html
<VueUiGauge
  :dataset="dataset"
  :config="config"
  :key="`gauge_${step}`"
/>
```
This forces the whole component to re-render with the new dataset.

Cheers
