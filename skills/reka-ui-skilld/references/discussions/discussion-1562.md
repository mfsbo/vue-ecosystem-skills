---
number: 1562
title: CalendarHeading v-slot prop `headingValue` causes implicit `any`
category: Q&A
created: 2025-01-17
url: "https://github.com/unovue/reka-ui/discussions/1562"
upvotes: 2
comments: 2
answered: false
---

# CalendarHeading v-slot prop `headingValue` causes implicit `any`

Hi, so I recently updated my dependencies after which CalendarHeading component from shadcn-vue caused a implicit `any`.
Here is the whole error:
```
src/components/ui/calendar/CalendarHeading.vue:18:32 - error TS7022: 'headingValue' implicitly has type 'any' because it does not have a type annotation and is referenced directly or indirectly in its own initializer.

18     <CalendarHeading v-slot="{ headingValue }" :class="cn('text-sm font-medium', props.class)" v-bind="forwardedProps">
                                  ~~~~~~~~~~~~
```

This seems like a problem caused by radix-vue, since the CalendarHeading component in line 18 is imported from radix-vue. 
Now my question arises, is this a problem with my configuration somehow or is this a bug that hasn't been addressed yet.
...

---

## Top Comments

**@adlermore**:

> Hi, so I recently updated my dependencies after which CalendarHeading component from shadcn-vue caused a implicit `any`. Here is the whole error:
> 
> ```
> src/components/ui/calendar/CalendarHeading.vue:18:32 - error TS7022: 'headingValue' implicitly has type 'any' because it does not have a type annotation and is referenced directly or indirectly in its own initializer.
> 
> 18     <CalendarHeading v-slot="{ headingValue }" :class="cn('text-sm font-medium', props.class)" v-bind="forwardedProps">
>                                   ~~~~~~~~~~~~
> ```
> 
> This seems like a problem ...

**@MaxHeilmann2004**:

It is not possible to set the types for v-slot props. The issue is most likely with missing type definitions within reka-ui (radix-vue)