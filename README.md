# Homebrew Tap for APM

This is the official Homebrew tap for [APM](https://github.com/microsoft/apm).

## What is APM?

**The NPM for AI-Native Development** - Natural language in Markdown is the new scripting language. Now you can build, package, share, and run Markdown agentic prompts and workflows across any LLM runtime.

**Think npm + Node.js, but for Natural Language (Markdown).**

## Installation

```bash
brew install microsoft/apm/apm
```

## Quick Start

```bash
# Setup AI runtime with GitHub Models
apm runtime setup codex
export GITHUB_TOKEN=your_token_here

# Initialize your first APM project
apm init my-hello-world
cd my-hello-world

# Install and run
apm install
apm run start --param name="<YourGitHubHandle>"
```

## More Information

Visit the [main repository](https://github.com/microsoft/apm) for complete documentation, examples, and guides.

**APM makes AI prompts as shareable and reusable as code packages.**