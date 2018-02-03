#!/usr/bin/env bash
set -euo pipefail

readonly VERSION=0.21.0
readonly INSTALL_PATH=tools/swiftlint
readonly DOWNLOAD_URL=https://github.com/realm/SwiftLint/releases/download/$VERSION/portable_swiftlint.zip

readonly SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"

main() {
  "$SCRIPT_DIR"/download_tool.sh $INSTALL_PATH $DOWNLOAD_URL
}

if [ "${BASH_SOURCE[0]:-}" = "$0" ]; then
  main
fi
