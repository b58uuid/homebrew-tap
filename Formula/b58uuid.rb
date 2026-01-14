class B58uuid < Formula
  desc "Compact Base58 UUID Encoder CLI"
  homepage "https://b58uuid.io"
  version "1.0.0"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-arm64.tar.gz"
      sha256 "e326ce8569ccac2e31013cb973823085db1887a192049478d4b50b2ed9d3b938"
    else
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-amd64.tar.gz"
      sha256 "bcaf39e6543a4743a91198ce2a111c6c84686bfefcc133073613d686c2cd07b3"
    end
  end

  on_linux do
    url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-linux-amd64.tar.gz"
    sha256 "3d9d3c4e8ec3c12f5a1740987a0aec6f055b1e80ff0e8c01c1d6a5b6804f1258"
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
