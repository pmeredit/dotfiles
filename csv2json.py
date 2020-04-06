import collections
import csv
import json
import sys
import re


dt = re.compile("\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d")
d = re.compile("\d\d\d\d-\d\d-\d\d")
t = re.compile("\d\d:\d\d:\d\d")

def rep_null(values):
    return map(lambda x: None if x == "NULL" or x == "" else x, values)

def convert_numbers(values):
    def convert_number(value):
        try:
            value = float(value)
        finally:
            return value
    return map(convert_number, values)

def convert_dates(values):
    def convert_date(value):
        if type(value) != str:
            return value
        if dt.match(value):
            sp = value.split(' ')
            return {"$date": sp[0] + "T" + sp[1] + ".0Z"}
        if d.match(value):
            return {"$date": value + "T" + "00:00:00.0Z"}
        if t.match(value):
            return {"$date": "1970-01-01T" + value + ".0Z"}
        return value
    return map(convert_date, values)



def json_format(headers, values):
    z = map(list, zip(headers, convert_dates(convert_numbers(rep_null(values)))))
    for i, (k, v) in enumerate(z):
        if k.startswith('bool'):
            z[i][1] = bool(v)
    return json.dumps(collections.OrderedDict(z))


with open(sys.argv[1]) as csvfile:
    csvreader = csv.reader(csvfile)
    for i, row in enumerate(csvreader):
        if i == 0:
            headers = ['_id'] + row
            continue
        print(json_format(headers, [i] + row))
