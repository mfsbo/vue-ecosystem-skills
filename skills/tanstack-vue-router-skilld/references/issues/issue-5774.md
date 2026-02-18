---
number: 5774
title: TanStack Start + Sentry add-on not working
type: other
state: open
created: 2025-11-06
url: "https://github.com/TanStack/router/issues/5774"
reactions: 12
comments: 2
---

# TanStack Start + Sentry add-on not working

### Which project does this relate to?

Start

### Describe the bug

Create a new TanStack  Start app with Sentry add-on.
Run `npm run dev`.

Get: TypeError: Cannot read properties of undefined (reading 'VITE_SENTRY_DSN')

I've updated `.env.local` to include a valid DSN, but that doesn't make any difference.

### Your Example Website or App

-

### Steps to Reproduce the Bug or Issue

```
> npm create @tanstack/start@latest

> npx
> "create-start"

┌  Let's configure your TanStack Start application
│
◇  What would you like to name your project?
│  foo-sentry
│
◇  Would you like to use Tailwind CSS?
│  No
│
◇  Select toolchain
│  Biome
│
◇  What add-ons would you like for your project?
│  Sentry
│
◇  Would you like any examples?
│  none
│
◇  Initialized git repository
│
◇  Installed dependencies
│
└  Your TanStack Start app is ready in 'foo-sentry'.

Use the following commands to start your app:
% cd foo-sentry
% npm run dev

Please check the README.md for information on testing, styling, adding routes, etc.

> cd foo-sentry/
> npm run dev

> dev
> NODE_OPTIONS='--import ./instrument.server.mjs' vite dev --port 3000

file:///home/markwoon/Dev/foo-sentry/instrument.server.mjs:3
  dsn: import.meta.env.VITE_SENTRY_DSN,
                       ^

TypeError: Cannot read properties of undefined (reading 'VITE_SENTRY_DSN')
    at file:///home/user/foo-sentry/instrument.server.mjs:3:24
    at ModuleJob.run (node:internal/modules/esm/module_job:377:25)
    at async onImport.tracePromise.__proto__ (node:internal/modules/esm/loader:689:26)
    at async asyncRunEntryPointWithESMLoader (node:internal/modules/run_main:96:9)
```

### Expected behavior

I expect the app to start up.  But it doesn't.

### Screenshots or Videos

_No response_

### Platform

- Router / Start Version: 1.132.0
- OS: Linux
- Bundler: vite
- Bundler Version: 7.1.7


### Additional context

_No response_