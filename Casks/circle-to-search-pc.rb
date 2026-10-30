cask "circle-to-search-pc" do
  version "0.1.4"
  sha256 "2c0bc8f75ada2b88f7a66342af11b306c9ca880088ffa09211684c05b6c82d47"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v0.1.4/circle-to-search-pc-macos-aarch64.dmg"
  name "Circle to Search"
  desc "Circle-to-search for desktop — Google Lens search from any screen region"
  homepage "https://github.com/nkasozi/circle-to-search-pc"

  depends_on :macos

  app "Circle to Search.app"

  preflight_steps do
    terminate_process "circle-to-search-pc", match: :full
    remove "{{appdir}}/Circle to Search.app", recursive: true
  end

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-cr", "{{appdir}}/Circle to Search.app"],
        must_succeed:   false,
        writable_paths: ["{{appdir}}/Circle to Search.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.circle-to-search.app",
    "~/Library/Caches/com.circle-to-search.app",
    "~/Library/Preferences/com.circle-to-search.app.plist",
  ]
end
