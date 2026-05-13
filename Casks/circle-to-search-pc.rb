cask "circle-to-search-pc" do
  version "0.1.2"
  sha256 "27550c71b9ac8557eb2c0a96792b61647fc779d52da462853f6d0f1c65d43a2a"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.2/circle-to-search-pc-macos-aarch64.dmg"

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
