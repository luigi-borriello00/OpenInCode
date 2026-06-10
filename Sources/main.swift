import AppKit
import Foundation

let SCRIPT_TIMEOUT_SECONDS = 5

func getFinderPath() -> String? {
    let script = """
    tell application "Finder"
        if (count of Finder windows) > 0 then
            return POSIX path of (target of front Finder window as alias)
        else
            return POSIX path of (desktop as alias)
        end if
    end tell
    """

    let appleScript = NSAppleScript(source: script)
    var error: NSDictionary?

    guard let output = appleScript?.executeAndReturnError(&error).stringValue,
          error == nil
    else {
        if let errorInfo = error {
            NSLog("AppleScript error: \(errorInfo)")
        }
        return nil
    }

    return output
}

func openInVSCode(path: String) {
    let task = Process()
    task.launchPath = "/usr/bin/open"
    task.arguments = ["-n", "-b", "com.microsoft.VSCode", "--args", path]
    task.launch()
    task.waitUntilExit()
}

guard let finderPath = getFinderPath() else {
    exit(1)
}

openInVSCode(path: finderPath)
