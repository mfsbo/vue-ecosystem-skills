---
number: 137
title: Jest module errors with unovis react
category: Q&A
created: 2023-02-09
url: "https://github.com/f5/unovis/discussions/137"
upvotes: 1
comments: 1
answered: true
---

# Jest module errors with unovis react

Unovis react exports ES modules, which jest does not support by default. Tests for files that import `@unovis/react` will see errors like this
```
SyntaxError: Unexpected token 'export'
```
What can you do to fix jest configuration when using `@unovis/react`?

---

## Accepted Answer

Assuming you are using babel-jest (and not ts-jest), you can let babel transform unovis and its esm dependencies by adding a transformIgnorePatterns to your jest config.

Here is a pattern of unovis and its dependencies to transform for @unovis/react and @unovis/ts v1.0.2

```
transformIgnorePatterns: [
    "node_modules/(?!(d3.*|internmap|delaunator|lodash-es|robust-predicates|@unovis)).*",
  ],
```