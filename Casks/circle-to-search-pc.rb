cask "circle-to-search-pc" do
  version "0.1.5"
  sha256 "9d858fbe55b9d78b086a5fc1e358efbbc2b17d9bdb12107fe40d09b96007f0f6"

  url "https://github.com/nkasozi/circle-to-search-pc/releases/download/v#{version}/circle-to-search-pc-macos-aarch64.dmg"
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
