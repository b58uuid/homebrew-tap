class B58uuid < Formula
  desc "Compact Base58 UUID Encoder CLI"
  homepage "https://b58uuid.io"
  version "1.0.0"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-arm64.tar.gz"
      sha256 "748c6a565e6af30433a4b12343c24da0c8dedb0e3cdb7fa8d06d30935ac1ed8c"
    else
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-darwin-amd64.tar.gz"
      sha256 "8b8926b196638c84dd858274a5816aa2ffab18c29f366ed98a5f77aa0c7d262f"
    end
  end

  on_linux do
    url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.0/b58uuid-linux-amd64.tar.gz"
    sha256 "faa7ae876b83b2179e3b6b80ed1cac0db82efeca14a727aabd7d382aecba4a35"
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
