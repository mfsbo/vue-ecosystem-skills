---
number: 597
title: Beta.87 Link Path Changes but Page Content Fails to Load
type: other
state: closed
created: 2023-05-08
url: "https://github.com/TanStack/router/issues/597"
reactions: 47
comments: 28
---

# Beta.87 Link Path Changes but Page Content Fails to Load

### Describe the bug

The bug is causing a problem where clicking on a link does not load the content of the requested page, even though the link path changes correctly. 

### Your Example Website or App

https://e4296ea1.dayplanr.pages.dev/

### Steps to Reproduce the Bug or Issue

To reproduce go to example website and click Privacy Policy link, path will change to /privacy but content will be not update.

### Expected behavior

On clicking Link content for /privacy page should load.

### Screenshots or Videos

_No response_

### Platform

- OS: [e.g. macOS, Windows, Linux]
- Browser: [e.g. Chrome, Safari, Firefox]
- Version: [e.g. 91.1]


### Additional context

_No response_

---

## Top Comments

**@janek26** (+29):

Same issue.

Until then use the latest version without the issue:
```diff
// package.json
-     "@tanstack/router": "0.0.1-beta.89",
+     "@tanstack/router": "0.0.1-beta.86",
```

**@tannerlinsley** [maintainer] (+4):

I’ll check it out soon.

Tanner Linsley
On May 8, 2023 at 8:14 AM -0600, Hosmel Quintana ***@***.***>, wrote:
> Still not working for me in the latest beta (89).
> https://user-images.githubusercontent.com/1166143/236847172-00108e01-91ea-44cb-a16f-a5aa536bb1aa.mp4
> —
> Reply to this email directly, view it on GitHub, or unsubscribe.
> You are receiving this because you commented.Message ID: ***@***.***>


**@AndrewOttavianoAbb** (+2):

Can confirm this happens with the `useNavigate` hook as well in a simple CRA app.