# Git Handoff

Ngay tao: 2026-05-20

## Muc Dich

Repo nay la template kieu `opencode-react-native-template`, nhung toi uu cho Codex IDE va NestJS backend. No co:

- Codex source of truth: `AGENTS.md`
- Project docs: `docs/`
- Layered tasks: `tasks/`
- NestJS skill submodule: `skills/nestjs/agent-nestjs-skills`
- Bootstrap scripts: `scripts/start-project.*`
- GitHub Actions smoke checks: `.github/workflows/`

## File/Thu Muc Can Commit

```text
.github/workflows/
.gitignore
.env.example
.gitmodules
AGENTS.md
CHECKPOINT.md
GIT_HANDOFF.md
LICENSE
README.md
docs/
package.json
scripts/
skills/nestjs/agent-nestjs-skills
tasks/
```

## Lenh Git Goi Y

```bash
git add .
git commit -m "Initial Codex NestJS template"
git remote add origin https://github.com/ngnthanhdev/codex-nestjs-template.git
git push -u origin main
```

## Clone Co Submodule

```bash
git clone --recurse-submodules https://github.com/ngnthanhdev/codex-nestjs-template.git
```

Neu da clone roi:

```bash
git submodule update --init --recursive
```

## Verify Truoc Khi Push

```bash
npm run check
git submodule status
git status --short
```
