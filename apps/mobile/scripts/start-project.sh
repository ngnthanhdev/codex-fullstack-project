#!/usr/bin/env bash
set -euo pipefail

template_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

printf "Project name: "
read -r project_name

if [ -z "$project_name" ]; then
  echo "Project name is required."
  exit 1
fi

target_dir="$(pwd)/$project_name"

if [ -e "$target_dir" ]; then
  echo "Target already exists: $target_dir"
  exit 1
fi

mkdir -p "$target_dir"

if command -v rsync >/dev/null 2>&1; then
  rsync -a \
    --exclude ".git" \
    --exclude "node_modules" \
    --exclude ".expo" \
    "$template_dir/" "$target_dir/"
else
  cp -R "$template_dir/." "$target_dir/"
  rm -rf "$target_dir/.git" "$target_dir/node_modules" "$target_dir/.expo"
fi

printf "Do you have a requirements/spec file? (y/n): "
read -r has_spec

if [ "$has_spec" = "y" ] || [ "$has_spec" = "Y" ]; then
  printf "Path to requirements/spec file: "
  read -r spec_path
  if [ -f "$spec_path" ]; then
    cp "$spec_path" "$target_dir/docs/SPECIFICATIONS.md"
    {
      echo "# Project Brief"
      echo
      echo "Generated from: $spec_path"
      echo
      echo "Read docs/SPECIFICATIONS.md for full requirements."
    } > "$target_dir/docs/BRIEF.md"
  else
    echo "Spec file not found: $spec_path"
    exit 1
  fi
else
  echo "Paste a short project brief. Finish with an empty line:"
  brief_lines=()
  while IFS= read -r line; do
    [ -z "$line" ] && break
    brief_lines+=("$line")
  done
  {
    echo "# Project Brief"
    echo
    for line in "${brief_lines[@]}"; do
      echo "$line"
    done
  } > "$target_dir/docs/BRIEF.md"
fi

(
  cd "$target_dir"
  rm -rf .git
  git init
  git branch -M main
)

printf "Create GitHub repo with gh CLI? (y/n): "
read -r create_remote

if [ "$create_remote" = "y" ] || [ "$create_remote" = "Y" ]; then
  if command -v gh >/dev/null 2>&1; then
    (
      cd "$target_dir"
      gh repo create "$project_name" --source=. --private --push
    )
  else
    echo "gh CLI not found. Add remote manually after creating a GitHub repo."
  fi
fi

cat <<EOF

Project created:
  $target_dir

Next:
  cd "$target_dir"
  npm install
  Open this folder in Codex IDE.
  Ask Codex: "Doc AGENTS.md va bat dau Phase 0."
EOF
