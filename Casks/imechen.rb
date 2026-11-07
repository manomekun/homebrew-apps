cask "imechen" do
  version "1.0.2"

  on_arm do
    sha256 "c8df480e96fc169692db4c272d363ebb88adbdf2bcbe4890e96dbe2592e4aad1"
    url "https://github.com/manomekun/imechen/releases/download/#{version}/imechen_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "21de77be5022c36ebea62598e6f95e62b36d7becf8d649a424447e9fa248f6e5"
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
