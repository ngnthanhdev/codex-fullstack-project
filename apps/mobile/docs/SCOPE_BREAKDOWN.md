# Scope Breakdown

Dung dependency-driven layers. Lam xong layer truoc roi moi sang layer sau.

## Layer 0: Foundation

Muc tieu: tao nen tang de app chay va de team/Codex lam viec nhat quan.

- Project setup
- TypeScript/lint/test config
- Navigation skeleton
- Theme/design tokens
- Environment config
- API client base

## Layer 1: Core Product Flow

Muc tieu: lam luong gia tri chinh cua app.

- Main screens
- Core data model
- Core actions
- Loading/empty/error states

## Layer 2: Persistence And Integrations

Muc tieu: noi data that, auth, storage, third-party service.

- Auth
- API integration
- Local/offline storage
- Error reporting

## Layer 3: Release Readiness

Muc tieu: dua app den trang thai co the build/test/deploy.

- QA pass
- EAS build profiles
- App icons/splash
- CI/CD
- Store metadata

## Refinement Layer

Sau khi app chay, bug va feature moi duoc dua vao `tasks/layer-refinement-todo.md`.
