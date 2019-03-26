#!/usr/bin/env python

import sys
import yaml

if len(sys.argv) < 2:
    print >> sys.stderr, "Usage: ./pipeformatter.py <filename>"

pipeline = yaml.load(open(sys.argv[1]))

for stage in pipeline:
    if '$addFields' in stage:
        fields = stage["$addFields"]
        print "{'$addFields': {"
    elif '$project' in stage:
        fields = stage["$project"]
        print "{'$project': {"
    else:
        print stage
        continue
    for key in fields:
            print "\t" + key + ": " + str(fields[key])
    print "\t}\n}"
