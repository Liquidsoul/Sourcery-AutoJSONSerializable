#!/bin/sh

readonly VERSION=0.7.2
readonly INSTALL_PATH=tools/Sourcery
readonly DOWNLOAD_URL=https://github.com/krzysztofzablocki/Sourcery/releases/download/$VERSION/Sourcery-$VERSION.zip

readonly SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"

main() {
  $SCRIPT_DIR/download_tool.sh $INSTALL_PATH $DOWNLOAD_URL
}
main
