cask "toothpeek" do
  version "0.3.0"
  sha256 "b12ea2c18b8d20a208840d066f31561876f8043754e92cb2b1616d90243dce37"

  url "https://github.com/loicbisiere/toothpeek/releases/download/v#{version}/Toothpeek-#{version}.zip"
  name "Toothpeek"
  desc "Menu bar camera and print status for Bambu Lab 3D printers"
  homepage "https://github.com/loicbisiere/toothpeek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Toothpeek.app"

  uninstall quit: "com.loicbisiere.Toothpeek"

  zap trash: "~/Library/Preferences/com.loicbisiere.Toothpeek.plist"

  caveats <<~EOS
    Toothpeek is not notarized by Apple yet, so macOS blocks its first launch.
    Open it once, then go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
