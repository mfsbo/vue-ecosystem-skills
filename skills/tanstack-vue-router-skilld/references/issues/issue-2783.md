---
number: 2783
title: Start - Server Function Middleware Included in Client Bundle
type: other
state: open
created: 2024-11-16
url: "https://github.com/TanStack/router/issues/2783"
reactions: 21
comments: 33
labels: "[start, revisit-after-devinxi]"
---

# Start - Server Function Middleware Included in Client Bundle

### Which project does this relate to?

Start

### Describe the bug

Calling a serverFn using middleware in the client with `useServerFn` results in server side code being included in client bundle.

I'll try to get a minimal reproduction later this weekend or early next week.  But here is an example of the issue.  

### Your Example Website or App

StackBlitz Reproduction Link

In this example, `app/routes/index.tsx` contains an client only middleware that causes the issue.  If you uncomment the server section the error will go away.

### Steps to Reproduce the Bug or Issue



Basic Example:
```ts
import { getSupabaseServerClient } from "@/features/supabase/utils";
import { createServerFn, createMiddleware } from "@tanstack/start";
import { useQuery } from "@tanstack/react-query";
import { z } from 'zod'


export const authMiddleware = createMiddleware().server(async ({ next }) => {
  const supa = getSupabaseServerClient();
  const user = await supa.auth.getUser();
  return next({ context: { user } });
});

const serverFilters = z.object({ })


const getQuery = createServerFn({ method: "GET" })
  .middleware([authMiddleware])
  .validator((input: unknown) => serverFilters.parse(input))
  .handler(async ({ data, context }) => {
    ...
  });

function useQueryData(data: any) {
    const getData = useServerFn(getQuery);
    return useQuery({
      queryKey: ["id", JSON.stringify(filters)],
      queryFn: () => getData({ data: filters }),
    });
  
}

```




Client Side Error:
I see a request for the file "@/features/supabase/utils", and get this console error.

...