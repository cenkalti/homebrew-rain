# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.12.0"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v1.12.0/rain_1.12.0_macos.tar.gz"
    sha256 "bfc7a7344dbc9b5c27bc92a26ec75c2374cc5662cdafa8b832d9c83a22187373"

    def install
      bin.install "rain"
      output = Utils.popen_read("#{bin}/rain bash-autocomplete")
      (bash_completion/"rain").write output
      prefix.install_metafiles
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the Rain
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/cenkalti/rain/releases/download/v1.12.0/rain_1.12.0_linux.tar.gz"
      sha256 "b59c553665e3d5bedb68cec1755a413e96834447826a80b5f3105381209d1421"

      def install
        bin.install "rain"
        output = Utils.popen_read("#{bin}/rain bash-autocomplete")
        (bash_completion/"rain").write output
        prefix.install_metafiles
      end
    end
  end

  test do
    system "#{bin}/rain --version"
  end
end
