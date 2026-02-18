---
number: 1492
title: How to Limit Invalid Styling to Invalid Inputs (on Submit)
category: General
created: 2024-08-30
url: "https://github.com/orgs/formkit/discussions/1492"
upvotes: 1
comments: 0
answered: false
---

# How to Limit Invalid Styling to Invalid Inputs (on Submit)

Hi,

I am using Formkit (v1.6.5) on a few large forms in my project.

## Problem

On submit, if one input in my forms is invalid, all inputs are styled as invalid. How can I limit the invalid styling to the inputs, where validation fails? Any help is highly appreciated.

<img width="520" alt="Screenshot 2024-08-30 at 10 13 09" src="https://github.com/user-attachments/assets/c4100940-b7a9-407e-9d82-e3f9239096b6">


## My Configuration

in my `formkit.config.js`, I am defining a theme using TailwindCSS classes. Here is the gist of it:

```javascript

import { generateClasses } from "@formkit/themes";

// ...
const theme = {
   text: {
      input: "... formkit-invalid:bg-red-100 formkit-errors:bg-red-100"
      //...
   }
   //...
}

//...

export default {
    config: {
        classes: generateClasses(theme),
    },
    //...
};

```...