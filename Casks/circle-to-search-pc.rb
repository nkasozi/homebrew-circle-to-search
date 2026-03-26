cask "circle-to-search-pc" do
  version "0.1.1.1"
  sha256 "8a81567b1d4a06e57022c2fdd1809d1fa03b6a93829aba05a07b0414dda201ce"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.1.1/circle-to-search-pc-macos-aarch64.dmg"

  name "Circle to Search"
  desc "Circle-to-search for desktop — Google Lens search from any screen region"
  homepage "https://github.com/nkasozi/circle-to-search-pc"

  app "Circle to Search.app"

  preflight do
    system_command "/usr/bin/pkill",
                   args: ["-f", "circle-to-search-pc"],
                   must_succeed: false
    system_command "/bin/rm",
                   args: ["-rf", "/Applications/Circle to Search.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.circle-to-search.app",
    "~/Library/Preferences/com.circle-to-search.app.plist",
    "~/Library/Caches/com.circle-to-search.app",
  ]
end
