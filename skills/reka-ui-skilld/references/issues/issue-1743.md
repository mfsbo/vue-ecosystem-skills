---
number: 1743
title: "[Bug]: browser tab freeze when clicked outside of combox inside dialog"
type: bug
state: closed
created: 2025-03-22
url: "https://github.com/unovue/reka-ui/issues/1743"
reactions: 9
comments: 10
labels: "[bug]"
---

# [Bug]: browser tab freeze when clicked outside of combox inside dialog

### Environment

```bash
Developement/Production OS: Fedora Linux 40
Node version: v22.5.1
Package manager: npm@10.8.2
Reka UI version: 2.1.0
Vue version: 3.5.13
CSS framework: tailwindcss@3.4.1
Client OS: Fedora Linux 40
Browser: Google Chrome 134.0.6998.35
```

### Link to minimal reproduction

https://codesandbox.io/p/devbox/872wq5

### Steps to reproduce

1. click on the open dialog button
2. click on the open combobox button
3. click on the comboboox title named `test`

### Describe the bug

when clicked on the combo box title named `test` the tab will freeze  in a loop dissmissableLayer.focusout event is being called in an infinite loop.

### Expected behavior

combobox should just close.

### Context & Screenshots (if applicable)

...

---

## Top Comments

**@joseju77** (+12):

I found that the issue is related to the handleFocusIn function in the FocusScope.vue file.

I wasn't able to run tests to try and fix it properly, but my temporary workaround was to add a focusin event listener directly on the document that stops propagation, preventing handleFocusIn from being triggered.

```ts
// MyComponent.vue
const stopPropagation = (event: Event) => {
    event.stopImmediatePropagation();
};

onBeforeMount(() => {
    document.addEventListener('focusin', stopPropagation);
});

onUnmounted(() => {
    document.removeEventListener('focusin', stopPropagation);
});
``` 

**@s-montigny-desautels** (+10):

Another way that worked for me without disabling focusin in all the app, is to prevent the default behaviour of the default focusin handler of the ComboboxContent. It can be disabled like this:

```vue
	<ComboboxContent @focusOutside.prevent>
		<slot />
	</ComboboxContent>
```

**@kerimovok** (+8):

Hello,
Will it be fixed in the package itself?