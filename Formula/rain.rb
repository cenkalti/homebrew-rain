# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.8.7"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v1.8.7/rain_1.8.7_macos.tar.gz"
    sha256 "aa607a84220fd176ea22b934ed755397bdbf9f0671e4a55a62365be5a423439c"

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
      url "https://github.com/cenkalti/rain/releases/download/v1.8.7/rain_1.8.7_linux.tar.gz"
      sha256 "774004cbe3ea5b8c0dcbed71a949917a3fe6440b83da88054a3ca6a58e7ebe90"

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
