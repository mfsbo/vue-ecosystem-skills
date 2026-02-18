import antfu from '@antfu/eslint-config'

export default antfu({
  type: 'app',
  ignores: [
    'CLAUDE.md',
    'skills/**/references/**',
    'skills/**/.skilld/**',
    '**/SKILL.md',
  ],
})
