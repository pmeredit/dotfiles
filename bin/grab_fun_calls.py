#!/usr/bin/env python2

import os
import sys

if len(sys.argv) < 1:
    print("usage:")
    print("\tgrab_fun_calls.py <function_name>")

fun_name = sys.argv[1]
name_len = len(fun_name)

call_sites = set([])

def remove_white_space_chars(s):
    out = ""
    in_str = False
    for c in s:
        if in_str:
            if c == '"':
                in_str = False
            out += c
        else:
            if c == '"':
                out += c
                in_str = True
            elif c not in ' \t\n\v':
                out += c
    return out

files = (f for f in os.listdir('.') if os.path.isfile(f))
for f in files:
    with open(f) as fl:
        inp = " ".join(fl.readlines())
        in_call = 0
        buf = ""
        i = 0
        while i < len(inp):
            c = inp[i]
            if in_call > 0:
               if c == ")":
                    in_call -= 1
               elif c == "(":
                    in_call += 1
               buf += c
               i += 1
               if in_call == 0:
                   call_sites.add(remove_white_space_chars(buf).replace(',)',')'))
            else:
                try:
                    inp = inp[i:]
                    i = inp.index(fun_name)
                    in_call += 1
                    buf = fun_name + "("
                    i += name_len + 1
                except:
                    break

for call_site in sorted(call_sites):
    print(call_site)
