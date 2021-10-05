# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.7.1"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/cenkalti/rain/releases/download/v1.7.1/rain_1.7.1_macos.tar.gz"
      sha256 "d5383bf85c1cc14da56e43a4fd9f45cba0583287c6919e8db24217e4754f614d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cenkalti/rain/releases/download/v1.7.1/rain_1.7.1_linux.tar.gz"
      sha256 "87bc3916c78f3ce851a2a69265412c164ee85439c9dc60c043d659773de6d4a2"
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
