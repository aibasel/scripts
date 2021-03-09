#! /usr/bin/env python3

from __future__ import print_function

import argparse
import os
import shutil
import subprocess


COMPRESSION_METHODS = {
    "gz": "z",
    "bz2": "j",
    "xz": "J",
}


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+")
    parser.add_argument("--keep", action="store_true")
    parser.add_argument("-c", "--compression", default="xz",
                        choices=list(COMPRESSION_METHODS.keys()) + ["zip"])
    return parser.parse_args()


def main():
    args = parse_args()

    for filename in args.files:
        filename = os.path.abspath(filename)
        filename = filename.rstrip("/")
        dirname, basename = os.path.split(filename)

        if args.compression == "zip":
            tarball = basename + ".zip"
            cmd = ["zip", "-r", tarball, basename]
        else:
            tarball = basename + ".tar." + args.compression
            cmd = [
                "tar", "-" + COMPRESSION_METHODS[args.compression],
                "-cvf", tarball, basename]

        print("\nArchive {} under {}\n".format(filename, tarball))
        subprocess.check_call(cmd, cwd=dirname)

        if not args.keep:
            if os.path.isdir(filename):
                shutil.rmtree(filename)
            else:
                os.remove(filename)


if __name__ == "__main__":
    main()
