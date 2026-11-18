cask "imechen" do
  version "1.0.3"

  on_arm do
    sha256 "9305a669481615b228b63d9f4667579dd1b2c497b274e7ae7efb3a6091d00cc1"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "7f0ea5e52bda1e5c8fefea50ef2a816747b00de8b31b8a28cc57d86e237c9cec"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_x64.dmg"
  end

  name "imechen"
  desc "Offline image/video converter and compressor"
  homepage "https://github.com/manomekun/imechen"

  depends_on macos: :monterey

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/imechen.app"],
                   sudo: false
  end

  app "imechen.app"
end
