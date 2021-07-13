#!/bin/bash

set -euo pipefail

export file_value=$(gzip -c sarif.txt | base64)
echo $file_value