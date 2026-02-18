---
number: 1645
title: "PRO: Autocomplete throws `Cannot use 'in' operator to search for '__original' in undefined` error if calls to load more return empty object, array, or `undefined`/`null`"
type: bug
state: open
created: 2025-04-29
url: "https://github.com/formkit/formkit/issues/1645"
reactions: 1
comments: 0
labels: "[ bug, Pro]"
---

# PRO: Autocomplete throws `Cannot use 'in' operator to search for '__original' in undefined` error if calls to load more return empty object, array, or `undefined`/`null`

### Reproduction

https://formkit.link/2ed12fd23e4c261b97415bb80ea46e35

### Describe the bug

Our sentry error logs are getting blown up by this error, and this seems to be at least one way to get there. Because this is a pro component it's been mostly trial and error, so I'm unsure if there are other ways of getting here or not. 

Basically if a call to load more, either via loading on scroll or the load more option, returns no additional options via an empty object, empty array, or undefined/null, an error will get thrown.

Also wanted to point out that if you change that second page call to return actual results, then click that loading option multiple times while waiting for more options to load, all options will be completely replaced upon the last promise being resolved. 

...