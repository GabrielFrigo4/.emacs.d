#!/usr/bin/python

import subprocess
import sys
import re

def run_ghostscript(args):
    subprocess.run(["/usr/bin/rungs"] + args, check=True)

def get_png_path(arg):
    match = re.search(r'-sOutputFile=(.*)', arg)
    if match:
        return match.group(1).replace('%d', '*')
    return None

def apply_mogrify(path):
    """
    Command List
    [212;42] => 170
    [28;7] => 21
    """

    commands = [
        ("0%", "RGB(42,42,42)", "RGB(28,28,28)"),
        ("1%", "RGB(93,93,93)", "RGB(22,22,22)"),
        ("2%", "RGB(127,127,127)", "RGB(17,17,17)"),
        ("2%", "RGB(144,144,144)", "RGB(15,15,15)"),
        ("2%", "RGB(161,161,161)", "RGB(13,13,13)"),
        ("3%", "RGB(178,178,178)", "RGB(11,11,11)"),
        ("3%", "RGB(195,195,195)", "RGB(9,9,9)"),
        ("3%", "RGB(212,212,212)", "RGB(7,7,7)"),
    ]

    for fuzz, fill, opaque in commands:
        subprocess.run([
            "/usr/bin/mogrify", "-fuzz", fuzz, "-fill", fill, "-opaque", opaque, "-format", "png", path
        ], check=True)

def main():
    if len(sys.argv) < 2:
        sys.exit(1)

    run_ghostscript(sys.argv[1:])

    png_path = get_png_path(sys.argv[1])
    if png_path:
        apply_mogrify(png_path)
    else:
        sys.exit(1)

if __name__ == "__main__":
    main()
