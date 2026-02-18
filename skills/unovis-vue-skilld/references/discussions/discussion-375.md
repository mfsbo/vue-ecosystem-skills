---
number: 375
title: Rerendering Whole Network Programatically
category: Q&A
created: 2024-04-05
url: "https://github.com/f5/unovis/discussions/375"
upvotes: 1
comments: 6
answered: true
---

# Rerendering Whole Network Programatically

We're in the middle of migrating microbetrace.cdc.gov from using d3.js to Unovis (Angular).  

I've looked at documentation and gallery examples, but I don't see how I can programatically trigger rerendering of the entire network to, for instance, trigger the nodeLabel function to run on all nodes after I change another variable that the nodeLabel function considers.

For Example: 
```
 nodeLabel = (n: NodeDatum, i: number) => this.getLabelByVariable(i)
 
 getLabelByVariable( index : number) {

        // If no label variable then should be none
        if (this.widgets['node-label-variable'] == 'None') {
            return '';
        } else {
            return this.session.data.nodes[index][this.widgets['node-label-variable']]
        }
    }
```

I have another funct...

---

## Accepted Answer

Figured it out! I had to reassign a new data object, rather than a nodes array.  Since the entire data object is what's being passed to the graph (not the nodes/links), you must reassign that object instead and it rerenders all nodes/links again.

That being said, the whole network rearranges itself when rerendering, which may prove frustrating when you've moved everything into a specific position. 