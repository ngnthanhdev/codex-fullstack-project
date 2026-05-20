# Git Handoff

Ngay tao: 2026-05-20

## Muc Dich

Repo nay la template kieu `opencode-react-native-template`, nhung toi uu cho Codex IDE va Expo/React Native. No da co:

- Codex source of truth: `AGENTS.md`
- Project docs: `docs/`
- Layered tasks: `tasks/`
- Expo skills vendored: `skills/expo/`
- Bootstrap scripts: `scripts/start-project.*`
- GitHub Actions smoke checks: `.github/workflows/`

## File/Thu Muc Can Commit

```text
.github/workflows/
.gitignore
.env.example
AGENTS.md
CHECKPOINT.md
GIT_HANDOFF.md
LICENSE
README.md
docs/
package.json
scripts/
skills/expo/
tasks/
```

## Lenh Git Goi Y

Repo local da duoc init va dang o branch `main`. Chua co commit dau tien.

```bash
git add .
git commit -m "Initial Codex Expo React Native template"
```

Neu da tao repo tren GitHub:

```bash
git remote add origin <GITHUB_REPO_URL>
git push -u origin main
```

Neu muon dung GitHub CLI:

```bash
gh repo create <REPO_NAME> --source=. --private --push
```

Sau khi push, co the vao GitHub repo settings va bat `Template repository`.

## Verify Truoc Khi Push

```bash
npm run check
find skills/expo -name SKILL.md | wc -l
git status --short
```

Ky vong co 14 file `SKILL.md` trong `skills/expo`.
