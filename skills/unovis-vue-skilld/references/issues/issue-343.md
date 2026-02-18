---
number: 343
title: Cannot find module '@unovis/svelte' or its corresponding type declarations.
type: other
state: closed
created: 2024-03-03
url: "https://github.com/f5/unovis/issues/343"
reactions: 4
comments: 11
---

# Cannot find module '@unovis/svelte' or its corresponding type declarations.

There is a typescript error when using the svelte part of Unovis:
```
Cannot find module '@unovis/svelte' or its corresponding type declarations.
```
The modules works, and the project builds, but the types do not work. Types work though in the TS part of the module. Related to this, i notice in `node_modules` that the `ts`-folder has a `types.d.ts`-file while the `svelte`-folder has not. Does this have anything to do with this?

This is my `tsconfig.json` file:
```
{
	"extends": "./.svelte-kit/tsconfig.json",
	"compilerOptions": {
		"allowSyntheticDefaultImports": true,
		"allowJs": true,
		"checkJs": true,
		"esModuleInterop": true,
		"forceConsistentCasingInFileNames": true,
		"resolveJsonModule": true,
		"skipLibCheck": true,
		"sourceMap": true,
		"strict": true,
		"moduleResolution": "Bundler"
	}
}

```...

---

## Top Comments

**@huntabyte** (+2):

I'm experiencing another related issue when new projects are using `"moduleResolution": "NodeNext"` the components aren't able to be resolved due to a missing file extension in `index.js`:

```diff
- export * from './containers';
- export * from './components';
+ export * from './containers.js';
+ export * from './components.js';
```

The ideal approach would be to use `"moduleResolution": "NodeNext"` in the library's `tsconfig.json` to ensure regressions aren't introduced and support for both Node and bundlers is provided.

Reference: https://www.typescriptlang.org/docs/handbook/mo...

**@michaelbelete** (+2):

> @huntabyte (cc @michaelbelete @OTheNonE) Thanks for pointing it out! I've just published `1.3.6-beta.0`, can you please try installing it and confirm if it works?

@rokotyan `1.3.6-beta.0` fixed my problem. Thank you 🏼 

**@rokotyan** (+2):

@huntabyte @shyakadavis @michaelbelete

`1.3.6-beta.1` addresses this problem and ready to be tested, thanks for pointing it out!

We'll need to update Typescript version in our project to use  `"moduleResolution": "NodeNext"` and there were some problems with this. But one day we'll definitely do it.