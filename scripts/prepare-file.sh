#!/bin/bash

set -euo pipefail

export file_value=$(gzip -c sarif.txt | base64)
echo $file_value

buildkite-agent meta-data set "$file_value"