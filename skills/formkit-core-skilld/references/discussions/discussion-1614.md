---
number: 1614
title: Cant get styles to work at all
category: General
created: 2025-02-13
url: "https://github.com/orgs/formkit/discussions/1614"
upvotes: 1
comments: 3
answered: false
---

# Cant get styles to work at all



I am not opening an issue unless its a bug , this probably is user error.

I used the steps on the website after theme customization but my forms still have the default theme.



What could be the issue ?

---

## Top Comments

**@LamprosPitsillos** (+1):


```js
import { plugin, defaultConfig } from '@formkit/vue'
import config from '../formkit.config.mjs'
....
/** Loading Splash */
app.use(plugin, defaultConfig(config()));
```

What seemed to make it work was passing in the default config the config object and calling it

**@LamprosPitsillos**:

>  I'm not sure if the file type has anything to do with it, but the instructions use ts and you have mjs in your import so check that just in case. Mjs file type should be fine though since you're using ECMAscript modules in a node environment but check that as well. Also make sure that what you have in package.json reflects the file types you're using. 

The `.mjs`  format was the result of running the form kit command to generate a theme , my project does not actively use `.mjs` files.
```json
// package.json
...
  "type": "module",
 ...
```

> My guess is that your root classes a...

**@Eyesore123**:

My guess is that your root classes aren't imported correctly. Check your imports and make sure your tailwind.config file is also correctly set up. Usually when styles don't load and there are no visible errors, it means that import fails for some reason. I'm not sure if the file type has anything to do with it, but the instructions use ts and you have mjs in your import so check that just in case. Mjs file type should be fine though since you're using ECMAscript modules in a node environment but check that as well. Also make sure that what you have in package.json reflects the file types you'r...