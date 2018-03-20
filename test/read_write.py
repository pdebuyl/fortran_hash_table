"""
Read a "equal sign" separated input file
"""
from __future__ import print_function

## \file read_write.py
# \brief Using a dict to store a configuration file
#
# The purpose of this code is a comparison to read_write.f90

import argparse

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('file')
args = parser.parse_args()

d = {}

with open(args.file, 'r') as f:
    for l in f.readlines():
        l = l.strip()
        if '=' in l:
            k, v = l.split('=')
            d[k.strip()] = v.strip()

for k, v in d.items():
    print(k, '=', v)

