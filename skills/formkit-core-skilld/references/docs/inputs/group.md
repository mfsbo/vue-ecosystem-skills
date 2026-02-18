# Group Input

An invisible FormKit input that allows you to logically structure your form data as an object.

> **Warning:** The group input does not render any output to the DOM. It is used exclusively for structuring data in your form. It is equivalent to an object in JavaScript.

The `group` input allows you to structure data from child inputs as an object. The group itself outputs no markup by default and can be used in conjunction with any other type of input — including nested groups and [lists](/inputs/list).

The value of a group input is an object where the keys are the names of the inputs, and the object’s values are each input’s value. In addition to structuring data, groups can determine the validation state, provide initial values, and supply plugins and configuration to all of its children.

## An example

### Example: Group input

#### group.vue

```vue
<FormKit type="group" name="address">
      <FormKit type="text" label="Street address" name="street" />
      <FormKit type="text" label="City" name="city" />
      <div class="flex gap-4">
        <FormKit type="select" label="State" name="state" :options="states" />
        <FormKit type="text" name="zip" label="Zip" />
      </div>
    </FormKit>
```

## Validity of children

Groups are always aware of the validation state of their children (including nested children). You can access this data in the [context](/essentials/configuration) object of the input (`context.state.valid`).

### Example: Group input

#### group-validity.vue

```vue
<h2 class="text-2xl font-bold mb-4">Register</h2>
  <FormKit name="account" type="group">
    <template #default="{ state: { valid } }">
      <div v-if="!valid" class="not-valid">
        Your account details are not complete!
      </div>
      <div v-else class="valid">It all looks good 👍</div>
      <FormKit
        label="Username"
        name="username"
        help="Select a new username"
        validation="required|alpha"
      />
      <FormKit label="Password" name="password" validation="required" />
      <FormKit
        label="Password"
        name="password_confirm"
        help="Confirm your password"
        validation="required|confirm"
      />
    </template>
  </FormKit>
```

## Showing error & validation messages

Even though a `group` can have validation rules and input errors, it does not include any functionality to show validation messages and errors by default. The group ships no HTML at all. If you’d like to display those errors — you can add the `<FormKitMessages />` as a child of the `group`.

> **Tip:** Further documentation on the FormKitMessages component can be found on the form documentation page.

## Props & Attributes

### Universal Props

| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `disabled` | `Boolean` | `false` | Disables all the inputs in the group. |

## Sections

The `group` input renders no output to the DOM so there are no sections to display. The `group` input is a renderless input that is used exclusively for structuring data in your form. It is equivalent to an object in JavaScript.
