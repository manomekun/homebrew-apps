cask "imechen" do
  version "0.2.3"

  on_arm do
    sha256 "6c3eddc1ce413f561b7f02c62f9e2bacd4fed0efe587f623d1a2b97fe767dbcd"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "8c681214530ee1c515f9ca36d30c481082f746431d6ae268a54ac5f6fd3a5236"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_x64.dmg"
  end

  name "imechen"
  desc "Offline image/video converter and compressor"
  homepage "https://github.com/manomekun/imechen"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/imechen.app"],
                   sudo: false
  end

  app "imechen.app"
end
