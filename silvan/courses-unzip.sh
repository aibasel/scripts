#! /bin/bash

# Unzip all zipfiles under current working dir:
find . -name "*.zip" -execdir unzip {} \;
