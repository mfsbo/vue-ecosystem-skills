---
number: 251
title: Dark Mode out of the box
type: other
state: closed
created: 2021-02-27
url: "https://github.com/vuejs/vitepress/issues/251"
reactions: 15
comments: 10
labels: "[theme]"
---

# Dark Mode out of the box

**Is your feature request related to a problem? Please describe.**
Dark mode is becoming ever more popular, with a number of benefits such as less strain on the eyes, and less battery consumption.
Plus, it's cool.

It would be nice if VitePress would ship dark mode out of the box.

**Describe the solution you'd like**
It seems to me that dark mode would be quite simple to implement due to the existing architecture of the default theme. Since CSS Variables are used and are all found in vars.css, the most simple solution solution would likely to modify the value of the variables based on the user's preference.

Currently, this is what vars.css looks like:

``` css
:root {

  --c-white: #ffffff;
  --c-black: #000000;

  ...

}
```

Using `prefers-color-scheme`, we could do the following:

``` css
@media (prefers-color-scheme: light) {
  :root {

    --c-white: #ffffff;
    --c-black: #000000;

    ...

  }
}
@media (prefers-color-scheme: dark) {
  :root {

    --c-white: #000000;
    --c-black: #ffffff;

    ...

  }
}
```

Of course, there are more subtleties to the change, such as dealing with shadows and such, all of which will have to adjusted to work for dark mode as well, but in general, I believe this approach should make the implementations relatively straightforward.

Another minor point that will need to be addressed is the naming convention for the variables. Since white becomes black in dark mode, it would probably be clearer if we renamed `--c-white` to something along the lines of `--c-background`.

**Describe alternatives you've considered**
I don't see any obvious alternatives, both in idea and implementation.

Of course, one could simply do away with dark mode, but we would be missing out on its benefits.

**Additional...