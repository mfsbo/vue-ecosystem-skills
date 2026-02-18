---
number: 804
title: Failing tanstack/virtual-core build on NPM (version 3.10.0)
type: other
state: closed
created: 2024-08-19
url: "https://github.com/TanStack/virtual/issues/804"
reactions: 28
comments: 7
---

# Failing tanstack/virtual-core build on NPM (version 3.10.0)

### Describe the bug

bun add v1.1.12 (43f0913c)
error: No version matching "3.10.0" found for specifier "@tanstack/virtual-core" (but package exists)

### Your minimal, reproducible example

N/A

### Steps to reproduce

1. Try to install @tanstack/virtual-core using bun or another package manager.

### Expected behavior

I expected the install to succeed but it failed with an error message

### How often does this bug happen?

Every time

### Screenshots or Videos

_No response_

### Platform

macOS

### tanstack-virtual version

v3.10.0

### TypeScript version

_No response_

### Additional context

_No response_

### Terms & Code of Conduct

- [X] I agree to follow this project's Code of Conduct
- [X] I understand that if my bug cannot be reliable reproduced in a debuggable environment, it will probably not be fixed and this issue may even be closed.

---

## Top Comments

**@piecyk** [maintainer] (+21):

Yes, sorry for the hassle, our auto publish script gone south. @tannerlinsley need to fix it manually.

**@piecyk** [maintainer] (+5):

Fixed

**@rileyjshaw** (+4):

I’m seeing this too when trying to install `@headlessui/react`; I think all packages depending on `@tanstack/virtual-core` won’t be installable until the registry version is fixed.

In the meantime, folks can get unblocked by adding the following to `package.json`:

```
	"overrides": {
		"@tanstack/react-virtual": "3.9.0"
	},
```