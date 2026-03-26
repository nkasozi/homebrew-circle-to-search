cask "circle-to-search-pc" do
  version "0.1.0.9"
  sha256 "3948121b3ab5510a7e70b505d6bf20d82f52fc507f72e19352515c8fbfa53543"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.0.9/circle-to-search-pc-macos-aarch64.dmg"

  name "Circle to Search"
  desc "Circle-to-search for desktop — Google Lens search from any screen region"
  homepage "https://github.com/nkasozi/circle-to-search-pc"

  app "Circle to Search.app"

  zap trash: [
    "~/Library/Application Support/com.circle-to-search.app",
    "~/Library/Preferences/com.circle-to-search.app.plist",
    "~/Library/Caches/com.circle-to-search.app",
  ]
end
