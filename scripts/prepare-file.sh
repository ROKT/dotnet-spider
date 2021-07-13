#!/bin/bash

set -euo pipefail

gzip -c sarif.txt | base64 -w0 > sarif_base64.txt

buildkite-agent artifact upload "sarif_base64.txt"