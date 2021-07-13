#!/bin/bash

set -euo pipefail

export file=$(gzip -c sarif.txt | base64)
#export file
env | grep file