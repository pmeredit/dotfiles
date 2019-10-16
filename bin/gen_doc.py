def get_fresh_key(i):
    c = bytearray(i, encoding='utf-8')
    def fresh_key():
        nonlocal c
        if c[-1] < ord('z'):
            c[-1] += 1
        else:
            c += b'a'
        return str(c, encoding='utf-8')
    return fresh_key

fresh_key = get_fresh_key('`')

def gen_doc(n):
    if n <= 0:
        return 42
    return {fresh_key(): gen_doc_array(n-1, 3)}

def gen_doc_array(n, s):
    return [gen_doc(n) for _ in range(0, s)]

import sys
with open('tmp.js', 'w') as x:
   x.write( "db.bar.insert(")
   x.write( str(gen_doc(int(sys.argv[1]))))
   x.write( ")")
