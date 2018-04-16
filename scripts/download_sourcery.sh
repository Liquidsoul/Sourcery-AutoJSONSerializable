#!/usr/bin/env bash
set -euo pipefail

readonly VERSION=0.12.0
readonly INSTALL_PATH=tools/Sourcery
readonly DOWNLOAD_URL=https://github.com/krzysztofzablocki/Sourcery/releases/download/$VERSION/Sourcery-$VERSION.zip

readonly SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"

main() {
  "$SCRIPT_DIR"/download_tool.sh $INSTALL_PATH $DOWNLOAD_URL
}

if [ "${BASH_SOURCE[0]:-}" = "$0" ]; then
  main
fi
