import os
import shutil
import sys
import pathlib
import urllib

TOKEN = os.getenv("GEMFURY_DEPLOY_TOKEN")
assert TOKEN is not None


def main():
    target_files = []

    for target in target_files:
        print(f"publishing {target}")


if __name__ == "__main__":
    main()
