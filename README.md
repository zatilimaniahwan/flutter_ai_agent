# LearnHub - Flutter AI Agent

A Flutter e-learning app built with Claude Code and Canva AI, demonstrating an AI-driven workflow from UI design to working mobile app.

## Tech Stack

- Flutter with Material 3
- Riverpod for state management
- GoRouter for navigation
- Cached Network Image for course thumbnails
- Clean architecture (presentation / domain / data layers)

## Prerequisites

Before you start, make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Node.js](https://nodejs.org) (LTS version)
- [Claude Code](https://claude.ai/code)

## Installation

### 1. Clone the repository

\`\`\`bash
git clone https://github.com/zatilimaniahwan/flutter_ai_agent.git
cd flutter_ai_agent
\`\`\`

### 2. Install Flutter dependencies

\`\`\`bash
flutter pub get
\`\`\`

### 3. Install Claude Code

\`\`\`bash
npm install -g @anthropic-ai/claude-code
\`\`\`

### 4. Verify Claude Code installation

\`\`\`bash
claude --version
\`\`\`

### 5. Add Playwright MCP server

\`\`\`bash
claude mcp add playwright npx @playwright/mcp@latest
\`\`\`

### 6. Verify MCP is connected

\`\`\`bash
claude mcp list
\`\`\`

You should see `playwright` listed.

## Running the App

### Run on Chrome (web)

\`\`\`bash
flutter run -d chrome
\`\`\`

The app will launch at `http://localhost:3000` or another available localhost port.

### Run on mobile emulator

\`\`\`bash
flutter run
\`\`\`

## AI-Driven Workflow

This project follows a four-step workflow to go from design to working app:

### Step 1 — Design in Canva AI

- Create your UI mockup in Canva
- Export the design as a PNG file
- Place it in the `designs/` folder

### Step 2 — Set up CLAUDE.md

The `CLAUDE.md` file in the project root gives Claude Code persistent context about the project including:

- App name and design system
- Theme — light clean with indigo and coral accents
- Flutter requirements and architecture rules
- Screen and component definitions
- Code style conventions
- UX rules

### Step 3 — Generate screens with Claude Code

Open Claude Code inside the project folder:

\`\`\`bash
claude
\`\`\`

Reference the design and generate a screen:

\`\`\`
@designs/dashboard_ui.png

Generate Flutter home screen
based on this Canva design.

Use the instructions from CLAUDE.md.

/plan
\`\`\`

Or use the custom command for consistent screen generation:

\`\`\`
@designs/dashboard_ui.png

/generate_screen
\`\`\`

### Step 4 — Visual review with Playwright

With the app running locally, ask Claude Code to review the UI:

\`\`\`
Navigate to localhost:3000

Review the Flutter dashboard UI.

Analyze:

- responsiveness
- spacing
- typography
- visual consistency
  \`\`\`

Claude will analyze the rendered app and suggest fixes based on the UX rules defined in CLAUDE.md.

## Project Structure

\`\`\`
lib/
├── core/
│ └── theme/
│ └── app_theme.dart
├── features/
│ ├── home/
│ │ ├── presentation/
│ │ │ ├── screens/
│ │ │ └── widgets/
│ │ └── providers/
│ ├── courses/
│ ├── my_learning/
│ └── profile/
└── widgets/
designs/
.claude/
├── commands/
│ └── generate_screen.md
└── settings.local.json
CLAUDE.md
\`\`\`

## MCP Permissions

The `.claude/settings.local.json` file pre-configures allowed commands to avoid repeated permission prompts:

\`\`\`json
{
"permissions": {
"allow": [
"Bash(flutter analyze *)",
"Bash(node -e ' *)"
]
}
}
\`\`\`

## Screens

- Home Screen — welcome banner, category tabs, course list
- Course Detail Screen — syllabus, instructor info, enroll button
- My Learning Screen — progress tracking, continue watching
- Profile Screen — user info and settings

## Components

- Course card with thumbnail, rating, and progress bar
- Category tab selector
- Welcome banner with CTA button
- Progress bar component
- Bottom navigation bar

## References

- [Claude Code Documentation](https://platform.claude.com/docs/en/get-started)
- [Claude Certification Curriculum](https://claudecertificationguide.com/learn)
- [Learn Prompting](https://learnprompting.org/docs/agents/introduction)
- [Introduction to Generative AI and Agents](https://learn.microsoft.com/en-us/training/modules/fundamentals-generative-ai/)
- [Flutter Documentation](https://docs.flutter.dev/)
