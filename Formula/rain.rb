# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "2.2.0"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v2.2.0/rain_2.2.0_macos.tar.gz"
    sha256 "a38aa029c6198b143c8d55e943ea6e7adc3e2643ea26e17f7d28c0e7ae0411e9"

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
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cenkalti/rain/releases/download/v2.2.0/rain_2.2.0_linux.tar.gz"
        sha256 "1636d5c1adf24a7d90531f39a49315c1d49feede5a05a5e9b2a7c7164f2f2ef7"

        def install
          bin.install "rain"
          output = Utils.popen_read("#{bin}/rain bash-autocomplete")
          (bash_completion/"rain").write output
          prefix.install_metafiles
        end
      end
    end
  end

  test do
    system "#{bin}/rain --version"
  end
end
