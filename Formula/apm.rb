class Apm < Formula
  desc "Agent Package Manager (APM): The NPM for AI-Native Development"
  homepage "https://github.com/microsoft/apm"
  version "0.8.1"
  license "MIT"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-arm64.tar.gz"
    sha256 "69255b3901694055f4a59ffcbcbd04a1d381d34929a5ec83633c9b6d4e3c0823"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-x86_64.tar.gz"
    sha256 "0fea4aa565db4db0278843af2865142c86d3dca8dae9136b6d2ac62d29196c79"
  elsif Hardware::CPU.arm? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-arm64.tar.gz"
    sha256 "b1a48452f4380e4150900971b8ef44d733046a79f6e4f398613649a7587d7552"
  elsif Hardware::CPU.intel? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-x86_64.tar.gz"
    sha256 "5fe92614420c35cb2e2449d95def42ad88d3afff557ee348416469f5bdd351c8"
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