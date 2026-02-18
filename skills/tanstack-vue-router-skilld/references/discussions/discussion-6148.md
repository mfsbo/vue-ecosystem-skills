---
number: 6148
title: url rewrite with better-auth backend
category: Q&A
created: 2025-12-19
url: "https://github.com/TanStack/router/discussions/6148"
upvotes: 2
comments: 0
answered: false
---

# url rewrite with better-auth backend

I have better-auth backend and user better-auth client with this rewrite and in serverFn use authClient.getSession and pass cookie and get data with out problem but when try authClient.useSession show like this:

and this my setup
```
const config = defineConfig({
  plugins: [
    devtools(),
    nitro({
      routeRules: {
        '/api/**': {
          proxy: 'https://example.com/api/**',
        },
      },
    }),

    // this is the plugin that enables path aliases
    viteTsConfigPaths({
      projects: ['./tsconfig.json'],
    }),
    tailwindcss(),
    tanstackStart(),
    viteReact(),
  ],
})
```
...