---
number: 1660
title: "FormKit Pro + Nuxt 4: input types not recognised"
type: other
state: closed
created: 2025-08-06
url: "https://github.com/formkit/formkit/issues/1660"
reactions: 6
comments: 1
labels: "[ release-ready,  priority-1]"
---

# FormKit Pro + Nuxt 4: input types not recognised

### Reproduction

https://github.com/davidsandoz/repro-formkit-pro-nuxt-4

### Describe the bug

Formkit Pro inputs are not recognised when using Nuxt 4.

Taking the reproduction link as an example, we get the following error when running `nuxi typecheck`:
```
app/app.vue:29:16 - error TS2322: Type '"repeater"' is not assignable to type '"number" | "submit" | "button" | "form" | "meta" | "select" | "textarea" | "time" | "text" | "checkbox" | "color" | "date" | "datetime-local" | "email" | "file" | "group" | "hidden" | ... 9 more ... | undefined'.

29       <FormKit type="repeater" name="invitees" label="Invitees" help="Who else should we invite to FormKit?">
                  ~~~~

  node_modules/@formkit/inputs/dist/index.d.mts:117:9
    117         type: 'number';
                ~~~~
    The expected type comes from property 'type' which is declared here on type '(FormKitInputs<{ type: "repeater"; name: string; label: string; help: string; }> & VNodeProps) & AllowedComponentProps & ComponentCustomProps'


Found 1 error.


 ERROR  Process exited with non-zero status (2)                                                                                                                                                            15:28:48

    at R._waitForOutput (node_modules/tinyexec/dist/main.js:530:13)
    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)
    at async Object.run (node_modules/@nuxt/cli/dist/chunks/typecheck.mjs:63:5)
    at async runCommand (node_modules/citty/dist/index.mjs:316:16)
    at async runCommand (node_modules/citty/dist/index.mjs:307:11)
    at async runMain (node_modules/citty/dist/index.mjs:445:7) 



...

---

## Top Comments

**@ayalon** (+1):

Possible workaround:
```      <FormKit
        v-model="borderRadiusDefault"
        :type="'slider' as any"
        label="Radius"
        min="0"
        max="20"
        step="1"
      />``` 

Also works with repeater.