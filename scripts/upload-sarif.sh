#!/bin/bash

set -euo pipefail

echo "Switching PWD to scripts"
cd scripts
sarif=$(gzip -c scs-sarif.sh | base64)

curl \ 
    -X POST \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/repos/ROKT/campaignsplatform/code-scanning/sarifs \
    -d '{"commit_sha":"9489c1a4f61a90dfc1f7fdd3c77df805840d9ff7", "ref":"refs/remotes/origin/feature/scs-sarif","sarif":"${sarif}"}'
