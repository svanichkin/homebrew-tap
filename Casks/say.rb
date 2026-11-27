cask "say" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.5"
  sha256 arm:   "4515d36781bc3dcbfeb84a67ead0e4e610a7594bf9203748c30f53233e1d4a0d",
         intel: "ca08835f194b6fc5ef953fceba565a80902089b180030a7235dc3fe54e65749b"

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
