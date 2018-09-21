#! /bin/bash

# Print all PDFs under current working dir:
find . -iname "*.pdf" ! -path "*/__MACOSX/*" -exec lp -o sides=two-sided-long-edge {} \;
