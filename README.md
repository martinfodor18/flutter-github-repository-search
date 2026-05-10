# GitHub Repository Search

A Flutter application for searching GitHub repositories with a modern responsive UI, repository detail pages, local caching, and dark mode support.

## Features

- Search GitHub repositories
- Repository details page
- Owner avatar and GitHub profile access
- Repository GitHub link support
- Local repository caching with SharedPreferences
- Dark mode support
- Responsive mobile and web layout
- Snackbar-based error handling
- Reusable class-based widgets
- Theme-based UI architecture

## Architecture

The project follows a simplified clean architecture approach with clear separation between:

- UI layer
- Bloc state management
- Repository layer
- API service layer
- Reusable widget components

### State Management

- flutter_bloc
- Bloc + Event/State architecture

### Networking

- Dio HTTP client
- GitHub REST API integration

### Routing

The project currently uses Flutter navigation with the architecture prepared for future migration to `go_router` if advanced web routing and deep-link support become required.

### Local Storage

- SharedPreferences-based caching

## Packages Used

- flutter_bloc
- dio
- shared_preferences
- intl
- url_launcher

## Getting Started

### Install dependencies

```bash
flutter pub get
```

### Run the application

```bash
flutter run
```

### Run Flutter Web

```bash
flutter run -d chrome
```

## Web Support

The application supports Flutter Web and responsive layouts.

The architecture has been prepared for future URL-based navigation and deep-link support using `go_router` if extended web support becomes a requirement.

## Project Structure

```text
lib/
├── blocs/
├── models/
├── pages/
├── repositories/
├── router/
├── services/
├── theme/
├── utils/
└── widgets/
```
