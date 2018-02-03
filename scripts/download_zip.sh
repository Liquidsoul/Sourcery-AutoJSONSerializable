#!/usr/bin/env bash
set -euo pipefail

# Download a zip file from a given URL and unzip it in the output folder.

readonly PROGNAME=$(basename "$0")

is_file() {
  local file=$1

  [[ -f $file ]]
}

delete_file() {
  local file_path=$1
  (is_file "$file_path" \
     && rm "$file_path") \
    || true
}

download() {
  local install_dir=$1
  local download_url=$2
  curl -Lo "$install_dir" "$download_url"
}

main() {
  if [[ $# -ne 2 ]]
  then
    echo "Invalid usage"
    echo " $PROGNAME <OUTPUT_PATH> <URL>"
    exit 1
  fi

  local output_dir=$1; shift
  local download_url=$1; shift
  local archive_path
  archive_path=/tmp/$(basename "$download_url")

  delete_file "$archive_path"
  download "$archive_path" "$download_url"
  unzip "$archive_path" -d "$output_dir"
}

if [ "${BASH_SOURCE[0]:-}" = "$0" ]; then
  main "$@"
fi
