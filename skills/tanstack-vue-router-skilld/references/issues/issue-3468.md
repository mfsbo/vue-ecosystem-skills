---
number: 3468
title: Cloudflare Env Vars Not Passed to SSR in TanStack Start
type: other
state: closed
created: 2025-02-18
url: "https://github.com/TanStack/router/issues/3468"
reactions: 35
comments: 9
labels: "[start]"
---

# Cloudflare Env Vars Not Passed to SSR in TanStack Start

### Which project does this relate to?

Start

### Describe the bug

When running a TanStack Start app on Cloudflare (Workers/Pages) with SSR, the Cloudflare environment bindings (in `getContext("cloudflare")`) appear not to be accessible in the SSR pipeline. They work fine for API or “server” routes, but not for SSR.

### Your Example Website or App

nonexistent

### Steps to Reproduce the Bug or Issue

### Steps to Reproduce

1. **Project Setup**  
   - Using TanStack Start (`@tanstack/start@^1.101.2`) with a config that has multiple routers (`api`, `ssr`, `client`, etc.).  
   - Deployed on Cloudflare Pages/Workers.  
   - Also tested locally via `wrangler pages dev`.

2. **Code Snippets**

#### `app.config.ts` (TanStack start config)

```ts
import { defineConfig } from "@tanstack/start/config";
import { cloudflare } from "unenv";
import type { App } from "vinxi";
import { checker } from "vite-plugin-checker";
import Terminal from "vite-plugin-terminal";
import tsConfigPaths from "vite-tsconfig-paths";

const tanstackApp = defineConfig({
  server: {
    preset: "cloudflare-pages",
    unenv: cloudflare,
  },
  routers: {
    api: {
      entry: "src/entry.api.ts",
    },
    ssr: {
      entry: "src/entry.server.ts",
    },
    client: {
      entry: "src/entry.client.tsx",
    },
  },
  vite: {
    plugins: [
      tsConfigPaths(),
      checker({
        typescript: true,
        overlay: true,
      }),
      Terminal(),
    ],
    resolve: {
      alias: {
        "@": "src",
      },
    },
  },
  tsr: {
    routesDirectory: "src/routes",
    appDirectory: "src",
    generatedRouteTree: "src/routeTree.gen.ts",
  },
});

const routers = tanstackApp.config.routers.map((r) => {
  return {
    ...r,
    // Attempt to inject env middleware for server routes
    middleware:
      r.target === "server"
        ? "src/lib/server/middleware/requests/env.server.ts"
        : undefined,
  };
});

const app: App = {
  ...tanstackApp,
  config: {
    ...tanstackApp.config,
    routers: routers,
  },
};

...

---

## Top Comments

**@boertel** (+3):

> Yeah, having the same problem rn trying to use `waitUntil`. Any workarounds?

For whoever lands on this issue, you can access `waitUntil` from `cloudflare:env`:
```ts
import { waitUntil } from "cloudflare:workers";
```

**@MrSquaare** (+5):

Please also note that using https://github.com/nitrojs/nitro-cloudflare-dev with dev server does not return Cloudflare bindings neither in API Routes nor in server actions.

**@leonardo2204** (+1):

> > How do you get access to the bindings though using the Cloudflare Vite Plugin in start?
> 
> With `env` imported from `"cloudflare:workers"`
> 
> Example:
> 
> import { env } from "cloudflare:workers";
> 
> const serverFunction = createServerFn().handler(() => {
> 	console.log(env);
> });
> 
> export const Route = createFileRoute("/")({
> 	component() {
> 		return (
> 			<button
> 				onClick={async () => {
> 					await serverFunction();
> 				}}
> 			>
> 				Click me
> 			</button>
> 		);
> 	},
> });
> See [cloudflare docs](https://developers.cloudflare.com/workers/framework-guides/web-ap...