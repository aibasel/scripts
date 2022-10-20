#! /usr/bin/env python

"""
Delete "revision-cache" and "*-grid-steps" directories in all data
directories below the base directory. Additionally, zip and afterwards
delete all "*-eval" directories and any corresponding original experiment
directories.
"""

import argparse
import os
from pathlib import Path
import shutil
import subprocess


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("base_dir")
    return parser.parse_args()


def remove_dir(directory):
    print("Removing {}".format(directory))
    shutil.rmtree(directory, ignore_errors=True)


def main():
    args = parse_args()
    base_dir = Path(args.base_dir).resolve()
    for root, dirs, files in os.walk(base_dir):
        if "data" in dirs:
            data_dir = Path(root) / "data"
            print(f"\nClean {data_dir}\n")
            subprocess.check_call(["clean-data-dir.py", data_dir])
            dirs.remove("data")

if __name__ == "__main__":
    main()
