---
number: 5967
title: nitro + spa mode breaks since v1.138.0
type: other
state: closed
created: 2025-11-26
url: "https://github.com/TanStack/router/issues/5967"
reactions: 24
comments: 13
labels: "[needed-for-start-stable]"
---

# nitro + spa mode breaks since v1.138.0

### Which project does this relate to?

Start

### Describe the bug

If you use nitro + spa mode, the `vite build` will report this error:

```
✓ built in 535ms
[prerender] Prerendering pages...
error during build:
Error: Failed to start the Vite preview server for prerendering
    at startPreviewServer (file:///project-dir/node_modules/.pnpm/@tanstack+start-plugin-core@1.139.6_@tanstack+react-router@1.139.6_react-dom@19.2.0_rea_4811f95400dc016e184359a72f378162/node_modules/@tanstack/start-plugin-core/dist/esm/prerender.js:195:11)
    at async prerender (file:///project-dir/node_modules/.pnpm/@tanstack+start-plugin-core@1.139.6_@tanstack+react-router@1.139.6_react-dom@19.2.0_rea_4811f95400dc016e184359a72f378162/node_modules/@tanstack/start-plugin-core/dist/esm/prerender.js:42:25)
    at async postServerBuild (file:///project-dir/node_modules/.pnpm/@tanstack+start-plugin-core@1.139.6_@tanstack+react-router@1.139.6_react-dom@19.2.0_rea_4811f95400dc016e184359a72f378162/node_modules/@tanstack/start-plugin-core/dist/esm/post-server-build.js:38:5)
    at async BasicMinimalPluginContext.handler (file:///project-dir/node_modules/.pnpm/@tanstack+start-plugin-core@1.139.6_@tanstack+react-router@1.139.6_react-dom@19.2.0_rea_4811f95400dc016e184359a72f378162/node_modules/@tanstack/start-plugin-core/dist/esm/plugin.js:267:11)
    at async Object.buildApp (file:///project-dir/node_modules/.pnpm/vite@7.2.4_@types+node@24.10.1_jiti@2.6.1_lightningcss@1.30.2_sugarss@5.0.1_postcss@8.5.6__tsx@4.20.6_yaml@2.8.1/node_modules/vite/dist/node/chunks/config.js:34542:5)
    at async CAC.<anonymous> (file:///project-dir/node_modules/.pnpm/vite@7.2.4_@types+node@24.10.1_jiti@2.6.1_lightningcss@1.30.2_sugarss@5.0.1_postcss@8.5.6__tsx@4.20.6_yaml@2.8.1/node_modules/vite/dist/node/cli.js:629:3)                                                                                                                                                                  
 ELIFECYCLE  Command failed with exit code 1.
```...

---

## Top Comments

**@fuma-nama** (+3):

Yep confirmed it is working with [Nitro nightly](https://v3.nitro.build/docs/nightly) `3.0.1-20251230-165713-6e801e22`, thanks for the fix!

**@ShoeBoom** (+2):

Still seeing issue
```ts
const config = defineConfig({
  plugins: [
    devtools(),
    nitro(),
    // this is the plugin that enables path aliases
    viteTsConfigPaths({
      projects: ['./tsconfig.json'],
    }),
    tailwindcss(),
    tanstackStart({
      spa: {
        enabled: true
      }
    }),
    viteReact(),
  ],
})
```
https://github.com/ShoeBoom/tanstack-nitro-spa-bug
https://stackblitz.com/~/github.com/ShoeBoom/tanstack-nitro-spa-bug

pnpm build results in

...

**@CarlosZiegler** (+1):

hey I have same issue with nitro and this looks like broke when using nit `"nitro": "^3.0.1-alpha.1" `  when switch back to `@tanstack/nitro-v2-vite-plugin` this works as expectd:

## Output `"nitro": "^3.0.1-alpha.1"`:

<img width="479" height="67" alt="Image" src="https://github.com/user-attachments/assets/7ebfbb7d-591f-4564-9270-dafcabd39ae8" />


## Output `"@tanstack/nitro-v2-vite-plugin": "^1.139.0"`:

<img width="478" height="342" alt="Image" src="https://github.com/user-attachments/assets/ed32fc59-b778-437a-abf5-b5b4ad86457f" />