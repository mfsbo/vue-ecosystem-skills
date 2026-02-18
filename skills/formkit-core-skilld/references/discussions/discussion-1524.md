---
number: 1524
title: Recommended way to use dropdown's dynamic options with TanStack Query
category: General
created: 2024-10-14
url: "https://github.com/orgs/formkit/discussions/1524"
upvotes: 4
comments: 0
answered: false
---

# Recommended way to use dropdown's dynamic options with TanStack Query

Hi there!

I am actually using Formkit Pro and TanStack Query in the same project and I am wondering what is the best approach to combine the advantages of both solutions, especially with dynamic loading of options with Dropdown or Autocomplete.

### TanStack Query intro

For those not familiar with TanStack Query, each time you want to perform a fetch, you would do something like this:

```js
const { data, isLoading, refetch } = useQuery({
  queryKey: ['todos'],
  queryFn: fetchTodoList,
})
```

You would get these variables (among many others):

- `data`: a computed variable containing the result of the request (it is undefined before the fetch request is performed)
- `isLoading`: a computed variable indicating that the fetch request is being made
- `refetch`: a functi...