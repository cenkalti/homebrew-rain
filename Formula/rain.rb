# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "2.0.0"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v2.0.0/rain_2.0.0_macos.tar.gz"
    sha256 "9efc3f9ec68f9d36049411a82919fd11a25ec0d57b4cf3e0f0d7adbe8ba9d4b1"

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
        url "https://github.com/cenkalti/rain/releases/download/v2.0.0/rain_2.0.0_linux.tar.gz"
        sha256 "bfbf0a948a568e674da92c3175e761694447af50540d150ce33dda270e0d7d47"

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
