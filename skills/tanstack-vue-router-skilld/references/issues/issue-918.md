---
number: 918
title: Accessibility
type: feature
state: open
created: 2024-01-04
url: "https://github.com/TanStack/router/issues/918"
reactions: 47
comments: 14
labels: "[enhancement]"
---

# Accessibility

### Describe the bug

Now that tanstack router has reached v1, I was excited to try it because accessibility was promised for 1.0. I fired up one of the examples and was very disappointed to find no route announcements or focus management.

When a screen-reader user (or even a sighted keyboard user) activates a regular link, the browser will move focus to the top of the new page and the screen-reader announces meta information about the new page.

When the same user activates a `<Link>` from tanstack-router, the focus stays where it is or gets lost (if the link is no longer present on the new route), and the screen-reader provides absolutely no feedback. From a blind user's perspective, it's as if nothing happened or their input was ignored.

Okay, fair enough, maybe it's opt-in or there's some helpers available. So I go through the docs, and am again disappointed to find no mention of accessibility at all. So tanstack-router users are completely on their own if they want to make their applications accessible. In absence of any guidance, it's safe to assume that many (if not most) developers are not going to do that.

### Your Example Website or App

https://stackblitz.com/github/tanstack/router/tree/main/examples/react/kitchen-sink-file-based

### Steps to Reproduce the Bug or Issue

1. Open the page in any common screen-reader+browser combination (such as Safari+VoiceOver or Firefox+NVDA or Chrome+Talkback Android).
2. Traverse through the page using arrow keys (might also need to hold down a modifier key; see VO instructions) or <kbd>Tab</kbd>.
3. Activate one of the links in the sidebar.
   - The navigation happens silently, focus stays on the link.

### Expected behavior

Screen-reader users should receive some feedback when clicking a link, such as "Navigated to page [title]". Focus should also general...

---

## Top Comments

**@levrik** (+4):

@gregmsanderson There's a fix for https://github.com/adobe/react-spectrum/issues/6587 which is waiting to get reviewed in https://github.com/adobe/react-spectrum/pull/6591. I'm already successfully using it through `pnpm patch` at work in production.

I also created wrapper components for RAC. Internally I'm simply remapping all of TanStack Router's props to `href` and `routerOptions`. Auto-completion works like with TanStack Router's native `Link` component as I'm using the same generics setup. Preloading doesn't work right now but should be possible to add by some more rewiring. It's not s...

**@CHE1RON** (+2):

Try this:

```typescript
declare module '@adobe/react-spectrum' {
  interface RouterConfig {
    href: ToPathOption<RegisteredRouter, '/', '/'> | ({} & string);
    routerOptions: Omit<NavigateOptions, 'to' | 'from'>;
  }
}

<Provider
  // ..

  router={{
    /**
     * NOTE:
     * This DOES NOT represent the "official" implementation as described in the docs,
     * but rather a workaround from the nice people over at GitHub,
     * see https://github.com/adobe/react-spectrum/issues/6413
     */
    navigate: (to, options) => router.navigate({ ...options, to: to as ToPathOption<RegisteredRouter, '/', '/'> }),
    useHref: (to) => router.buildLocation({ to }).href,
  }}
>
  {props.children}
</Provider>
```...

**@TheBinaryGuy** (+1):

As a temporary workaround, you could use @react-aria/live-announcer combined with static route data to announce route changes.

Here's a small PoC, not sure if it's the "right" way though:
https://github.com/TheBinaryGuy/tsr-live-announcer

Important part is the `RouteAnnouncer` component.