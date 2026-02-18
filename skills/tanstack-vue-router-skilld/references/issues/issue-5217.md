---
number: 5217
title: Start RC - Environment Variables aren't loaded automatically
type: other
state: closed
created: 2025-09-24
url: "https://github.com/TanStack/router/issues/5217"
reactions: 26
comments: 10
---

# Start RC - Environment Variables aren't loaded automatically

### Which project does this relate to?

Start

### Describe the bug

Environment variables are not automatically loaded as stated in the docs.

### Your Example Website or App

https://github.com/ryanagillie/tanstack-start-rc-env-bug

### Steps to Reproduce the Bug or Issue

1. Clone Repo
2. `pnpm install`
3. `pnpm run dev`
4. Navigate to `localhost:3000/`

### Expected behavior

Greeting (HELLO, WORLD!) should be displayed as the env variable is passed through a server function to the loader, additionally the greeting should be displayed in the console (both server and client) but both return undefined

### Screenshots or Videos

_No response_

### Platform

- Router / Start Version: 1.132.3
- OS: macOS Tahoe 26.0
- Browser: Chrome
- Browser Version: 140.0.7339.208
- Bundler: vite
- Bundler Version: 7.1.7


### Additional context

_No response_

---

## Top Comments

**@dallastjames** (+6):

Ran into this as well after upgrading a project to the RC. I'm working around it by manually loading the env vars as part of my vite config until it can be patched in start directly.

```typescript
import { tanstackStart } from '@tanstack/react-start/plugin/vite';
import { defineConfig, loadEnv, type ConfigEnv } from 'vite';
import tsConfigPaths from 'vite-tsconfig-paths';
import viteReact from '@vitejs/plugin-react';
import tailwindcss from '@tailwindcss/vite';

export default ({ mode }: ConfigEnv) => {
  // Workaround to load secrets since it's broken in Tanstack RC0
  Object.assign(process.env, loadEnv(mode, process.cwd(), ''));

  return defineConfig({
    plugins: [
      tsConfigPaths({
        projects: ['./tsconfig.json'],
      }),
      tanstackStart(),
      viteReact(),
      tailwindcss(),
    ],
  });
};

...

**@jensen** (+2):

This looks like something that was introduced in the latest RC merge https://github.com/TanStack/router/pull/5189

The code in packages/start-plugin-core/src/load-env-plugin/plugin.ts used to be 

```
Object.assign(
        process.env,
        vite.loadEnv(envConfig.mode, userConfig.root ?? startOpts.root, ''),
      )
```

Notice that the last argument is an empty string and removes the 'VITE_' default prefix.

The latest code doesn't use the last argument. 

```
Object.assign(process.env, loadEnv(config.mode, config.root))
```

Now only 'VITE_' vars are getting through. 

**@titusgahissy**:

This is what I do

```typescript 

// src/env.ts

import { createEnv } from "@t3-oss/env-core";
import { config } from "dotenv"; // <---- ADDED THIS
import { z } from "zod/v4";

config(); // <---- ADDED THIS

export const env = createEnv({
  server: {
    IDP_URL: z.url().min(1, "IDP_URL is required"),
    IDP_CLIENT_ID: z.string().min(1, "IDP_CLIENT_ID is required"),
    IDP_CLIENT_SECRET: z.string().min(1, "IDP_CLIENT_SECRET is required"),
    SESSION_SECRET: z.string().min(1, "SESSION_SECRET is required"),
    REDIS_URL: z.string().min(1, "REDIS_URL is required"),
    ENV: z.string().min(1, "ENV is required"),
    UNSPLASH_ACCESS_KEY: z.string(),
  },
  client: {
    CLIENT_PUBLIC_URL: z.url().min(1, "CLIENT_PUBLIC_URL is required"),
  },
  clientPrefix: "CLIENT_",
  runtimeEnv: process.env,
});

...