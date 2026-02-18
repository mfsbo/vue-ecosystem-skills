---
number: 849
title: shadcn's HoverCard be covered
category: Q&A
created: 2024-10-08
url: "https://github.com/TanStack/virtual/discussions/849"
upvotes: 1
comments: 4
answered: true
---

# shadcn's HoverCard be covered

Hi, I'm trying using this with https://ui.shadcn.com/docs/components/hover-card, however, the HoverCard be covered by next virtual item. Has anyone know how solve this?

here is my code:

```tsx
          <HoverCard>
            <HoverCardTrigger>
              <UserAvatar userName={names} className="w-4" />
            </HoverCardTrigger>
            <HoverCardContent className='z-50'>
              <div>hhhh</div>
            </HoverCardContent>
          </HoverCard>

```

Then this component are rendered as a list item in virtual.




---

## Accepted Answer

I found this problem is caused by translateY, replace it with top can solve this problem:



