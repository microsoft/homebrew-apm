class Apm < Formula
  desc "Agent Package Manager (APM): The NPM for AI-Native Development"
  homepage "https://github.com/microsoft/apm"
  version "0.38.0"
  license "Apache-2.0"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-arm64.tar.gz"
    sha256 "8f690c840c1d7b0c4b07247128ae5414cb6d6ad0509ae1d5dd9d7dd42c934cdc"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-x86_64.tar.gz"
    sha256 "e66806bcbb9ecb1ae6206978c9c90b76c307756cebffccf441ecf6c7afa77161"
  elsif Hardware::CPU.arm? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-arm64.tar.gz"
    sha256 "48180e3ef423dfd0b0342fd37f5d267074fce63627bcf8124f340774bb645a85"
  elsif Hardware::CPU.intel? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-x86_64.tar.gz"
    sha256 "28ff1842580ad75aa3c76e4c90f9daa6ee3b13867df2f3dece7bf666430a9104"
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