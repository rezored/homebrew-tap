cask "cubicle-crew" do
  version "2.13.1"
  sha256 "1c91495d5ad9e1e4fc8052039b39abb6edbfaf5c11c204b6a8dc11cfc09d8055"

  url "https://github.com/rezored/cubicle-crew/releases/download/v#{version}/CubicleCrew-#{version}-mac.dmg"
  name "Cubicle Crew"
  desc "Shows your Claude Code agents as pixel-art coworkers in a tiny office"
  homepage "https://github.com/rezored/cubicle-crew"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Cubicle Crew.app"

  # Безплатен проект без Apple Developer ID: махаме карантината, иначе macOS не дава да се отвори
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cubicle Crew.app"]
  end

  zap trash: [
    "~/.pixel-office",
    "~/Library/Application Support/pixel-office",
  ]

  caveats <<~EOS
    Cubicle Crew is not signed with an Apple Developer ID (it is a free project).
    This cask removes the quarantine flag so it opens normally.
  EOS
end
