#!/bin/bash

set -euo pipefail

echo "--- Restores and builds the solution for SAST"

SONARQUBE_HOST_URL="https://sonarqube.eng.roktinternal.com"
PROJECT_NAME="dotnet-spider"
SONARQUBE_TOKEN_VALUE_ENV=${1:?"Missing argument \$1 for SonarQube token"}

find ./src -name '*.csproj' | xargs -I % dotnet add % package \
    Microsoft.Net.Compilers.Toolset --version 3.8.0

find ./src -name '*.csproj' | xargs -I % dotnet add % package \
    SecurityCodeScan.VS2019 --version 5.1.0

find ./src -name '*.csproj' | xargs -I % dotnet add % package \
    HtmlAgilityPack --version 1.11.39

dotnet sonarscanner begin \
        /k:"${PROJECT_NAME}" \
        /d:sonar.host.url="${SONARQUBE_HOST_URL}" \
        /d:sonar.login="${SONARQUBE_TOKEN_VALUE_ENV}" \
        /d:sonar.branch.name="feature/sonarqube"

find ./src -name '*DotnetSpider.csproj' | xargs -I % dotnet build % >> scs_results.txt

dotnet sonarscanner end \
        /d:sonar.login="${SONARQUBE_TOKEN_VALUE_ENV}"