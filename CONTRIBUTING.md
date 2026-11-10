# Contributing to APM Homebrew Tap

This project welcomes contributions and suggestions. Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## License

APM-owned tap content is licensed under [Apache-2.0](LICENSE).
[NOTICE](NOTICE) preserves Microsoft attribution and the historical MIT notice.
Previously published MIT revisions and third-party material retain their
applicable terms. Redistributors should retain the applicable license and notices.

The formula's `license` describes the APM release it installs, not this tap.
The current v0.35.0 payload remains MIT, so both `Formula/apm.rb` and
`Formula/apm.rb.template` still declare MIT.

Before the daily upstream poller can consume the first Apache-licensed APM
release, coordinate the formula and template license update with that release.
Verify the actual release's LICENSE and NOTICE, update the template and rendered
formula together for the selected version, and retain the normal checksum
verification. The poller currently substitutes only versions and checksums; it
does not discover license changes. Do not relabel an older MIT payload.
