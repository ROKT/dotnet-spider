# Fork of Dotnet Spider

**Description**

This repository is created only to demonstrate the use of Code Scanning Alerts. This is a public repository within Rokt. 

Link to the original public repository: [Dotnet Spider](https://github.com/dotnetcore/DotnetSpider)

This is sample code scanning API for uploading SARIF results to Github.

```commit_sha``` will be replaced by the actual commit it.

```ref``` will be replaced by the git reference, output of the command ```git show-ref```. 

```sarif``` will be replaced by the base64 value of gzip'd "sarif results file".

```
curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/octocat/hello-world/code-scanning/sarifs \
  -d '{"commit_sha":"commit_sha","ref":"ref","sarif":"sarif"}'

```

**Permissions required**

```security_events``` permission is required for either the personal access token or Github App being used. 
