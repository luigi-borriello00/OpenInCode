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

### Build from source

```bash
git clone https://github.com/luigi-borriello00/OpenInCode.git
cd OpenInCode
./build.sh
```

## Usage

Click the icon in the Finder toolbar — it opens the current Finder folder in VS Code.

<p align="center">
  <img src=".github/assets/Using.gif" alt="Using Open in Code" width="600">
  <br><br>
  <img src=".github/assets/Dragging.gif" alt="Dragging to Finder toolbar" width="600">
</p>

> **First launch:**
> 1. Right-click the app and select *Open* to bypass Gatekeeper.
> 2. macOS will ask permission for the app to control Finder — click *OK*.
> 3. If the permission dialog doesn't appear, go to *System Settings > Privacy & Security > Automation* and enable the toggle for "Open in Code" under Finder.

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