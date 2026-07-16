class Grokers < Formula
  desc "grok-build harness, unshackled: BYOK coding agent for Claude/GPT/local LLMs"
  homepage "https://github.com/codingmydna/grokers"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/codingmydna/grokers/releases/download/v0.1.0/grokers-darwin-arm64.tar.gz"
      sha256 "7f0db136217fb70f138e200e4cf9c6b784cfdbb47546c93da2c5640efc567509"
    end
  end

  def install
    bin.install "grokers"
    pkgshare.install "profiles", "grokers-setup.sh"
  end

  def caveats
    <<~EOS
      Pick a model profile (writes ~/.grok/config.toml):
        bash #{pkgshare}/grokers-setup.sh
    EOS
  end

  test do
    assert_match "0.1", shell_output("#{bin}/grokers --version")
  end
end
