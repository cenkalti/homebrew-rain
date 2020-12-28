# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.5.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cenkalti/rain/releases/download/v1.5.2/rain_1.5.2_macos.tar.gz"
    sha256 "ae20840f59b76c7896715fa14140680e4e377561049da62a59fe969f2e9efd45"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/cenkalti/rain/releases/download/v1.5.2/rain_1.5.2_linux.tar.gz"
    sha256 "ef1b98e2a02c18e306606b3ccceabbcbfc8f1a13f1edf11b4c754c91041067b0"
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
