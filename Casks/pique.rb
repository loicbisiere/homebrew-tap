# Template for Casks/pique.rb in github.com/loicbisiere/homebrew-tap.
# The release workflow (.github/workflows/build.yml) fills in 0.1.0 and fae1d3e8f3a3243bd17da06ee4c579d8dc3d8bd3b79e88d542d9921d2f65d0ba and pushes it to the tap.
cask "pique" do
  version "0.1.0"
  sha256 "fae1d3e8f3a3243bd17da06ee4c579d8dc3d8bd3b79e88d542d9921d2f65d0ba"

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
