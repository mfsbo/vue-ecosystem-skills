---
number: 908
title: v2
type: other
state: closed
created: 2024-05-11
url: "https://github.com/unovue/reka-ui/issues/908"
reactions: 60
comments: 29
---

# v2

# Announcement: Changes Coming to Radix Vue

## Introduction
First and foremost, we really want to express appreciation for all the effort put in by the Radix UI team in creating the absolutely powerful, unstyled, high-quality, and accessible components that this project was originally ported from.

## Background
However, as feature requests grew, Radix Vue began to add more components and features, and modify certain behaviors specifically tailored for Vue. As a result, Radix Vue started to feel like a unique component library rather than just the ported version of Radix UI. Therefore, we are planning to give it a different identity.

## What's Coming in v2?
- Brand change
- NPM registry change
- Some component refactoring link to project https://github.com/radix-vue/radix-vue/labels/v2



## Note
1. We will still be pushing bug fixes and introducing some new primitive components prior to the v2 release.
2. We are still brainstorming the new identity name. Please share any ideas you have in the comments below.
3. We are open to suggestions for areas of improvement. Please ensure that any suggestions are sensible and would result in a general improvement rather than addressing only a specific edge-case.


> [!IMPORTANT]
> We understand that these changes may require some major adjustments in your project, and we apologize for any inconvenience in advance.



---

## Top Comments

**@k11q** [maintainer] (+22):

Hi @zernonia ! Big decision! I had my concerns but after several thought and looking back at the project, I think a rebrand is a really good idea! I think what you and other contributors have been building and currently building has turned this library into a very big project, and in many sense it has grown larger than the radix primitives. I think a rebrand is sign of growth and by detaching from the previous radix brand, it removes a significant blocker, allowing decisions to be made without the concern of fitting the radix brand. Overall i'm very excited for the future of the library and se...

**@zernonia** [maintainer] (+6):

@Rolanddoda  Yes in the description we mention that v2 will have breaking changes (major adjustments in your project). Worry not that we will mentioned all of that breaking changes in the changelog, and will be releasing `rc`'s earlier too.

@cyyynthia Currently we try our best to follow semver , especially for the breaking changes part. In minor version we have new changes but with deprecation warning, unless for `alpha` component. But we try to minimize the breaking in `alpha` as well and aimed to publish major changes in the same minor version.



**@teleskop150750** (+19):

What I would like to see in Radix-vue and what I am trying to implement in my fork perigee-ui

1) I use let variables or useRef where React uses useRef. Radix-vue [creates unnecessary reactive ref](https://github.com/radix-vue/radix-vue/blob/3f0f965fcf6fc...