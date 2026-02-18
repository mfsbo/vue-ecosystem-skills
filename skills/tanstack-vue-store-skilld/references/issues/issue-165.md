---
number: 165
title: "[Feature request] Add option for persistent state"
type: other
state: open
created: 2025-02-06
url: "https://github.com/TanStack/store/issues/165"
reactions: 20
comments: 2
---

# [Feature request] Add option for persistent state

### Describe the Feature request

It would be great if TanStack store got an option to persistent state between application boots. This takes away the hassle of saving all data that needs to be persistent, to the store but also to disk. I know this pattern from Vuex and later Pinia, but now being in a situation where I'm unable to use my favorite JS framework, I am able to use introduce new things like state management (new to on of the projects i'm currently working on). I would like doing this with a state management tool that has an API that I like, and I also value the ability to use it cross framework as well. But currently, I'm missing the option to make the state persistent in TanStack Store. I can get close by using signals like effects, pseudocode:

```
effect()=>(
   store.setItem('var1', var1);
)
```
I use a similar pattern to retrieve state at app boot. But this is of course far from optimal and would for example cause issues if put on an input component directly, then you'd have to debounce the effect or something. In short; it would probably be better if implemented in the library (or as a plugin) so that users needing persistency don't have to re-invent the wheel or implement sub-optimal solutions.

---

## Top Comments

**@nathantaal** (+2):

@TheApeMachine actually @ahmdtalat implemented the functionallity in #246. I hope someone with merge rights will look into it!

**@TheApeMachine**:

It's a bit of a work-in-progress, but I extracted this quick from something we're doing at work, integrating with Convex for a fully reactive (down), and syncable (up) store. There may be some weird stuff in there, but we wanted Suspense to work, which gets a bit weird with reactive queries. There's probably also some significant mistakes in there. But I honestly think Tanstack Store has the exact right amount of API to make what you want easy enough to implement?