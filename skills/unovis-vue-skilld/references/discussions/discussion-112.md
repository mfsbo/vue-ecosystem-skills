---
number: 112
title: Link Label Font Size
category: Q&A
created: 2023-01-20
url: "https://github.com/f5/unovis/discussions/112"
upvotes: 1
comments: 1
answered: true
---

# Link Label Font Size

I'm using a link label function like so:

```
  const linkLabel = useCallback((l) => {
    switch (l.type) {
      case 'A': return { text: 'Affiliated With' };
      case 'B': return { text: 'Owned By' };
      case 'C': return { text: 'Resolves To' };
      default: return { text: l.type || 'UNKNOWN' };
    }
  }, []);
```

And passing it as a property on my `<VisGraph ...>` object like so:
```
...
   <VisGraph
      linkLabel={linkLabel}
     ...
```

The link text is teeny tiny. According to the docs the function should return a `GraphCircleLabel` object, which looks like this:
```
type GraphCircleLabel = {
  text: string;
  color?: string | null; // Optional color
  cursor?: string | null; // Optional cursor on hover
  fontSize?: string; // Optional font size as a CSS string
  radius?: number; // Circle radius in pixels
}
```...

---

## Accepted Answer

@ndtreviv This is definitely a bug, thanks for reporting! I'm planning to fix it this within the next few days.