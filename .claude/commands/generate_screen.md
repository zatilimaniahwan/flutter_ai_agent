# Generate Flutter Screen

Generate a Flutter screen based on the provided design reference.

## Rules

Follow all instructions defined in CLAUDE.md before generating any code.

## Screen Requirements

### Framework & Architecture

- Use Flutter with Material 3
- Follow clean architecture (presentation / domain / data layers)
- Use Riverpod for state management
- Use GoRouter for navigation if routing is needed

### UI Standards

- Match the layout, spacing, and color from the design reference as closely as possible
- Use responsive layout (LayoutBuilder or MediaQuery)
- Extract reusable widgets into separate files under `lib/features/<feature>/presentation/widgets/`
- Use const constructors wherever possible
- Use loading skeletons instead of spinners for content loading
- Empty states must have a message and an action button
- Navigation transitions must feel smooth — use GoRouter transitions
- Minimum 14sp for body text
- Maintain visual consistency with the Canva mockup — same colors, spacing, and card style

### File Structure

Generate the following files:

- `lib/features/<feature>/presentation/screens/<screen_name>_screen.dart` — main screen
- `lib/features/<feature>/presentation/widgets/<component_name>_widget.dart` — reusable components
- `lib/features/<feature>/providers/<screen_name>_provider.dart` — Riverpod providers if state is needed

### Theming

- Use ThemeData from `lib/core/theme/app_theme.dart`
- Do not hardcode colors or text styles — reference theme tokens
- Follow the light clean theme with indigo and coral accents from CLAUDE.md

### Code Quality

- Add comments for non-obvious logic
- Name variables and functions descriptively
- No unused imports
- Use const constructors where possible
- Prefer named parameters for widgets
- Follow feature-first folder structure: `lib/features/<feature>/`
- Run `flutter analyze` after generating and fix any warnings

## Output Checklist

Before finishing, confirm:

- [ ] Screen matches the design reference
- [ ] No hardcoded colors or magic numbers
- [ ] Widgets are broken into reusable components
- [ ] File structure follows the feature-first convention
- [ ] Loading state uses skeleton, not spinner
- [ ] Empty state has message and action button
- [ ] Typography uses minimum 14sp for body text
- [ ] Navigation uses GoRouter transitions
- [ ] Code passes `flutter analyze`
