class Apm < Formula
  desc "Agent Package Manager (APM): The NPM for AI-Native Development"
  homepage "https://github.com/microsoft/apm"
  version "0.39.0"
  license "Apache-2.0"

  if Hardware::CPU.arm? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-arm64.tar.gz"
    sha256 "8e91449c7a179292afdccfc1cbd00893297377191ec56693d65d91b563a9e9d6"
  elsif Hardware::CPU.intel? && OS.mac?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-darwin-x86_64.tar.gz"
    sha256 "b712c538543fc33b5d66120270116042ea82ad34ab220e7a7424b1bfe22c1012"
  elsif Hardware::CPU.arm? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-arm64.tar.gz"
    sha256 "01ba7e98b71469225298557dd06fb4ea9e8de61c739182d09b3e26c788c1d975"
  elsif Hardware::CPU.intel? && OS.linux?
    url "https://github.com/microsoft/apm/releases/download/v#{version}/apm-linux-x86_64.tar.gz"
    sha256 "3a84e9c14ab594c22e97f6ccc9be41bed14199fe4f4aa24a206d23b65919592d"
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