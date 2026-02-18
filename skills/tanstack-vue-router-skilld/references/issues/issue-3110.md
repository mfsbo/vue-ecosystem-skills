---
number: 3110
title: `useLocation` re-renders before navigating
type: other
state: open
created: 2025-01-04
url: "https://github.com/TanStack/router/issues/3110"
reactions: 15
comments: 10
---

# `useLocation` re-renders before navigating

 To anyone stumbling here: this is not a bug, it's an issue with the documentation. All of us migrating from `react-router-dom` are used to using `useLocation` for everything, but with `tanstack/router`, there are different hooks for different purposes: https://tanstack.com/router/latest/docs/framework/react/api/router


 THIS IS THE SOLUTION TO YOUR PROBLEM 
> [!IMPORTANT]
> **TL;DR**:
> `useLocation` is about the URL, you *most likely* do not care about the URL. What you care about is probably: 
> - the *routes* => `useMatch`, `useMatches`, `useChildMatches`, `useParentMatches`
> - the params => `useParams`, `useSearch`

 THIS IS THE SOLUTION TO YOUR PROBLEM 


----

### Which project does this relate to?

Router

### Describe the bug

Assuming a simple route like this:
```ts
export const Route = createFileRoute('/about')({
  component: AboutComponent,
});

function AboutComponent() {
  const {pathname} = useLocation()
  console.log(pathname)
  return (
    <div className="p-2">
      <h3>About</h3>
    </div>
  );
}
```

My naive assumption would be that the only value `pathname` can ever have here is `"/about"`, but in reality, this will also re-render just before navigating away, with `pathname` having the value of the **next page**.

Alternatively, we can also use the following:
```ts
const pathname = useRouterState({ select: (s) => s.resolvedLocation.pathname });
```

But in that case, `pathname` will *initially* have the value of the **previous page** before immediately re-rendering with the current page.

One way to access the `pathname` that seems stable is this:
```ts
const pathname = useMatch({ strict: false, select: (s) => s.pathname });
```


### Your Example Website or App

https://stackblitz.com/edit/tanstack-router-fpv611d5?file=src%2Froutes%2F_yo%2Fabout.tsx

### Steps to Reproduce the Bug or Issue

1. Go to '/about' in the demo above
2. open the console to see what gets logged
3. Go to any other page

...