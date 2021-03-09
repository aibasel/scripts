#! /bin/bash

# Prepare a zipfile for the given experiment (at EXPPATH) at a common
# ARCHIVE location. Keep original files. Example:
#   zip-exp.sh data/2021-02-12-A-saturated-pho ~/zenodo/saturated-pho

set -euo pipefail

EXPPATH=$1
ARCHIVE=$2

EVALPATH="${EXPPATH%/}-eval"
EXPNAME="$(basename $EXPPATH)"
EXPDEST="${ARCHIVE}/${EXPNAME}"
EVALNAME="$(basename $EVALPATH)"
EVALDEST="${ARCHIVE}/${EVALNAME}"
rm -rf "$EXPDEST" "$EVALDEST"
mkdir -p "$ARCHIVE"

# Archive experiment dir.
cp -r "$EXPPATH" "$EXPDEST"
cd "$EXPDEST"
rm -rf code-*
find . -name "domain.pddl" -delete
find . -name "problem.pddl" -delete
cd -

# Archive eval dir.
cp -r "$EVALPATH" "$EVALDEST"

# Zip directories.
archive.py -c zip "${EXPDEST}"
archive.py -c zip "${EVALDEST}"
