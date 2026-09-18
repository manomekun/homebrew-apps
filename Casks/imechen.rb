cask "imechen" do
  version "0.2.1"

  on_arm do
    sha256 :no_check
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 :no_check
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
