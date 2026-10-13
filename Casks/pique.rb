cask "pique" do
  version "0.2.0"
  sha256 "dc4f0c486f6f9009c5c004cbf0b648b085122a08b7f5e074e389f93c706bf570"

  url "https://github.com/loicbisiere/pique/releases/download/v#{version}/Pique-#{version}.zip"
  name "Pique"
  desc "Menu bar camera and print status for Bambu Lab 3D printers"
  homepage "https://github.com/loicbisiere/pique"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pique.app"

  uninstall quit: "com.loicbisiere.Pique"

  zap trash: "~/Library/Preferences/com.loicbisiere.Pique.plist"

  caveats <<~EOS
    Pique is not notarized by Apple yet, so macOS blocks its first launch.
    Open it once, then go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
