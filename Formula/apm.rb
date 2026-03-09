class Apm < Formula
  desc "Agent Package Manager (APM): The NPM for AI-Native Development"
  homepage "https://github.com/microsoft/apm"
  version "0.7.5"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-arm64.tar.gz"
    sha256 "5a5d771376d309a35350358f15e4171a4f7b01c9deae955c69f094b8810faae9"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-x86_64.tar.gz"
    sha256 "6c7ab38caf7114533f157722a6e3afc3306da366e080b7877d43235f3173be75"
  elsif Hardware::CPU.arm? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-arm64.tar.gz"
    sha256 "dcf07e1323b5914731048c1eb79d4cdb373765503d76b57f1a589483b9f5d62a"
  elsif Hardware::CPU.intel? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-x86_64.tar.gz"
    sha256 "0786e77b590a4b9c7d6d7625c68e98466667d98be988c5e607517a66eb4ce624"
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