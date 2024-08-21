# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Rain < Formula
  desc "BitTorrent client"
  homepage "https://github.com/cenkalti/rain"
  version "1.12.18"

  on_macos do
    url "https://github.com/cenkalti/rain/releases/download/v1.12.18/rain_1.12.18_macos.tar.gz"
    sha256 "76e7a1c9459bf1fd056a1f554407be500a64d8aae34fc8a08ea62bdee84bc30f"

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
        url "https://github.com/cenkalti/rain/releases/download/v1.12.18/rain_1.12.18_linux.tar.gz"
        sha256 "3817726e0c8782d60a0659b52cc15cacec612d26f556780c8e2b8bae6aca2c4b"

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
