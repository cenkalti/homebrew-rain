# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.2.4"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cenkalti/rain/releases/download/v1.2.4/rain_1.2.4_macos.tar.gz"
    sha256 "db001ccd6ac574596e45005023ff11f223c43ed3b4b2c0fbf042b2a8695cd0fc"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cenkalti/rain/releases/download/v1.2.4/rain_1.2.4_linux.tar.gz"
      sha256 "351c4fa16b95ce2cea88a028914549d36b72795ab37c614417f08ab3c52f2235"
    end
  end

  def install
    bin.install "rain"
    output = Utils.popen_read("#{bin}/rain bash-autocomplete")
    (bash_completion/"rain").write output
    prefix.install_metafiles
  end

  test do
    system "#{bin}/rain --version"
  end
end
