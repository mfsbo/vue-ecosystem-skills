# FormKit Schema

Harness all the power of FormKit in a serializable, JSON-compatible schema language.

# Schema

## Introduction

FormKit's schema is a JSON-serializable data format for storing DOM structures and component implementations, including FormKit forms. Although created specifically for implementing and generating forms, the format is capable of generating any HTML markup or using any third-party components.

Schemas are rendered using FormKit's `<FormKitSchema>` component, which is not registered globally by default. You will need to import it:

```
import { FormKitSchema } from '@formkit/vue'

```

## Form generation example

FormKit ships with first-class support for generating forms using schema. This makes it possible to store generated forms in databases, files, or even QR codes! To generate a form, pass your schema array to the `<FormKitSchema>` component using the `:schema` prop.

```
<FormKitSchema :schema="yourSchemaArray" />

```

Let’s look at a quick example:

### Example: Generating forms

#### generating.vue

```vue
[
          {
            $el: 'h1',
            children: 'Register',
            attrs: {
              class: 'text-2xl font-bold mb-4',
            },
          },
          {
            $formkit: 'text',
            name: 'email',
            label: 'Email',
            help: 'This will be used for your account.',
            validation: 'required|email',
          },
          {
            $formkit: 'password',
            name: 'password',
            label: 'Password',
            help: 'Enter your new password.',
            validation: 'required|length:5,16',
          },
          {
            $formkit: 'password',
            name: 'password_confirm',
            label: 'Confirm password',
            help: 'Enter your new password again to confirm it.',
            validation: 'required|confirm',
            validationLabel: 'password confirmation',
          },
          {
            $cmp: 'FormKit',
            props: {
              name: 'eu_citizen',
              type: 'checkbox',
              id: 'eu',
              label: 'Are you a european citizen?',
            },
          },
          {
            $formkit: 'select',
            if: '$get(eu).value', // 👀 Oooo, conditionals!
            name: 'cookie_notice',
            label: 'Cookie notice frequency',
            options: {
              refresh: 'Every page load',
              hourly: 'Ever hour',
              daily: 'Every day',
            },
            help: 'How often should we display a cookie notice?',
          },
        ],
```

We see many features above including the `$el` and `$cmp` props, the `$formkit` prop shorthand, validation, conditional rendering, labels, help text, and multiple types of inputs. We'll unpack all these features in the remainder of this page.

## Schema array

A schema is an array of objects or strings (called "schema nodes"), where each array item defines a single schema node. There are 3 types of of schema nodes:

1. **Text nodes** — produced by strings.
2. [HTML elements](#html-elements-el) — defined by the `$el` property.
3. [Components](#components-cmp) — defined by the `$cmp` property.
4. [FormKit components](#shorthand) — defined by the `$formkit` property. Syntactic sugar for the full `$cmp` format.

Schemas support advanced features like [conditional logic](#conditionals), [boolean operators](#expressions), [loops](#loops), [slots](#slots), and [data scoping](#references) — all guaranteed to serialize to a string.

## HTML elements ($el)

HTML elements are defined using the `$el` property. You can use `$el` to render any HTML element. Attributes can be added with the `attrs` property, and content is assigned with the `children` property:

### Example: Schema - elements

#### schema-elements.vue

```vue
[
          {
            $el: 'div', // try an h1!
            attrs: {
              style: { color: 'red' },
              'data-foo': 'bar',
            },
            children: 'Hello world',
          },
        ]
```

> **Tip:** Notice in the above example that the style attribute is unique in that it should be defined as an object of style to value pairs rather than a string.

## Components ($cmp)

Components can be defined with the `$cmp` property. The `$cmp` property should be a string that references a globally defined component or a component passed
into `FormKitSchema` with the `library` prop:

### Example: Schema - components

#### schema-components.vue

```vue
<script setup>
import { markRaw } from 'vue'

// A custom component, typically imported from elsewhere
const CustomComponent = {
  props: ['name'],
  template: `Hello {{ name }}`,
}

// Assign the custom component a library
const library = markRaw({
  MyComponent: CustomComponent,
})

// Reference the key of the desired component from
// the library.
const schema = [
  {
    $cmp: 'MyComponent',
    props: {
      name: 'Jane',
    },
  },
]
</script>

<template>
  <FormKitSchema 
    :schema="schema" 
    :library="library" 
  />
</template>
```

> **Warning:** In order to pass concrete components via the library prop, it's best to wrap your library with Vue’s markRaw signature.

## References

In addition to the schema array (and optional library), the `FormKitSchema` object can also include a `data` prop. Values from the data object can then be referenced directly in your schema — and your schema will maintain the reactivity of the original data object.

To reference a value from the data object, you use a dollar sign `$` followed by the property name from the data object. References can be used in `attrs`, `props`, conditionals and as `children`:

### Example: Schema - data

#### schema-data.vue

```vue
<script setup>
import { reactive } from 'vue'

const schema = [
  {
    $el: 'h1',
    children: [
      'Hello ',
      '$location'
    ],
    attrs: {
      class: 'text-2xl font-bold mb-4'
    }
  }
]

const data = reactive({
  location: 'World'
})

const move = () => {
  data.location = data.location === 'World' ? 'Mars' : 'World'
}
</script>

<template>
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
  <FormKit type="button" @click="move">
    Change location
  </FormKit>
</template>
```

> **Warning:** Notice in the above example that we used an array to concatenate "Hello" and "$location". We did this because data references and logical expressions in the schema must always begin with a dollar sign $ — otherwise they are treated as unparsed string literals.

### Referencing functions

Schemas support calling functions that are in your original reference data — and you can even pass data references as arguments of that function!

### Example: Schema - functions

#### schema-functions.vue

```vue
<script setup>
import { reactive } from 'vue'

const schema = [
  {
    $el: 'h1',
    children: [
      '$count',
      ' + 5 = ',
      '$add($count, 5)'
    ],
    attrs: {
      class: 'text-2xl font-bold mb-4'
    }
  }
]

const data = reactive({
  count: 3,
  add: (a, b) => a + b
})
</script>

<template>
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
  <FormKit type="button" @click="data.count++">Add To Count</FormKit>
</template>
```

### Deep references

Just like JavaScript — you can access properties of a deeply nested object using dot-syntax `object.property`:

### Example: Schema - functions

#### schema-dot-syntax.vue

```vue
<script setup>
import { reactive } from 'vue'

const schema = [
  {
    $el: 'h1',
    children: '$orchard.tree.fruit',
    attrs: {
      class: 'text-2xl font-bold mb-4'
    }
  }
]
const data = reactive({
  orchard: {
    tree: {
      fruit: 'apple'
    }
  }
})
</script>

<template>
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
</template>
```

> **Info:** Schema references can have any structure or properties, but at the root of the data reference object there are 2 reserved words: $slots and $get.

## Expressions

Schemas also support logic in the form of boolean logic, comparison, and arithmetic expressions. These expressions can be used anywhere a data reference can be used (`attrs`, `props`, conditionals, and `children`):

### Example: Schema - expressions

#### schema-expressions.vue

```vue
<script setup>
import { reactive } from 'vue'

const schema = [
  {
    $el: 'div',
    // You can use expressions to concatenate strings
    children: '$: "Qty: " + $count + " x " + $format($price)',
  },
  {
    $el: 'div',
    children: ['Shipping: ', '$format($ship)'],
  },
  {
    $el: 'div',
    children: [
      'Total: ',
      // No label needed since $format starts with $
      '$format(($count * $price) + $ship)',
    ],
  },
]
const data = reactive({
  count: 1,
  price: 15.29,
  ship: 9.99,
  format: Intl.NumberFormat('en-US', { style: 'currency', currency: 'USD' })
    .format,
})
</script>

<template>
  <FormKitSchema :schema="schema" :data="data" />
  <FormKit type="button" @click="data.count++" outer-class="mt-6">
    Add to cart
  </FormKit>
</template>
```

> **Tip:** Expressions must always begin with a $. If the first element of an expression is a data reference (ex: $count + 2), then it already begins with a $ and no further labeling is required. However, often the first character of an expression is not a dollar sign — these expressions need to be "labeled" with $: — for example $: ($count * 3) - 7.

Although it looks very much like JavaScript — *schema expressions are not JavaScript*. They are better thought of as a templating language. Expressions are compiled down to functional JavaScript at `setup` but the syntax is not 1-1 compatible with JavaScript. This improves performance and provides a critical layer of security as only explicitly exposed data and functionality can be executed.

Schema expressions are limited to the following operators and parenthesis:

| Operator | Use case |
| --- | --- |
| + | Addition |
| - | Subtraction |
| * | Multiplication |
| / | Division |
| % | Modulus |
| && | Boolean AND |
| || | Boolean OR |
| === | Strict equals |
| !== | Strict not equals |
| == | Loose equals |
| != | Loose not equals |
| >= | Greater than or equal |
| <= | Less than or equal |
| > | Greater than |
| < | Less than |

## Conditionals

FormKit schema can leverage references and expressions to make schema nodes and attributes conditional. These conditionals can be added in two ways:

- The `if` property on `$el` and `$cmp` nodes.
- The `if/then/else` object

### The if property

Both `$el` and `$cmp` schema nodes can leverage an `if` property that roughly equates to a `v-if` in Vue. If the expression assigned to the `if` property is truthy, the node is rendered, otherwise it is not:

### Example: Schema - conditional

#### schema-conditional.vue

```vue
<script setup>
import { reactive } from 'vue'
const data = reactive({ value: 0 })
const schema = [
  {
    $el: 'h2',
    if: '$value >= 5 && $value <= 10',
    children: '$value + " is between 5-10!"',
  }
]
</script>

<template>
  <FormKit
    type="number"
    v-model="data.value"
    label="Enter a number between 5-10"
  />
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
</template>
```

> **Tip:** Conditional or iterative (when using if or for) schema nodes should always include an explicit key prop. Without this prop Vue may reuse the DOM nodes from the previous render, which can lead to unexpected behavior, errors, and performance issues.

### The if/then/else object

The `if/then/else` object allows for more complex conditional logic. It can be used to conditionally render nodes, a list of schema nodes, values of the `attrs` object or values of the `props` object. It is also possible to nest `if/then/else` objects to create more complex structures — similar to an `else if` statement in JavaScript.

#### Using if/then/else on schema nodes

You can use the `if/then/else` object anywhere you would normally use a schema node. This includes the root schema array, or the `children` property of another schema node:

> **Tip:** Conditional or iterative (when using if or for) schema nodes should always include an explicit key prop. Without this prop Vue may reuse the DOM nodes from the previous render, which can lead to unexpected behavior, errors, and performance issues.

### Example: Schema - conditional object

#### schema-conditional-object.vue

```vue
<script setup>
import { reactive } from 'vue'
const data = reactive({ value: 0 })
const schema = [
  {
    $el: 'h2',
    children: {
      if: '$value < 5',
      then: '$value + " is less than 5"',
      else: {
        if: '$value >= 5 && $value <= 10',
        then: '$value + " is between 5 and 10"',
        else: '$value + " is more than 10"'
      }
    },
    attrs: {
      class: 'text-xl font-bold'
    }
  }
]
</script>

<template>
  <FormKit
    type="number"
    v-model="data.value"
    label="Enter a number between 5-10"
  />
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
</template>
```

#### Using if/then/else on attrs and props

You can also use `if/then/else` statements to conditionally output the values of `attrs` or `props`:

### Example: Schema - conditional attrs

#### schema-conditional-attrs.vue

```vue
<script setup>
import { reactive } from 'vue'
const data = reactive({ drink: null })
const schema = [
  {
    $el: 'h1',
    if: '$drink',
    attrs: {
      style: {
        color: {
          if: '$drink == Vodka',
          then: 'blue',
          else: {
            if: '$drink == Whisky',
            then: 'brown',
            else: 'tan'
          }
        }
      }
    },
    children: '$drink'
  }
]
</script>

<template>
  <FormKit
    type="select"
    v-model="data.drink"
    label="Select a spirit"
    placeholder="Select a spirit"
    :options="['Vodka', 'Whisky', 'Rum']"
    help="Select your favorite base for cocktails."
  />
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
</template>
```

## Loops

Both `$el` and `$cmp` schema nodes support looping. The loop syntax is similar to `v-for` in Vue and expects an object or array to iterate over and a property to assign the current iteration value to. Optionally, you can also capture the index or property of the current iteration:

> **Tip:** Conditional or iterative (when using if or for) schema nodes should always include an explicit key prop. Without this prop Vue may reuse the DOM nodes from the previous render, which can lead to unexpected behavior, errors, and performance issues.

### Example: Schema - loops

#### schema-loops.vue

```vue
<script setup>
import { reactive, ref } from 'vue'
const schema = [
  {
    $el: 'ul',
    attrs: {
      class: 'city-list'
    },
    children: [
      {
        $el: 'li',
        for: ['item', 'key', '$cities'],
        children: '$: ($key + 1) + ": " + $item'
      }
    ]
  }
]

const data = reactive({
  cities: [
    'Boston',
    'Amsterdam',
    'Nairobi'
  ]
})

const city = ref('')

const addCity = () => {
  data.cities.push(city.value)
  city.value = ''
}
</script>

<template>
  <FormKit
    type="text"
    label="Add a city"
    help="Add a city and hit enter"
    v-model="city"
    @keyup.enter="addCity"
  />
  <FormKitSchema
    :schema="schema"
    :data="data"
  />
</template>
```

## Slots

Schemas can render the slot content of the `<FormKitSchema>` component anywhere within the schema that a normal schema node can be rendered. All scoped slots are automatically provided to the schema under the `$slots` reference object:

### Example: Schema - slots

#### schema-slots.vue

```vue
<script setup>
import { reactive, onMounted } from 'vue'

const schema = [
  {
    $el: 'h1',
    children: 'Fast click game',
    attrs: {
      class: 'text-2xl font-bold mb-4',
    },
  },
  {
    $formkit: 'button',
    onClick: '$handleClick',
    children: '$slots.default',
  },
  {
    $el: 'p',
    children: [
      {
        if: '$state === "won"',
        then: {
          $el: 'span',
          attrs: {
            style: { color: 'green' },
          },
          children: 'You won!!!!',
        },
        else: {
          if: '$state === "lost"',
          then: {
            $el: 'span',
            attrs: {
              style: { color: 'red' },
            },
            children: 'Sorry, you lost — try again!',
          },
          else: 'Try to click when the button reads between 500 and 600!',
        },
      },
    ],
  },
]

const handleClick = () => {
  if (data.label >= 500 && data.label <= 600) {
    data.state = 'won'
  } else {
    data.state = 'lost'
  }
  setTimeout(() => {
    data.state = 'play'
    tick()
  }, 2000)
}

const data = reactive({
  state: 'play',
  label: 0,
  handleClick,
})

const tick = () => {
  if (data.state === 'play') {
    data.label = data.label >= 1000 ? 0 : data.label + 10
    setTimeout(tick, 10)
  }
}
onMounted(tick)
</script>

<template>
  <FormKitSchema :schema="schema" :data="data">
    <template #default="{ label }">
      <span style="width: 6em">{{ label }}</span>
    </template>
  </FormKitSchema>
</template>
```

> **Tip:** Inside of a $formkit schema node, it is also possible to pass content to preexisting FormKit slots like label or prefix inside of the node's __raw__sectionsSchema property. Read more about raw values below, and sectionsSchema in the inputs documentation.

## Binding attrs and props

At times it may be necessary to pass an object of variable or unknown attributes or props to a `$cmp` or `$el`. In Vue we would do this using `v-bind` — in schema land we use the `bind` property:

### Example: Schema - bind

#### schema-bind.vue

```vue
<script setup>
import { reactive } from 'vue'

const schema = [
  {
    $el: 'h1',
    // 👀 Look below for the data object with this
    bind: '$someAttributes',
    children: 'Click me!',
  },
]

const data = reactive({
  someAttributes: {
    class: '!text-red-500',
    onClick: () => {
      if (data.someAttributes.class === '!text-red-500') {
        data.someAttributes.class = '!text-blue-500'
      } else {
        data.someAttributes.class = '!text-red-500'
      }
    },
    'data-fruit': 'I like fruit',
  },
})
</script>

<template>
  <FormKitSchema :schema="schema" :data="data" />
</template>
```

## Raw values

At times it may be necessary to prevent a given attribute or prop from being parsed. This can be done by prefixing an attribute or prop with `__raw__`:

```
{
  $cmp: 'PriceComponent',
  props: {
    __raw__price: '$2.99'
  }
}

```

In the above example, the `__raw__` prefix will be removed, and the unparsed value of `$2.99` will be passed as the `price` prop to the `PriceComponent`.

Another scenario where this comes into play is rendering FormKit components. The `<FormKit>` component has a `sections-schema` prop that allows users to pass down schema partials to merge with various sections of their input. In this edge case, we want to pass the schema chunks to the `<FormKit>` component as a raw JavaScript object. To do so, we once again prefix the `sectionsSchema` prop with `__raw__`:

### Example: Schema - **raw**

#### schema-raw.vue

```vue
<script setup>
const data = {
  field: 'Username',
}

const schema = [
  {
    $cmp: 'FormKit',
    props: {
      type: 'text',
      // This one will be parsed:
      label: '$field',
      // This object will stay raw and be passed as the sectionsSchema prop:
      __raw__sectionsSchema: {
        prefix: {
          $el: 'div',
          attrs: {
            class:
              '$classes.prefix + " py-0 px-2 text-sm stretch flex items-center bg-gray-200 mr-2 rounded dark:bg-gray-800"',
          },
          children: '$label',
        },
      },
    },
  },
]
</script>

<template>
  <FormKitSchema :data="data" :schema="schema" />
</template>
```

Notice if you remove the `__raw__` prefix from the above example, the prefix no longer has effect — this is because the `sectionsSchema` prop’s value was parsed when creating the component instead of passed as a JavaScript object.

## FormKit Inputs

Although schemas can be used for almost any purpose — the primary objective is to empower developers to build complex and dynamic forms using a serializable data format. Using the schema with FormKit Inputs covers this use case well.

Assuming you globally registered the `FormKit` component — you can render your `FormKit` inputs from schema by using the `$cmp` type schema node:

### Example: Schema - formkit

#### schema-formkit.vue

```vue
<script setup>
const schema = [
  {
    $cmp: 'FormKit',
    props: {
      type: 'radio',
      label: 'Income',
      help: 'Select your household income',
      options: [
        { value: 20000, label: '<= $20,000' },
        { value: 40000, label: '$21k - $40k' },
        { value: 80000, label: '$41k - $80k' },
        { value: 130000, label: '$81k - $130k' },
        { value: 250000, label: '$131k - $250k' },
      ],
      validation: 'required|min:250000',
      validationVisibility: 'dirty',
      validationMessages: {
        min: 'Sorry, only wealthy people can get loans from the bank.'
      }
    }
  },
  {
    $cmp: 'FormKit',
    props: {
      type: 'select',
      label: 'Marital status',
      options: [
        'Married',
        'Single',
        'Divorced',
        'Engaged'
      ]
    }
  }
]
</script>

<template>
  <h2>Loan application</h2>
  <FormKitSchema :schema="schema" />
</template>
```

### Shorthand

While the `cmp` syntax is generalized and works for any Vue component, it is somewhat verbose for FormKit Inputs. To make this easier, FormKit supports a fourth node type `$formkit`, which is syntactic sugar for the full `$cmp` format.

When using the `$formkit` shorthand, the `props` object is flattened with the top-level properties (siblings of `$formkit`) For example:

### Example: Generating forms - sugar

#### generating-sugar.vue

```vue
<FormKitSchema
    :schema="[
      {
        $formkit: 'email',
        label: 'Email address',
        help: 'Please enter your email address.'
      }
    ]"
  />
```

### Accessing other inputs

The schema format has one built-in function specific to FormKit Inputs: the `$get` function. This builtin allows the schema to access the context object of any other FormKit Input (even outside the immediate form) — provided the input in question has an explicitly declared `id` prop. This allows the schema to respond conditionally to the state of your own inputs:

### Example: Schema - formkit

#### schema-get.vue

```vue
<script setup>
const schema = [
  {
    $cmp: 'FormKit',
    props: {
      type: 'select',
      id: 'drink',
      label: 'Drink',
      placeholder: 'Pick your drink',
      options: {
        coffee: 'Drip coffee',
        espresso: 'Espresso shot',
        tea: 'Tea'
      },
      validation:'required'
    }
  },
  {
    $cmp: 'FormKit',
    if: '$get(drink).value',
    props: {
      type: 'radio',
      label: '$: "Drink options (" + $get(drink).value + ")"',
      options: {
        if: '$get(drink).value === coffee',
        then: [
          'Large',
          'Medium',
          'Small'
        ],
        else: {
          if: '$get(drink).value === espresso',
          then: [
            'Single shot',
            'Double shot',
          ],
          else: [
            'Earl grey',
            'Matcha',
            'Green tea',
            'Jasmine'
          ]
        }
      }
    }
  }
]
</script>

<template>
  <h2 class="text-2xl font-bold mb-4">Order a beverage</h2>
  <FormKitSchema :schema="schema" />
</template>
```

### Forms

To render a form element, you can either use the `$formkit: 'form'` schema node, or wrap your `<FormKitSchema>` component in a `<FormKit type="form">` component:

### Example: Generating forms - form

#### generating-form.vue

```vue
<script setup>
const schema = [
  {
    $formkit: 'email',
    label: 'Email address',
    validation: 'required',
  },
]
</script>

<template>
  <FormKit type="form" @submit="() => false">
    <FormKitSchema :schema="schema" />
  </FormKit>
</template>
```
