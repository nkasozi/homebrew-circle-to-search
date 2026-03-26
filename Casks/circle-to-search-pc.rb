cask "circle-to-search-pc" do
  version "0.1.1.0"
  sha256 "8c106320fec76c4be31a3d3ce9ada60668a553c5fd298da7174717e515b67c1b"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.1.0/circle-to-search-pc-macos-aarch64.dmg"

  name "Circle to Search"
  desc "Circle-to-search for desktop — Google Lens search from any screen region"
  homepage "https://github.com/nkasozi/circle-to-search-pc"

  app "Circle to Search.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args: ["-f", "circle-to-search-pc"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.circle-to-search.app",
    "~/Library/Preferences/com.circle-to-search.app.plist",
    "~/Library/Caches/com.circle-to-search.app",
  ]
end
