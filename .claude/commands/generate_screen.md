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
- Extract reusable widgets into separate files under `lib/widgets/`
- Use const constructors wherever possible

### File Structure

Generate the following files:

- `lib/screens/<screen_name>_screen.dart` — main screen
- `lib/widgets/<component_name>_widget.dart` — reusable components
- `lib/providers/<screen_name>_provider.dart` — Riverpod providers if state is needed

### Theming

- Use ThemeData from `lib/core/theme/app_theme.dart`
- Do not hardcode colors or text styles — reference theme tokens
- Follow the purple gradient modern UI style from CLAUDE.md

### Code Quality

- Add comments for non-obvious logic
- Name variables and functions descriptively
- No unused imports
- Run `flutter analyze` after generating and fix any warnings

## Output Checklist

Before finishing, confirm:

- [ ] Screen matches the design reference
- [ ] No hardcoded colors or magic numbers
- [ ] Widgets are broken into reusable components
- [ ] File structure follows the convention above
- [ ] Code passes `flutter analyze`
