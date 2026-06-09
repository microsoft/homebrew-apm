class Apm < Formula
  desc "Agent Package Manager (APM): The NPM for AI-Native Development"
  homepage "https://github.com/microsoft/apm"
  version "0.19.0"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-arm64.tar.gz"
    sha256 "06bfcec4be3aff7d656e901a237e65cb835f244cbc0e02e02c780e72fb6cf294"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-x86_64.tar.gz"
    sha256 "485847073e208cd262159ca4e934e39c85b54d02b27c34eda36a6afc801b20b3"
  elsif Hardware::CPU.arm? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-arm64.tar.gz"
    sha256 "1a381f030a475f806c38d51a33b9af5f6e2eaf51cf20fd629f7322da0ca3dd78"
  elsif Hardware::CPU.intel? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-x86_64.tar.gz"
    sha256 "93c447da0857da55ff12e7071a5af974c0f85de9717155e7dc06682bc1afe362"
  end

  def install
    # Install the entire directory structure since the binary depends on _internal for dependencies
    libexec.install Dir["*"]
    
    # Fix PyInstaller framework signing issue: Homebrew fails to sign Python.framework
    # because it's ambiguous between app and framework bundle format
    if OS.mac?
      # Remove the problematic existing signature that confuses Homebrew's codesign
      python_framework = "#{libexec}/_internal/Python.framework/Python"
      if File.exist?(python_framework)
        system "codesign", "--remove-signature", python_framework
      end
    end
    
    bin.write_exec_script libexec/"apm"
  end

  test do
    system "#{bin}/apm", "--version"
  end
end