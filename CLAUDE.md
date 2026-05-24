# App Name

LearnHub - E-Learning App

# Design System

Use the Canva UI as inspiration.

# Theme

Light clean theme with indigo and coral accents

# Layout

Mobile first, card-based scrollable layout

# Flutter Requirements

- Material 3
- Riverpod
- GoRouter
- Cached Network Image for course thumbnails
- Clean architecture

# Screens

- Home Screen (banner, categories, course list)
- Course Detail Screen (syllabus, instructor, enroll)
- My Learning Screen (progress, continue watching)
- Profile Screen

# Components

- Course card with thumbnail, rating, progress bar
- Category tab selector
- Welcome banner with CTA button
- Progress bar component
- Bottom navigation bar

# Commands

- Run app: `flutter run -d chrome --web-port=3000`
- Run tests: `flutter test`
- Get packages: `flutter pub get`

# Code Style

- Use const constructors where possible
- Prefer named parameters for widgets
- Extract reusable widgets into separate files under lib/widgets/
- Use Riverpod providers for state, not setState
- Follow feature-first folder structure: lib/features/<feature>/

# UX Rules

- All screens must be responsive and mobile-first
- Use loading skeletons instead of spinners for content loading
- Empty states must have a message and an action button
- Navigation transitions should feel smooth — use GoRouter transitions
- Typography must be readable: minimum 14sp for body text
- Maintain visual consistency with the Canva mockup — same colors, spacing, and card style

# Known Issues

- Add any recurring bugs or workarounds here so Claude remembers the fix
