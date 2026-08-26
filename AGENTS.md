# AGENTS.md

## Commands
- Run lint analysis: `flutter analyze`
- Run tests: `flutter test`
- Run single test: `flutter test test/widget_test.dart`
- Run app (desktop/web/device): `flutter run`

## Architecture & Conventions
- **App Entry**: `lib/main.dart` renders `MyApp` wrapping `MenuPage`.
- **Widgets Navigation**: Sub-widgets live under `lib/widgets/`.
- **Navigation structure**: `MyApp` in `lib/main.dart` owns the root `MaterialApp`. Sub-widgets in `lib/widgets/` must return `Scaffold` directly (never wrap in `MaterialApp`), preserving the shared `Navigator` stack and top `AppBar` back button (`←`).
- **Menu Registration**: When adding a new widget in `lib/widgets/`, register its route and label in `lib/widgets/menu.dart`.
