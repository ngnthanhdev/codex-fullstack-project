# Expo Skills Vendored For Codex

Nguon: https://github.com/expo/skills

Bo skill nay duoc copy vao project de Codex co the doc truc tiep khi lam viec voi Expo/React Native. File dieu phoi chinh la `AGENTS.md`.

## Da Them

```text
skills/expo/
  building-native-ui/
  eas-update-insights/
  expo-api-routes/
  expo-brownfield/
  expo-cicd-workflows/
  expo-deployment/
  expo-dev-client/
  expo-module/
  expo-tailwind-setup/
  expo-ui-jetpack-compose/
  expo-ui-swift-ui/
  native-data-fetching/
  upgrading-expo/
  use-dom/
  LICENSE
```

## Cach Codex Nen Dung

- Lam UI/navigation/Expo Router: doc `skills/expo/building-native-ui/SKILL.md`.
- Lam API request/cache/offline: doc `skills/expo/native-data-fetching/SKILL.md`.
- Lam backend route trong Expo Router: doc `skills/expo/expo-api-routes/SKILL.md`.
- Lam dev client/native code: doc `skills/expo/expo-dev-client/SKILL.md`.
- Lam native module: doc `skills/expo/expo-module/SKILL.md`.
- Lam deploy/build/submission: doc `skills/expo/expo-deployment/SKILL.md`.
- Lam CI/CD EAS Workflows: doc `skills/expo/expo-cicd-workflows/SKILL.md`.
- Upgrade Expo SDK: doc `skills/expo/upgrading-expo/SKILL.md`.
- Setup Tailwind/NativeWind: doc `skills/expo/expo-tailwind-setup/SKILL.md`.

## Cap Nhat Lai Tu Upstream

Khi muon sync phien ban moi tu Expo:

```bash
rm -rf /tmp/expo-skills
git clone --depth 1 https://github.com/expo/skills.git /tmp/expo-skills
rm -rf skills/expo
mkdir -p skills/expo
cp -R /tmp/expo-skills/plugins/expo/skills/. skills/expo/
cp /tmp/expo-skills/LICENSE skills/expo/LICENSE
```

Sau do xem diff:

```bash
git diff -- skills/expo AGENTS.md docs/EXPO_SKILLS.md
```

## License

Expo skills dung MIT License. File license goc da duoc copy vao `skills/expo/LICENSE`.
