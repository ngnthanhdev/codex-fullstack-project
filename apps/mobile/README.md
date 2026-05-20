# Codex Expo React Native Template

Production-ready template de khoi dong Expo / React Native project moi voi Codex IDE.

Template nay tap trung vao workflow:

```text
Idea -> Brief -> Specification -> Scope Breakdown -> Code -> Test -> Checkpoint -> Ship
```

## Muc Tieu

- Giup Codex hieu project ngay tu dau thong qua `AGENTS.md`.
- Luu yeu cau, kien truc, quyet dinh va task trong `docs/` va `tasks/`.
- Chia scope theo layer de lam viec co thu tu, de song song hoa khi can.
- Vendor san bo skill Expo chinh thuc tu `expo/skills`.
- Co script tao project moi tu template.
- Co CI mau cho Expo / TypeScript project.

## Co Gi San

```text
AGENTS.md                    Huong dan chinh cho Codex
CHECKPOINT.md                Tom tat trang thai sau moi giai doan
docs/
  BRIEF.md                   Tom tat y tuong ban dau
  SPECIFICATIONS.md          Yeu cau chi tiet
  ARCHITECTURE.md            Kien truc va convention
  SCOPE_BREAKDOWN.md         Chia scope theo layer
  DECISIONS.md               Architecture Decision Records ngan
  EXPO_SKILLS.md             Inventory bo skill Expo
  phases/phase-0.md          Workflow brainstorm/design truoc khi code
tasks/
  layer-0-todo.md            Foundation tasks
  layer-refinement-todo.md   Bug/feature sau khi app da chay
  done.md                    Log viec da xong
skills/expo/                 Expo skills vendored tu github.com/expo/skills
scripts/
  start-project.sh           Tao project moi tu template tren macOS/Linux
  start-project.ps1          Tao project moi tren Windows PowerShell
  start-project.bat          Tao project moi tren Windows CMD
  add-task.js                Them task vao file layer
  pick-task.js               Lay task todo dau tien
.github/workflows/ci.yml     CI mau
```

## Cach Dung Template

### Tao project moi

Tren macOS/Linux:

```bash
./scripts/start-project.sh
```

Tren Windows PowerShell:

```powershell
.\scripts\start-project.ps1
```

Script se hoi:

1. Ten project.
2. Co file mo ta yeu cau hay khong.
3. Co tao Git repo moi hay khong.

Sau do mo project moi trong Codex IDE va bat dau bang:

```text
Hay doc AGENTS.md, docs/BRIEF.md, docs/SPECIFICATIONS.md va tasks/layer-0-todo.md roi bat dau Phase 0.
```

### Dung truc tiep repo nay

Neu ban muon repo nay la template tren GitHub:

```bash
git add .
git commit -m "Initial Codex Expo template"
git remote add origin <GITHUB_REPO_URL>
git push -u origin main
```

Sau khi push, vao GitHub repo settings va bat `Template repository`.

## Expo Skills

Bo skill Expo nam tai `skills/expo/`. Khi task lien quan Expo, Codex nen doc skill phu hop truoc khi code:

- UI / Expo Router: `skills/expo/building-native-ui/SKILL.md`
- Data fetching: `skills/expo/native-data-fetching/SKILL.md`
- API routes: `skills/expo/expo-api-routes/SKILL.md`
- Deploy / EAS: `skills/expo/expo-deployment/SKILL.md`
- CI/CD: `skills/expo/expo-cicd-workflows/SKILL.md`
- Upgrade SDK: `skills/expo/upgrading-expo/SKILL.md`
- Native module: `skills/expo/expo-module/SKILL.md`

Xem chi tiet tai `docs/EXPO_SKILLS.md`.

## Nguyen Tac Lam Viec Voi Codex

- Brainstorm va viet spec truoc khi code feature lon.
- Moi task nen nho, co acceptance criteria ro.
- Test/verify ngay sau khi code.
- Sau moi layer, cap nhat `CHECKPOINT.md`.
- Khong commit secret. Chi commit `.env.example`.

## License

MIT. Expo skills vendored trong `skills/expo/` giu license MIT rieng tai `skills/expo/LICENSE`.
