#! /usr/bin/bash

unzip ../source/duplicate_files.zip -d dest/

declare -A checksum_map

find dest/duplicate_files/ -type f | while read file; do
  checksum=$(sha256sum "$file" | awk '{print $1}')

  if [[ -n "${checksum_map[$checksum]}" ]]; then
    echo "Duplicate found: $file (original: ${checksum_map[$checksum]})"
    rm "$file"
  else
    checksum_map["$checksum"]="$file"
  fi
done
