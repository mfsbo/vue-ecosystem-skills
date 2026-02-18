---
number: 17
title: Can't get it to work with Options API
category: Q&A
created: 2023-11-23
url: "https://github.com/graphieros/vue-data-ui/discussions/17"
upvotes: 1
comments: 3
answered: false
---

# Can't get it to work with Options API

Hi there, 

I love the examples used for this plugin, but when I copy / paste the example code from https://vue-data-ui.graphieros.com/docs#vue-ui-xy I still can't get it to run at all.

I'm using the VueJS Options API, and have to load Vue-Data-Ui from a CDN: https://cdn.jsdelivr.net/npm/vue-data-ui@1.9.4/+esm
I've got the components included in my Vue app, and the data is present. However, in my DOM-template, nothing happens.
Just to be sure, I've also run a test with a webpack generated version of vue-data-ui combined with the files that import it, to no avail.


My DevTools says the following:
- TypeError: Cannot read properties of null (reading 'refs')
- vue.global.prod.js?cacheversion=231123IuKnytYH:1  TypeError: Cannot read properties of null (reading 'emitsOptions')
- T...

---

## Top Comments

**@graphieros** [maintainer] (+1):

Hey there,

thanks for trying the lib:)
What version of Vue are you using ?
This library is designed to work with Vue 3, and the error you mention 'TypeError: Cannot read properties of null (reading 'refs')'' seems to indicate you are using Vue 2.

**@graphieros** [maintainer]:

Do you have the same issue when passding hardcoded dataset directly to the component ? That's not a solution of course, just a way to be sure the data is sent to the component.
`<vue-ui-xy :dataset=''[
   {
        name: 'Series 1',
        series: [-55, -34, -21, -13, -8, -5, -3, -2, -1, -1, 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55],
        type: "'ine',
        color: 'rgb(95,139,238)',
    }
]"` />

**@KayElliot**:

Would it make sense to create a separate bundle that imports vue from a CDN?
I've spend some time trying to integrate the Vue package but it's a lot of hassle trying to integrate. 