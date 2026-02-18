<h1>vue-ecosystem-skills</h1>

[![license](https://img.shields.io/github/license/harlan-zw/vue-ecosystem-skills?color=yellow)](https://github.com/harlan-zw/vue-ecosystem-skills/blob/main/LICENSE)

> AI agent skills for the bleeding edge Vue ecosystem. Built from real docs, issues, and releases.

## Why?

Getting agents to follow the latest conventions in the Vue ecosystem is difficult. All agents still struggle with [Vue 3.5](https://blog.vuejs.org/posts/vue-3-5) APIs out of the box — and with Vue 3.6 on the horizon alongside [Pinia v3](https://github.com/vuejs/pinia/blob/v3/packages/pinia/CHANGELOG.md), [Vue Router v5](https://github.com/vuejs/router/blob/main/packages/router/CHANGELOG.md), [Reka UI v2](https://github.com/unovue/reka-ui), and [VueUse v14](https://github.com/vueuse/vueuse), getting the right context to agents is as important as ever.

Hand-crafted rules are great, but maintaining them is a burden — especially when working across several packages that are all actively releasing. Author-shipped skills ([skills-npm](https://github.com/antfu/skills-npm)) are the ideal solution, but most Vue libraries don't ship them yet.

This repo bridges the gap: pre-generated skills from real sources (docs, GitHub issues, discussions, changelogs) using [skilld](https://github.com/harlan-zw/skilld). Install once, get version-aware context for the entire Vue ecosystem — no manual curation, no author opt-in, and no LLM tokens spent on generation.

<p align="center">
<table>
<tbody>
<td align="center">
<sub>Made possible by my <a href="https://github.com/sponsors/harlan-zw">Sponsor Program 💖</a><br> Follow me <a href="https://twitter.com/harlan_zw">@harlan_zw</a> 🐦 • Join <a href="https://discord.gg/275MBUBvgP">Discord</a> for help</sub><br>
</td>
</tbody>
</table>
</p>

## Features

- 📦 **Bleeding Edge Context**: Always use the latest best practices and avoid deprecated patterns.
- 📚 **Unopinionated**: Just follows the docs, no personal biases or opinions injected
- 🔬 **Deep References**: Real GitHub issues, discussions, and changelogs — not just docs
- 🎯 **Version-Aware**: API changes and best practices tied to specific package versions
- 🤝 **Ecosystem**: Compatible with [`npx skills`](https://skills.sh/) and [skilld](https://github.com/harlan-zw/skilld)

## Quick Start

```bash
npx skilld add harlan-zw/vue-ecosystem-skills
```

Or if you prefer [skills.sh](https://skills.sh/):

```bash
npx skills add harlan-zw/vue-ecosystem-skills
```

### Claude Code Marketplace

```bash
# Add marketplace
/plugin marketplace add harlan-zw/vue-ecosystem-skills

# Install individual skills
/plugin install pinia@vue-ecosystem-skills

# Install multiple skills
/plugin install pinia@vue-ecosystem-skills vue-router@vue-ecosystem-skills reka-ui@vue-ecosystem-skills
```

### Tips

- **Ensure skills are used** — Add this to your agent file (e.g. `CLAUDE.md`, `.cursorrules`):
  ```
  Before modifying code, evaluate each installed skill against the current task.
  For each skill, determine YES/NO relevance and invoke all YES skills before proceeding.
  ```

## Available Skills

### Core

| Skill | Version | Description |
|-------|---------|-------------|
| [**vue**](./skills/vue-skilld/SKILL.md) | 3.6.0-beta.6 | Vue — reactivity, components, Composition API |
| [**pinia**](./skills/pinia-skilld/SKILL.md) | 3.0.4 | Pinia — stores, plugins, SSR, devtools |
| [**vue-router**](./skills/vue-router-skilld/SKILL.md) | 5.0.2 | Vue Router — navigation guards, data loaders |
| [**vue-test-utils**](./skills/vue-test-utils-skilld/SKILL.md) | 2.4.6 | Vue Test Utils — component testing utilities |
| [**unhead**](./skills/unhead-skilld/SKILL.md) | 2.1.4 | Unhead — document head management |

### Data & State

| Skill | Version | Description |
|-------|---------|-------------|
| [**pinia-colada**](./skills/pinia-colada-skilld/SKILL.md) | 0.21.4 | Pinia Colada — type-safe data fetching for Pinia |
| [**tanstack-vue-query**](./skills/tanstack-vue-query-skilld/SKILL.md) | 5.92.9 | TanStack Vue Query — async state management and caching |
| [**tanstack-vue-store**](./skills/tanstack-vue-store-skilld/SKILL.md) | 0.9.1 | TanStack Vue Store — framework-agnostic reactive store |
| [**tanstack-vue-table**](./skills/tanstack-vue-table-skilld/SKILL.md) | 8.21.3 | TanStack Vue Table — headless table/datagrid utilities |
| [**tanstack-vue-virtual**](./skills/tanstack-vue-virtual-skilld/SKILL.md) | 3.13.18 | TanStack Vue Virtual — virtualized list/grid rendering |
| [**tanstack-vue-form**](./skills/tanstack-vue-form-skilld/SKILL.md) | 1.28.3 | TanStack Vue Form — type-safe form management |
| [**tanstack-vue-router**](./skills/tanstack-vue-router-skilld/SKILL.md) | 1.160.0 | TanStack Vue Router — type-safe routing |
| [**tanstack-ai-vue**](./skills/tanstack-ai-vue-skilld/SKILL.md) | 0.5.4 | TanStack AI Vue — AI/LLM integration utilities |

### UI Libraries

| Skill | Version | Description |
|-------|---------|-------------|
| [**reka-ui**](./skills/reka-ui-skilld/SKILL.md) | 2.8.0 | Reka UI — unstyled, accessible component primitives |
| [**shadcn-vue**](./skills/shadcn-vue-skilld/SKILL.md) | 2.4.3 | shadcn-vue — re-usable components built on Reka UI |
| [**primevue**](./skills/primevue-skilld/SKILL.md) | 4.5.4 | PrimeVue — rich UI component suite |
| [**vuetify**](./skills/vuetify-skilld/SKILL.md) | 4.0.0-beta.2 | Vuetify — Material Design component framework |
| [**quasar**](./skills/quasar-skilld/SKILL.md) | 2.18.6 | Quasar — cross-platform Vue framework |

### Forms

| Skill | Version | Description |
|-------|---------|-------------|
| [**formkit**](./skills/formkit-core-skilld/SKILL.md) | 1.7.2 | FormKit — form building framework |
| [**vee-validate**](./skills/vee-validate-skilld/SKILL.md) | 4.15.1 | VeeValidate — form validation |

### Data Visualization

| Skill | Version | Description |
|-------|---------|-------------|
| [**vue-data-ui**](./skills/vue-data-ui-skilld/SKILL.md) | 3.15.2 | Vue Data UI — data visualization components |
| [**unovis-vue**](./skills/unovis-vue-skilld/SKILL.md) | 1.6.4 | Unovis Vue — modular data visualization framework |

### Positioning

| Skill | Version | Description |
|-------|---------|-------------|
| [**floating-ui-vue**](./skills/floating-ui-vue-skilld/SKILL.md) | 1.1.10 | Floating UI for Vue — positioning for tooltips, popovers, dropdowns |

### Animation

| Skill | Version | Description |
|-------|---------|-------------|
| [**motion-vue**](./skills/motion-v-skilld/SKILL.md) | 2.0.0-beta.4 | Motion for Vue — animation library |

### VueUse

| Skill | Version | Description |
|-------|---------|-------------|
| [**vueuse-core**](./skills/vueuse-core-skilld/SKILL.md) | 14.2.1 | VueUse Core — essential composition utilities |
| [**vueuse-shared**](./skills/vueuse-shared-skilld/SKILL.md) | 14.2.1 | VueUse Shared — shared utilities |
| [**vueuse-components**](./skills/vueuse-components-skilld/SKILL.md) | 14.2.1 | VueUse Components — renderless component utilities |
| [**vueuse-integrations**](./skills/vueuse-integrations-skilld/SKILL.md) | 14.2.1 | VueUse Integrations — third-party library integrations |
| [**vueuse-head**](./skills/vueuse-head-skilld/SKILL.md) | 2.0.0 | VueUse Head — document head management (legacy) |
| [**vueuse-math**](./skills/vueuse-math-skilld/SKILL.md) | 14.2.1 | VueUse Math — math/logic composition utilities |
| [**vueuse-motion**](./skills/vueuse-motion-skilld/SKILL.md) | 3.0.3 | VueUse Motion — animation composition utilities |

### Tooling & DX

| Skill | Version | Description |
|-------|---------|-------------|
| [**vue-i18n**](./skills/vue-i18n-skilld/SKILL.md) | 11.2.8 | Vue I18n — internationalization |
| [**vitepress**](./skills/vitepress-skilld/SKILL.md) | 1.6.4 | VitePress — static site generator |
| [**tresjs**](./skills/tresjs-core-skilld/SKILL.md) | 5.5.0 | TresJS — 3D rendering with Three.js |

## What's in Each Skill

Each skill includes:

- **API Changes** — Version-specific additions and breaking changes with source links
- **Best Practices** — Patterns derived from official docs and real-world usage
- **References** — Deep-dive files organized by source:
  - `docs/` — Official documentation excerpts
  - `issues/` — Bug reports, workarounds, edge cases from GitHub
  - `discussions/` — Community Q&A, patterns, recipes
  - `releases/` — Changelogs, breaking changes, new APIs

## How Skills Are Generated

Skills are generated using real package data:

1. **Docs** are crawled from the official documentation site
2. **Issues** are pulled from GitHub (bugs, workarounds, edge cases)
3. **Discussions** are pulled from GitHub (Q&A, patterns, recipes)
4. **Releases** are parsed from changelogs and release notes

The SKILL.md for each package is then synthesized with version-specific API changes and best practices sourced directly from these references.

## Related

- [skilld](https://github.com/harlan-zw/skilld) - Generate AI agent skills from your NPM dependencies
- [vuejs-ai/skills](https://github.com/vuejs-ai/skills) — Hand-crafted Vue 3 best practices skills
- [antfu/skills](https://github.com/antfu/skills) — Anthony Fu's curated skills for Vue/Vite/Nuxt
- [vueuse/vueuse-skills](https://github.com/vueuse/vueuse-skills) — Agent skills for VueUse
- [onmax/nuxt-skills](https://github.com/onmax/nuxt-skills) — Agent skills for Nuxt
- [RuleKit](https://rulekit.dev) — Paid curated agent rules for Vue/Nuxt by posva

## Contributing

1. Create a feature branch from `main`
2. Submit a PR
3. After approval, changes are merged

## License

Licensed under the [MIT license](https://github.com/harlan-zw/vue-ecosystem-skills/blob/main/LICENSE).
