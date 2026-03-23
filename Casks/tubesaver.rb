cask "tubesaver" do
  version "0.1.0"

  on_arm do
    sha256 "a73a1f5c82988ff76b9ccf5eb14ca833ce0161b99a329c05ff0d89663595c77b"
    url "https://github.com/manomekun/yt-dlp-ui/releases/download/#{version}/TubeSaver_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "9e6c8fb6f28a68a3eacb69ba29718c8a410de2a0882ed76ec8c6aea12eb06012"
    url "https://github.com/manomekun/yt-dlp-ui/releases/download/#{version}/TubeSaver_#{version}_x64.dmg"
  end

  name "TubeSaver"
  desc "YouTube video downloader with yt-dlp"
  homepage "https://github.com/manomekun/yt-dlp-ui"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/TubeSaver.app"],
                   sudo: false
  end

  app "TubeSaver.app"
end
