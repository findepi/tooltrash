
import sys, os.path, re, math, socket, hashlib
import collections, itertools, functools
from pprint import pprint

import rlcompleter
import readline
readline.parse_and_bind("tab: complete")


inspector_itemstr_len = 28
def inspect(item):

    keys = dir(item)
    okes = []
    for k in keys:

        if not k or k[0] == '_':
            continue

        try:
            v = getattr(item, k)
        except:
            continue

        t = type(v)
        if "instancemethod" in str(t):
            continue

        okes.append((k, v))

    maxkl = 0
    for k, _ in okes:
        maxkl = max(maxkl, len(k))


    itemstr = str(item)
    if len(itemstr) > inspector_itemstr_len:
        itemstr = itemstr[:(inspector_itemstr_len - 4)] + " ..."
    for k, v in okes:
        print itemstr, ':', "%s%s = %s" % (k, " " * (maxkl - len(k)), repr(v))


