---
number: 1950
title: Manually controlling Dialog's closing functionality
category: Q&A
created: 2025-05-27
url: "https://github.com/unovue/reka-ui/discussions/1950"
upvotes: 1
comments: 1
answered: true
---

# Manually controlling Dialog's closing functionality

Hi,

I apologise for the title if it makes no sense.

I'm trying to control the triggering of multiple dialogs, although I am able to do this, some of the default functionality does not seem to work. 

For context, I have a dialog to confirm a users password, and a dialog to setup 2FA (using Laravel Fortify). Both dialog are in their own `Vue` components as the Confirm password modal is a shared component. Both components expose some functions.

When a user clicks the `DialogTrigger` within the TwoFactor dialog to setup a 2FA, I first have to do a check if a password was confirmed recently for the user, if not, I trigger the ConfirmPassword dialog to open instead via an exposed function to manually set the ConfirmPassword dialog `open` state to `true`

However when I do this, I f...

---

## Accepted Answer

Well... turns out, the state is updated - and this was a simple "sleep on it" solution.

I had simply forgotten a `v-model` on the in front of the `:open` prop. My code should have been

```ts
<DialogRoot v-model:open="showModal">
    // ...
</DialogRoot>
```

You live and you learn. Hope this helps others they are experiencing the same.