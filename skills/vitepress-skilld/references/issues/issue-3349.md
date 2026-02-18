---
number: 3349
title: @include markdown and code files from an arbitrary public URL
type: other
state: open
created: 2023-12-16
url: "https://github.com/vuejs/vitepress/issues/3349"
reactions: 7
comments: 4
---

# @include markdown and code files from an arbitrary public URL

### Is your feature request related to a problem? Please describe.

My project spans several repositories under a single GitHub user.  I'm building a vitepress project (which is in its own repository) for documentation and API reference for all my repositories because they are all related to each other.  I like to include Markdown and code snippets from each of the repositories.  

I've tried this for including files from my vitepress repository, like this

```markdown

```

and it works nicely, but 

```markdown

```

does not work.  

It would be very helpful to be able to include arbitrary markdown and code into my vitepress project.  Is there a way to do this?

### Describe the solution you'd like

It would be very helpful to be able to include arbitrary markdown and code into my vitepress project. 

Sections from a Markdown file:
```markdown

```

Lines from a JSON (or any source code) file:
```markdown

```

Is there a way to do this?

### Describe alternatives you've considered

...