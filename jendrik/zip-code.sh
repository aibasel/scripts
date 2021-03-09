#! /bin/bash

set -euo pipefail

REVISION="$1"
NAME="$2" # e.g., seipp-helmert-icaps2019-code
ZIPFILE="$NAME.zip"

git archive --worktree-attributes --format zip --prefix "$NAME/" -o "$ZIPFILE" "$REVISION"

echo "Zipfile: file://$(realpath $ZIPFILE)"
