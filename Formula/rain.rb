# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.2.5"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/cenkalti/rain/releases/download/v1.2.5/rain_1.2.5_macos.tar.gz"
    sha256 "1501a3ece8699261088646ee281e9c7ab35dafd5556c9278909d0b4fb43d2b6c"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/cenkalti/rain/releases/download/v1.2.5/rain_1.2.5_linux.tar.gz"
      sha256 "4181179db76c3123efcb9f86f886656318d8ddd3ca4e0ca8097376484fc50b89"
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
