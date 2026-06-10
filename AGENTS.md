# AGENTS.md

## Build

```bash
./build.sh
```

Outputs `build/Open in Code.app`. No xcodebuild, no SPM — just `swiftc` + `lipo`.

## Architecture

- **Single source file**: `Sources/main.swift` (~40 lines, top-level code, no `@main` struct)
- **App is headless**: `LSUIElement = true` — no windows, no Dock icon, runs and exits immediately
- **No Xcode project**: the build script invokes `swiftc` directly; only Xcode Command Line Tools are needed
- **Only VS Code (not Insiders)**: hardcoded `com.microsoft.VSCode` bundle ID in `openInVSCode()`

## Universal binary

The script compiles arm64 and x86_64 separately and merges with `lipo -create`. A single `swiftc` call cannot produce a fat binary.

## Icon

`Resources/AppIcon.icns` is copied from `/Applications/Visual Studio Code.app/Contents/Resources/Code.icns` at build time. If VS Code is not at that path, the icon is silently skipped.

## Testing

No test suite exists. To verify manually:

```bash
./build.sh
"build/Open in Code.app/Contents/MacOS/OpenInCode"
# should exit 0 and open the current Finder folder in VS Code
```

## Release

Push a tag `v*` to trigger `.github/workflows/release.yml`. The workflow builds the universal binary, ad-hoc signs it, zips the `.app`, and creates a GitHub Release.
