#! /usr/bin/env python3

"""
Example call:

zip-experiments.py data/2021-02-12-A-saturated-pho data/2021-02-12-B-other-exp ~/zenodo/saturated-pho
"""

import argparse
from pathlib import Path
import subprocess


DIR = Path(__file__).resolve().parent


def parse_args():
    parser = argparse.ArgumentParser(usage=__doc__)
    parser.add_argument('expdir', nargs="+", help="zip these experiment dirs (keep originals)")
    parser.add_argument('archive', help="collect zipfiles here")
    return parser.parse_args()


def main():
    args = parse_args()
    print(args)
    archive = Path(args.archive)
    archive.mkdir(parents=True, exist_ok=False)
    for expdir in args.expdir:
        exppath = Path(expdir).resolve()
        if str(exppath).endswith(("-eval", "-grid-steps")):
            print(f"Skipping {exppath}")
            continue
        print(f"Archive {exppath} to {archive}")
        subprocess.check_call([DIR / "zip-exp.sh", exppath, archive])


if __name__ == "__main__":
    main()
