---
number: 3254
title: Searchable tags
type: other
state: open
created: 2023-11-24
url: "https://github.com/vuejs/vitepress/issues/3254"
reactions: 19
comments: 9
---

# Searchable tags

### Is your feature request related to a problem? Please describe.

I am always frustrated when searching for related content across the site.

### Describe the solution you'd like

It might be a great idea to have some kind of tag system very much like the way a hashtag works, where you can set the tags in the frontmatter and the vitepress tool would automatically inject those tags at the top of the page or the bottom of the page. These tags would then become searchable via the built-in search tool or you could have a list of tags in the sidebar appear, so when you click on a tag it will display or the related content that is associated to that tag.

### Describe alternatives you've considered

I have not tried any alternatives, I believe that Vitepress does not provide an alternative solution.

### Additional context

I am building a resource for making the law more approachable and accessible to the everyday South African called lawforidiots.org, I have realized that the way that i intend for the content to be laid out would require some kind of tagging system because there will eventually be a lot of content that is related overtime. Therefore, a tagging system would be the best way to go. I see there is another ticket https://github.com/vuejs/vitepress/issues/3029 but I thought I would create a duplicate just for more context on the matter

### Validations

- [X] Follow our Code of Conduct
- [X] Read the docs.
- [X] Read the Contributing Guidelines.
- [X] Check that there isn't already an issue that asks for the same feature to avoid creating a duplicate.

---

## Top Comments

**@shailen-naidoo** (+4):

@jtgober Having searchable tags would be such an amazing feature. For example, with the in-built search you could just do `tag:<tag-name>` to find all the related documents. 

**@jtgober** (+4):

I’d like to second this. Adding tags to the frontmatter  would be an awesome addition. I believe docusaurus does this for their blogs

**@anatolinicolae** (+3):

We've tried implementing this in an awful way, but already feels better since search now includes the result we want to pop for certain tags.

https://github.com/thundersquared/apiscp-notes/commit/f2d2641cf2027de0fef3f1167c9373259363a956

Best thing I guess would probably be including rendered frontmatter fields in the IndexObject to allow then (1) field resolution via dot-notation and (2) weighting based on custom fields, achieving something similar to what's d...