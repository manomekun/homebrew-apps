cask "imechen" do
  version "1.0.0"

  on_arm do
    sha256 "f2d926382dd0c050562876278a430820254a5f5898620c586ea47b093da983d2"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "a29d9ff06f150e3cae0bebf56c0c61d104b0a54387b54fc6f019faab9b9c4877"
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
