#!/bin/bash

set -euo pipefail

echo "Restoring nuget packages"

dotnet restore DotnetSpider.sln \
    --verbosity quiet

~/.dotnet/tools/security-scan DotnetSpider.sln --export=sarif.txt