#!/usr/local/bin/python3.12
import os

def clear_dir(dir_path):
    filelist = [ f for f in os.listdir(dir_path) if f.endswith(".elc") and os.path.isfile(os.path.join(dir_path, f)) ]
    for f in filelist:
        os.remove(os.path.join(dir_path, f))

    dirlist = [ d for d in os.listdir(dir_path) if os.path.isdir(os.path.join(dir_path, d)) ]
    for d in dirlist:
        clear_dir(os.path.join(dir_path, d))

clear_dir(os.path.dirname(__file__))
