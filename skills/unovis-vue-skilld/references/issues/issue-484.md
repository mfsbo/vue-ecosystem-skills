---
number: 484
title: Svelte 5 Infinite Effect / Reactive Loop
type: other
state: open
created: 2024-11-19
url: "https://github.com/f5/unovis/issues/484"
reactions: 1
comments: 10
---

# Svelte 5 Infinite Effect / Reactive Loop

Using svelte 5 with unovis causes an infinite reactive loop if more than 1 x/y component is rendered. The cause of this is the `component` action set within the xy container context:

```ts
setContext('component', () => ({
		update: (c: XYComponentCore<Datum>) => {
			config.components = [...config.components, c];
		},
		destroy: () => {
			config.components = config.components.filter((c) => !c.isDestroyed());
		}
	}));
```

Due to svelte 5's deeper reactivity the update function is called when data is added to one of the child line components, as a result of this the config.components pushes a duplicate component to `config.components` and an infinite loop begins and pushes duplicates to config.components.

A fix for this is simply preventing the update function from writin...