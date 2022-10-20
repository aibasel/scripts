#! /usr/bin/env python

"""
Delete "revision-cache" and "*-grid-steps" directories in the given data
directory. Additionally, zip and afterwards delete all "*-eval"
directories and any corresponding original experiment directories.
"""

import argparse
from pathlib import Path
import shutil
import subprocess


COMPRESSION_METHODS = {
    "gz": "z",
    "bz2": "j",
    "xz": "J",
}


def parse_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("data_dir")
    parser.add_argument("-c", "--compression", default="xz",
                        choices=["gz", "bz2", "xz", "zip", "none"])
    return parser.parse_args()

def remove_dir(directory):
    print("Removing {}".format(directory))
    shutil.rmtree(directory, ignore_errors=True)


def main():
    args = parse_args()
    data_dir = Path(args.data_dir).resolve()
    assert data_dir.name == "data", data_dir

    remove_dir(data_dir / "revision-cache")
    for path in sorted(data_dir.glob("*-grid-steps")):
        remove_dir(path)
    for path in sorted(data_dir.glob("*-eval")):
        if args.compression != "none":
            subprocess.check_call(["archive.py", "-c", args.compression, path])
            exp_dir = Path(str(path).rstrip("/")[:-len("-eval")])
            if exp_dir.is_dir():
                subprocess.check_call(["archive.py", "-c", args.compression, exp_dir])


if __name__ == "__main__":
    main()
