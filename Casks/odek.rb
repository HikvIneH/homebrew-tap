cask "odek" do
  version "0.5.0"
  sha256 "2435f7bfc0e5c4c86a99ebd1a38a23e40e72056e69daa2f0818c6ff11d3da27a"

  url "https://github.com/HikvIneH/odek/releases/download/v#{version}/Odek-#{version}.zip"
  name "odek"
  desc "Tiny native terminal for running coding agents side by side"
  homepage "https://github.com/HikvIneH/odek"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Odek.app"
  binary "#{appdir}/Odek.app/Contents/Resources/odek"

  # Not notarized yet: clear the download quarantine so macOS opens it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Odek.app"]
  end

  zap trash: [
    "~/Library/Application Support/Odek",
    "~/Library/Preferences/com.hikvineh.odek.plist",
    "~/Library/Saved Application State/com.hikvineh.odek.savedState",
  ]
end
