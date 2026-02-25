# Homebrew Tap for APM – Agent Package Manager

**An open-source, community-driven dependency manager for AI agents.** `apm.yml` declares the skills, prompts, instructions, and tools your project needs — so every developer gets the same agent setup. Packages can depend on packages, and APM resolves the full tree.

Think `package.json`, `requirements.txt`, or `Cargo.toml` — but for AI agent configuration.

The main APM repo with releases, documentation, and examples can be found here: https://github.com/microsoft/apm

### Install on macOS

```
brew tap microsoft/apm
brew install apm
```

### Update to a newer version

```
brew update
brew upgrade apm
```

### Uninstall

```
brew rm apm
brew untap microsoft/apm
```

### Cleanup

```
brew rm apm
brew untap microsoft/apm
brew cleanup --scrub
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft
trademarks or logos is subject to and must follow
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.