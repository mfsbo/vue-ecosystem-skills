---
number: 6529
title: How to create a url contains special char like '.'
category: Q&A
created: 2026-01-27
url: "https://github.com/TanStack/router/discussions/6529"
upvotes: 1
comments: 2
answered: false
---

# How to create a url contains special char like '.'

Hi guys I'm trying to build a new system to replace a very old php system, and I plan to create some routes for example 'something.php' and then parse the params and redirect to the modern route. But we know that '.' means a path splitter, so 'something.php.tsx' will be recognized as '/something/php', which is unexpected.

So if there is any way to suppress that don't think '.' is a path splitter? 

---

## Top Comments

**@CanRau**:

According to File Naming Conventions on `[x] Escaping` `[.]` should work
> Square brackets escape special characters in filenames that would otherwise have routing meaning. For example, script[.]js.tsx becomes /script.js and api[.]v1.tsx becomes /api.v1.

You might need to add `.` to `pathParamsAllowedCharacters` in `createRouter` tho https://tanstack.com/router/latest/docs/framework/react/guide/path-params#allowed-characters

**@BrendanC23**:

Also see https://github.com/TanStack/router/discussions/3834. I'm not sure if this has been implemented yet.