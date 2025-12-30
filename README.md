# cljs-chrome-github-ext

A Chrome extension for GitHub built with ClojureScript and shadow-cljs.

## Overview

This project provides a foundation for building Chrome extensions that enhance the GitHub experience. It uses ClojureScript compiled with shadow-cljs, following Chrome's Manifest V3 specification.

## Features

- ClojureScript with shadow-cljs for modern development workflow
- Hot reloading during development
- Reagent (React wrapper) for UI components
- Chrome Manifest V3 compliant
- Background service worker and content script architecture

## Requirements

- Node.js 22 or later
- pnpm 10.18.3 or later
- Java JDK 21 (for Clojure)
- Clojure CLI tools

Alternatively, use the included Nix flake for a reproducible development environment:

```bash
nix develop
```

## Installation

Install dependencies:

```bash
make install
```

Or manually:

```bash
pnpm install
```

## Development

Start the development server with hot reloading:

```bash
make watch
```

This starts shadow-cljs in watch mode, automatically recompiling on file changes.

### Loading the Extension in Chrome

1. Open Chrome and navigate to `chrome://extensions/`
2. Enable "Developer mode" in the top right corner
3. Click "Load unpacked"
4. Select the `resources-dev/public` directory (for development) or `resources/public` (for release builds)

## Building

Compile the extension:

```bash
make compile
```

Create a release build:

```bash
make release
```

Clean build artifacts:

```bash
make clean
```

## Project Structure

```
.
├── src/
│   └── cljs_chrome_github_ext/
│       ├── background.cljs    # Background service worker
│       └── content.cljs       # Content script for GitHub pages
├── resources/
│   └── public/
│       └── manifest.json      # Chrome extension manifest
├── deps.edn                   # Clojure dependencies
├── shadow-cljs.edn            # shadow-cljs build configuration
└── package.json               # Node.js dependencies
```

## Technology Stack

| Component | Technology |
|-----------|------------|
| Language | ClojureScript |
| Build Tool | shadow-cljs |
| UI Library | Reagent |
| React Version | 19.x |
| Package Manager | pnpm |
| Manifest Version | Chrome Manifest V3 |

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.
