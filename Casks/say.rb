cask "say" do
  arch arm: "arm64", intel: "amd64"

  version "2.0.7"
  sha256 arm:   "fd9b430e3d182de022ee723ccf315a6269d629d6e9d84a900cac40ba215debef",
         intel: "85e37a2bb46469a75bd0b0b917943b2d0003befd90986990b1b004e6a1034553"

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
