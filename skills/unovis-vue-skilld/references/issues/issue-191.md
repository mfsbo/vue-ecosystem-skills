---
number: 191
title: "Feature Request for Graph: layoutNonConnectedHidden"
type: question
state: open
created: 2023-04-26
url: "https://github.com/f5/unovis/issues/191"
reactions: 0
comments: 0
labels: "[enhancement, help wanted, Accepting PRs]"
---

# Feature Request for Graph: layoutNonConnectedHidden

I've developed a link filtering system to go with my graph to help users hide information that is spurious to their investigation.
I also have global node type filters.

At the moment I have to:
1. apply global filters by filtering out node types that should be hidden
2. remove links according to the link filtering system
3. filter nodes that are no longer connected to anything
4. filter nodes that are no longer connected to the starting node

This new setting would relieve some of that pain 