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

## Build

```bash
git clone https://github.com/YOUR_USERNAME/OpenInCode.git
cd OpenInCode
./build.sh
```

The script compiles a universal binary (`arm64` + `x86_64`) and packages it into `build/Open in Code.app`.

## Install

1. Open the `build/` folder in Finder
2. Hold `⌘` (Command) and drag `Open in Code.app` into the Finder toolbar
3. Click it whenever you want to open the current folder in VS Code

> **macOS Gatekeeper:** if you see a security warning, right-click the app and select *Open*, then confirm.

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