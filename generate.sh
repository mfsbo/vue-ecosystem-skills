#!/usr/bin/env bash
set -euo pipefail

MODEL="sonnet"
EJECT_DIR="./skills"
SKILLD="npx -y skilld@v0.13.2"

PACKAGES=(
  # Core
  vue@beta
  vue-router
  pinia

#  # Build & Test
  "@vue/test-utils"
#
#  # State & Data
  "@tanstack/vue-query"
  "@tanstack/vue-table"
  "@tanstack/vue-form"
  "@tanstack/vue-router"
  "@tanstack/vue-virtual"
  "@tanstack/vue-store"
  "@tanstack/ai-vue"
  "@pinia/colada"
#
#  # Utilities
  @unhead/vue
  vue-i18n
#
#  # UI
  reka-ui
  primevue
  vuetify@next
  motion-v
  shadcn-vue
  quasar
#
#  # Forms
  vee-validate
  "@formkit/core"
#
#  # Presentations & Docs
  "@slidev/cli"
  vitepress
#
#  # 3D
  "@tresjs/core"
#
#  # VueUse
  "@vueuse/core"
  "@vueuse/shared"
  "@vueuse/components"
  "@vueuse/integrations"
  "@vueuse/math"
  "@vueuse/motion"

  # charts
  @unovis/ts
  @unovis/vue
  vue-data-ui
  @floating-ui/vue
)

# Explicit packages mode: ./generate.sh @vueuse/math @tanstack/vue-query quasar
EXPLICIT=false
if [ $# -gt 0 ]; then
  PACKAGES=("$@")
  EXPLICIT=true
fi

# Compute skill dir name matching skilld's computeSkillDirName()
skill_dir_name() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9._]/-/g; s/^[.\-]*//; s/[.\-]*$//' | head -c 255
}

total=${#PACKAGES[@]}
current=0
failed=()

echo "Skill Version: $($SKILLD --version)"
echo "Generating $total skills with model=$MODEL"
echo "Output: $EJECT_DIR"
echo "---"

# Delete old output for explicit packages so we get a clean regeneration
if [ "$EXPLICIT" = true ]; then
  for pkg in "${PACKAGES[@]}"; do
    # Strip version suffix (e.g. vue@beta -> vue, vuetify@next -> vuetify)
    bare=$(echo "$pkg" | sed 's/@[^/]*$//')
    dir_name="$(skill_dir_name "$bare")-skilld"
    target="$EJECT_DIR/$dir_name"
    if [ -d "$target" ]; then
      echo "Removing $target"
      rm -rf "$target"
    fi
  done
  echo "---"
fi

for pkg in "${PACKAGES[@]}"; do
  current=$((current + 1))

  # Skip pre-generated skills in default mode
  if [ "$EXPLICIT" = false ]; then
    bare=$(echo "$pkg" | sed 's/@[^/]*$//')
    dir_name="$(skill_dir_name "$bare")-skilld"
    if [ -d "$EJECT_DIR/$dir_name" ]; then
      echo "[$current/$total] $pkg (skipped — already exists)"
      echo ""
      continue
    fi
  fi

  echo "[$current/$total] $pkg"

  if $SKILLD eject "$pkg" \
    --out "$EJECT_DIR" \
    --model "$MODEL" \
    --yes \
    --force \
    --debug; then
    echo "  ✓ $pkg"
  else
    echo "  ✗ $pkg (failed)"
    failed+=("$pkg")
  fi

  echo ""
done

echo "=== Done ==="
echo "Generated: $((total - ${#failed[@]}))/$total"

if [ ${#failed[@]} -gt 0 ]; then
  echo "Failed:"
  for pkg in "${failed[@]}"; do
    echo "  - $pkg"
  done
  exit 1
fi
