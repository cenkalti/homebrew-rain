# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.13.0"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v1.13.0/rain_1.13.0_macos.tar.gz"
    sha256 "f15b5da49f7a31f868cdf88ade9807307e07f080b02b1ff1fa438b8f6847d70f"

    def install
      bin.install "rain"
      output = Utils.popen_read("#{bin}/rain bash-autocomplete")
      (bash_completion/"rain").write output
      prefix.install_metafiles
    end

    on_arm do
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
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/cenkalti/rain/releases/download/v1.13.0/rain_1.13.0_linux.tar.gz"
        sha256 "7b63a28ee66d7f1edf0b9885e49b265e5d10f35fb2646de44a50e79c12154388"

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
