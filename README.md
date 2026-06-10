# Open in Code

A lightweight macOS utility that opens the current Finder folder in Visual Studio Code with a single click from the Finder toolbar.

> **Native Apple Silicon support** — no Rosetta required. Rewritten in Swift from the original [OpenInCode](https://github.com/sozercan/OpenInCode) by [Sertac Ozercan](https://github.com/sozercan).

## Features

- One-click: opens the active Finder window's folder in VS Code
- No windows, no Dock icon — runs entirely headless (`LSUIElement`)
- Universal binary: runs natively on both Intel and Apple Silicon Macs
- Zero dependencies beyond macOS Command Line Tools
- Minimal codebase (~30 lines of Swift)

## Requirements

- macOS 11.0 (Big Sur) or later
- [Visual Studio Code](https://code.visualstudio.com/) installed in `/Applications`
- Xcode Command Line Tools (`xcode-select --install`)

## Install

### Download (recommended)

1. Download `Open in Code.app.zip` from the [latest release](https://github.com/luigi-borriello00/OpenInCode/releases/latest)
2. Unzip it
3. Hold `⌘` and drag `Open in Code.app` into the Finder toolbar

### Homebrew

```bash
brew install --cask ./Casks/open-in-code.rb
```

Then hold `⌘` and drag the app from `/Applications` into the Finder toolbar.

### Build from source

```bash
git clone https://github.com/luigi-borriello00/OpenInCode.git
cd OpenInCode
./build.sh
```

## Usage

Click the icon in the Finder toolbar — it opens the current Finder folder in VS Code.

> **First launch:** right-click the app and select *Open* to bypass Gatekeeper.

## How It Works

1. macOS launches the app when clicked from the Finder toolbar
2. The app runs a short AppleScript to get the POSIX path of the frontmost Finder window (falls back to the Desktop if no window is open)
3. It invokes `/usr/bin/open -n -b com.microsoft.VSCode --args <path>` to open the folder in VS Code
4. The app exits immediately — no lingering processes, no Dock icon

## Uninstall

Drag the app icon out of the Finder toolbar (hold `⌘` and drag it away until you see the "poof" animation).

## Credits

Inspired by and rewritten from [sozercan/OpenInCode](https://github.com/sozercan/OpenInCode), the original Objective-C version created by [Sertac Ozercan](https://github.com/sozercan).

## License

MIT