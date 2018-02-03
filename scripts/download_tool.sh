#!/usr/bin/env bash
set -euo pipefail

# Delete the given output folder if it exists and replace it with the content of
# the zip at the given URL.

readonly SCRIPT_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
readonly PROGNAME=$(basename "$0")

is_dir() {
  local dir=$1

  [[ -d $dir ]]
}

delete_dir() {
  local dir_path=$1

  (is_dir "$dir_path" \
     && rm -rf "$dir_path") \
    || true
}

main() {
  if [[ $# -ne 2 ]]
  then
    echo "Invalid usage"
    echo " $PROGNAME <FOLDER_TOOL_PATH> <URL>"
    exit 1
  fi

  local folder_tool_path=$1; shift
  local download_url=$1; shift

  delete_dir "$folder_tool_path"
  echo "test"
  "$SCRIPT_DIR"/download_zip.sh "$folder_tool_path" "$download_url"
}

if [ "${BASH_SOURCE[0]:-}" = "$0" ]; then
  main "$@"
fi
