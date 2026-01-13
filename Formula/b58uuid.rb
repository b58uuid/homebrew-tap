class B58uuid < Formula
  desc "Compact Base58 UUID Encoder CLI"
  homepage "https://b58uuid.io"
  version "1.0.1"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.1/b58uuid-darwin-arm64.tar.gz"
      sha256 "3a80589bfeecaf5d7aaa633726af6209dffebad49979dd8a99d3467405e0b65e"
    else
      url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.1/b58uuid-darwin-amd64.tar.gz"
      sha256 "665970fe0b1e757ecc514ed13d6fab4fcb5b03b1f16655b43464ec09844087bd"
    end
  end

  on_linux do
    url "https://github.com/b58uuid/b58uuid-cli/releases/download/v1.0.1/b58uuid-linux-amd64.tar.gz"
    sha256 "3ca3d8774ec055e02f3c94137d51da73c59c3ad48ba1924e43f09eedd0ae119d"
  end

  def install
    bin.install "b58uuid"
  end

  test do
    system "#{bin}/b58uuid", "--version"
    assert_match "b58uuid 1.0.1", shell_output("#{bin}/b58uuid --version")
    
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
