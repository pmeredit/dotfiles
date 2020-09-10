import csv
import sys

if len(sys.argv) < 2:
    sys.exit("usage python3 ./cole2crm.py <file name>")

def check_keys(l):
    expected_keys = {'Last Name', 'First Name', 
                     'House Number', 'Dir', 
                     'Street Name', 'Address 2', 
                     'City', 'ST', 'ZIP', 
                     'Home Phone', 'DNC Home', 
                     'Cell Phone', 'DNC Cell', 
                     'Email Address'}
    if len(expected_keys) != len(expected_keys & l.keys()):
        sys.exit("missing some headers: " + str(expected_keys - l.keys()))

def transform(l):
    dnc = 'FALSE' if l['DNC Home'] != 'OK' or l['DNC Cell'] != 'OK' else 'TRUE'
    return {'last_name': l['Last Name'], 
            'first_name': l['First Name'],
            'primary_address': 
                l['House Number'] + ' '
              + l['Dir'] + ' '
              + l['Street Name'] + ' '
              + l['Address 2'],
            'primary_city': l['City'],
            'primary_state': l['ST'],
            'primary_zip': l['ZIP'],
            'home_phone': l['Home Phone'],
            'cell_phone': l['Cell Phone'],
            'email': l['Email Address'],
            'phone_on': dnc,
            'text_on': dnc,
            'email_optin': 'TRUE',
            'status': 'Prospect',
            'deal_type': 'Seller',
            'hashtags': 'ZIP'+l['ZIP'],
            'source': 'Cole Realty'
           }

out = []
with open(sys.argv[1]) as f:
    csv_reader = csv.DictReader(f)
    for l in csv_reader:
        check_keys(l)
        out.append(transform(l))


fname = ".\\" + sys.argv[1].split(".")[1] + ".out.csv"
print("writing output to... " + fname)
with open(fname, 'w') as f:
    csv_writer = csv.DictWriter(f, fieldnames=out[0].keys())
    csv_writer.writeheader()
    for l in out:
        csv_writer.writerow(l)


