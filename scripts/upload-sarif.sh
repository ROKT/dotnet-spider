#!/bin/bash

set -euo pipefail

echo "--- Uploading sarif results"
sarif=$(gzip -c sarif.txt | base64)

echo "Authenticating user using personal access token"

echo "Uploading SARIF to Github"
curl -X POST \
    -v -H "Authorization: token" \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/ROKT/dotnet-spider/code-scanning/sarifs" \
    -d '{"commit_sha":"${commit_sha}","ref":"refs/heads/feature/scs-sarif","sarif":"${sarif}"}'
