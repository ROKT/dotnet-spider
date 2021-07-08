#!/bin/bash

set -euo pipefail

echo "Switching PWD to scripts"
cd scripts
sarif=$(gzip -c scs-sarif.sh | base64)

curl -X POST \
    -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/repos/ROKT/dotnet-spider/code-scanning/sarifs" \
    -d '{"commit_sha":"d503cdc478da56bce6febacc1f0444e6b2c6827a","ref":"refs/remotes/origin/feature/scs-sarif","sarif":"${sarif}"}'
