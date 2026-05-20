# Codex Project Guide

## Project Identity

Repo nay la template de tao Expo / React Native project moi voi Codex IDE. No lay cam hung tu `opencode-react-native-template`, nhung dung `AGENTS.md` lam source of truth cho Codex.

## Language

- Trao doi voi user bang tieng Viet, ngan gon va ro viec.
- Khi sua code, uu tien pattern dang co trong project.
- Truoc khi lam feature lon: doc brief/spec/task lien quan, sau do chia viec nho.

## Local Expo Skills

Project nay vendored bo skill chinh thuc tu `expo/skills` tai:

```text
skills/expo/
```

Khi lam viec lien quan Expo, React Native, Expo Router, EAS, native module, deployment, upgrade SDK, data fetching, Tailwind, dev client, hay UI native, hay doc skill phu hop truoc khi code.

## Skill Map

- `skills/expo/building-native-ui/SKILL.md`: Expo Router, UI, navigation, tabs, animation, media, storage, native controls.
- `skills/expo/native-data-fetching/SKILL.md`: fetch API, API call, cache, offline, React Query/SWR, Expo Router loaders.
- `skills/expo/expo-api-routes/SKILL.md`: API routes trong Expo Router va EAS Hosting.
- `skills/expo/expo-deployment/SKILL.md`: deploy iOS App Store, Android Play Store, web hosting, TestFlight.
- `skills/expo/expo-cicd-workflows/SKILL.md`: EAS workflow YAML, CI/CD cho Expo.
- `skills/expo/expo-dev-client/SKILL.md`: development client khi app can native code.
- `skills/expo/expo-tailwind-setup/SKILL.md`: Tailwind CSS v4, NativeWind v5, react-native-css.
- `skills/expo/upgrading-expo/SKILL.md`: upgrade Expo SDK va migrate deprecated packages.
- `skills/expo/expo-module/SKILL.md`: tao/sua Expo native modules, native views, config plugins.
- `skills/expo/expo-brownfield/SKILL.md`: chen Expo/React Native vao app native co san.
- `skills/expo/use-dom/SKILL.md`: DOM components de dung web code trong native.
- `skills/expo/expo-ui-swift-ui/SKILL.md`: `@expo/ui/swift-ui`.
- `skills/expo/expo-ui-jetpack-compose/SKILL.md`: `@expo/ui/jetpack-compose`.
- `skills/expo/eas-update-insights/SKILL.md`: kiem tra suc khoe EAS Updates.

## Workflow

1. Neu user dua y tuong moi, tao/bo sung spec truoc khi code.
2. Neu task lien quan Expo, doc skill tuong ung trong `skills/expo`.
3. Neu skill co `references/`, chi doc file reference can cho task hien tai.
4. Sau khi code, chay verify phu hop: lint, typecheck, test, build, hoac Expo/EAS command khi can.
5. Cap nhat checkpoint/task log neu project da co cac file do.

## Template Files

- `README.md`: gioi thieu template va cach dung.
- `docs/BRIEF.md`: y tuong san pham.
- `docs/SPECIFICATIONS.md`: yeu cau chi tiet.
- `docs/ARCHITECTURE.md`: stack, structure va convention.
- `docs/SCOPE_BREAKDOWN.md`: chia layer.
- `tasks/layer-0-todo.md`: viec nen tang.
- `scripts/start-project.sh`: tao project moi tu template.

## Guardrails

- Khong commit secret, token, keystore, provisioning profile, `.env` that.
- Dung `.env.example` de ghi ten bien moi truong.
- Khong chay lenh publish/deploy/submission that neu user chua yeu cau ro.
- Voi native build, uu tien giai thich lenh can chay va chi chay khi project/environment da san sang.
