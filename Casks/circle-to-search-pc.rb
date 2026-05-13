cask "circle-to-search-pc" do
  version "0.1.1.8"
  sha256 "268a01ee101ce1666006ddd25004edeae64aebba4ee35e494f0b6cb8d2e0c836"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.1.8/circle-to-search-pc-macos-aarch64.dmg"

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

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "/Applications/Circle to Search.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/com.circle-to-search.app",
    "~/Library/Preferences/com.circle-to-search.app.plist",
    "~/Library/Caches/com.circle-to-search.app",
  ]
end
