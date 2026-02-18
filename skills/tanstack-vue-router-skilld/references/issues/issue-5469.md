---
number: 5469
title: Improve start error message when importing server code on the client
type: other
state: closed
created: 2025-10-13
url: "https://github.com/TanStack/router/issues/5469"
reactions: 23
comments: 27
---

# Improve start error message when importing server code on the client

### Which project does this relate to?

Start

### Describe the bug

When someone imports server code on the client in the current iteration of tanstack start, vite gives a very hard-to-debug error which doesn't expose what file is generating that error. This is a pretty awful issue to debug, especially for projects moving to the RC.

Split off of https://github.com/TanStack/router/issues/5196#issuecomment-3398768616, which you should read for more context.

Example error message:
```
../node_modules/@tanstack/start-server-core/dist/esm/loadVirtualModule.js:5:26:
  5 │       return await import("tanstack-start-manifest:v");
    ╵                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~
```

### Your Example Website or App

https://github.com/TanStack/router/issues/5196#issuecomment-3398826558

### Steps to Reproduce the Bug or Issue

```ts
import { getRequest } from "@tanstack/react-start/server";
```
(or similar) on a client-only file

### Expected behavior

As a user, I am alright with this erroring, but the error should be actionable instead of blowing up without further guidance. Specifically, I'd really love for the error to point to the offending files.

### Screenshots or Videos

_No response_

### Platform

- Router / Start Version: 1.131.7
- OS: macOS
- Browser: All
- Bundler: Vite
- Bundler Version: 7.1.7


### Additional context

_No response_

---

## Top Comments

**@rburgst** (+4):

hi, will try to whip something together in the next few days, here is some example for a rough idea

```typescript
import {taskRepository} from './server/task-repository'

export const getListTasks = createServerFn({ method: 'GET' })
  .middleware([authWithLocaleMiddleware])
  .handler(async (ctx) => {
    const tasks = await taskRepository.getTasks()
    return tasks
  })
```
basically this does not work as it would then try to bundle task-repository (and drizzle etc) into the client and there is no obvious way to make this work, regardless of whether the export is a function or anything else...

**@abenhamdine** (+6):

I just discovered this thread after having decided to migrate my Next.js app to TanStack, arggh
I'm puzzled, how is it possible to build even a simple app if we cannot import server code from a server function ?


**@rburgst** (+3):

I am having the same issues, the only remedy i found is going back to the last good commit, then apply the next one and remove lines one after the other until it starts working. It ALWAYS happens when you have server functions that import other server only code.
I mean I dont want to wrap EVERY single utility server method into a server function! This is not going to fly. Also I had some issues integration testing or unit testing server functions (throwing weird error messages around, ended up exporting a stripped down method that didnt include any of the server function stuff.
So in general I...