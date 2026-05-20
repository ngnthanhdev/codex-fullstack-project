# Architecture

## Default Stack

- Expo
- React Native
- TypeScript
- Expo Router
- EAS Build / EAS Submit khi can deploy

## Recommended Structure

```text
app/                    Expo Router routes
src/
  components/           Shared UI components
  features/             Feature modules
  hooks/                Shared hooks
  lib/                  Clients, utilities, config
  services/             API/service layer
  state/                Client state
  types/                Shared TypeScript types
assets/                 Images, fonts, icons
```

## Coding Conventions

- TypeScript strict khi co the.
- Uu tien component nho, props ro rang.
- Data fetching di qua service/hook layer, khong hard-code truc tiep trong UI phuc tap.
- Khong de secret trong source code.
- Them loading, empty, error states cho screen co network/data.

## Expo Skill Usage

- UI/navigation: `skills/expo/building-native-ui/SKILL.md`
- Network/cache: `skills/expo/native-data-fetching/SKILL.md`
- API routes: `skills/expo/expo-api-routes/SKILL.md`
- Native code/dev client: `skills/expo/expo-dev-client/SKILL.md`
- Deployment: `skills/expo/expo-deployment/SKILL.md`

## Testing Strategy

- Unit tests cho pure logic.
- Component tests cho component co branching.
- Manual Expo Go/dev client testing cho native behavior.
- EAS preview builds truoc production.
