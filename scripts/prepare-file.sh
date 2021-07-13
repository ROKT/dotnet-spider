#!/bin/bash

set -euo pipefail

export file=$(gzip -c sarif.txt | base64)
#export file
echo $file