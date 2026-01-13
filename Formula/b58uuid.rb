class B58uuid < Formula
  desc "Compact Base58 UUID Encoder CLI"
  homepage "https://b58uuid.io"
  version "1.0.0"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-arm64.tar.gz"
      sha256 "adb9c287ae67e6daa90eb524b3c556d16a42d95259d62e2604411f0b26edb7f3"
    else
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-amd64.tar.gz"
      sha256 "REPLACE_WITH_ACTUAL_SHA256_AMD64"
    end
  end

  on_linux do
    url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-linux-amd64.tar.gz"
    sha256 "REPLACE_WITH_ACTUAL_SHA256_LINUX"
  end

  def install
    bin.install "b58uuid"
  end

  test do
    system "#{bin}/b58uuid", "--version"
    assert_match "b58uuid 1.0.0", shell_output("#{bin}/b58uuid --version")
    
    # Test encode
    output = shell_output("#{bin}/b58uuid encode 550e8400-e29b-41d4-a716-446655440000")
    assert_match "BWBeN28Vb7cMEx7Ym8AUzs", output
    
    # Test decode
    output = shell_output("#{bin}/b58uuid decode BWBeN28Vb7cMEx7Ym8AUzs")
    assert_match "550e8400-e29b-41d4-a716-446655440000", output
    
    # Test generate (should output 22 characters)
    output = shell_output("#{bin}/b58uuid generate")
    assert_match /^[A-HJ-NP-Za-km-z1-9]{22}$/, output.strip
  end
end
