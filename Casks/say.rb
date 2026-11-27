cask "say" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.4"
  sha256 arm:   "82c2f01e37715da95359ae33c76e0c2d4d62fa4751e2a34e7746b1caa6d58914",
         intel: "018dbf991fecf143254dccd59b465c0874c8ed4dba701fc6c1811bd89469296b"

  url "https://github.com/svanichkin/say/releases/download/v#{version}/say-macos-#{arch}.zip"
  name "Say"
  desc "Peer-to-peer video calls over Yggdrasil, in a window or a terminal"
  homepage "https://github.com/svanichkin/say"

  depends_on macos: ">= :tahoe"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Say.app"
  # The same binary in the terminal; Homebrew's bin comes before /usr/bin,
  # so it shadows the system's text-to-speech say.
  binary "#{appdir}/Say.app/Contents/MacOS/say"
end
