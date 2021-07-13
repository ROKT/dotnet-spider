#!/bin/bash

set -euo pipefail

file=$(gzip -c sarif.txt | base64)
export file
echo $file