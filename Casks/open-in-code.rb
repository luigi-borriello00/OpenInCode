cask "open-in-code" do
  version "2.0"
  sha256 :no_check

  url "https://github.com/luigi-borriello00/OpenInCode/releases/download/v#{version}/Open.in.Code.app.zip",
      verified: "github.com/luigi-borriello00/OpenInCode/"
  name "Open in Code"
  desc "Open the current Finder folder in Visual Studio Code"
  homepage "https://github.com/luigi-borriello00/OpenInCode"

  depends_on macos: ">= :big_sur"
  depends_on formula: "visual-studio-code"

  app "Open in Code.app"

  uninstall_postflight do
    "To uninstall, drag the app out of the Finder toolbar (hold ⌘ and drag away)."
  end

  zap trash: []

  caveats do
    <<~EOS
      After installing, hold ⌘ and drag Open in Code.app into the Finder toolbar.
      On first launch, right-click the app and select "Open" to bypass Gatekeeper.
    EOS
  end
end
