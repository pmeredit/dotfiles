cols = [
"alter table partsupp change `_id.ps_partkey` `ps_partkey`",
"alter table partsupp change `_id.ps_suppkey` `ps_suppkey`",
"alter table part change `_id` `p_partkey`",
"alter table supplier change `_id` `s_suppkey`",
"alter table nation change `_id` `n_nationkey`",
"alter table region change `_id` `r_regionkey`",
"alter table lineitem change `_id.l_orderkey` `l_orderkey`",
"alter table lineitem change `_id.l_linenumber` `l_linenumber`",
"alter table orders change `_id` `o_orderkey`",
"alter table customer change `_id` `c_custkey`",
"alter table mongo_lineitem change `o_lineitems.l_comment` `l_comment`, " ,
"alter table mongo_lineitem change `o_lineitems.l_commitdate` `l_commitdate`, " ,
"alter table mongo_lineitem change `o_lineitems.l_discount` `l_discount`, " ,
"alter table mongo_lineitem change `o_lineitems.l_extendedprice` `l_extendedprice`, " ,
"alter table mongo_lineitem change `o_lineitems.l_linenumber` `l_linenumber`, " ,
"alter table mongo_lineitem change `o_lineitems.l_linestatus` `l_linestatus`, " ,
"alter table mongo_lineitem change `o_lineitems.l_p_brand` `l_p_brand`, " ,
"alter table mongo_lineitem change `o_lineitems.l_p_container` `l_p_container`, " ,
"alter table mongo_lineitem change `o_lineitems.l_p_name` `l_p_name`, " ,
"alter table mongo_lineitem change `o_lineitems.l_p_size` `l_p_size`, " ,
"alter table mongo_lineitem change `o_lineitems.l_p_type` `l_p_type`, " ,
"alter table mongo_lineitem change `o_lineitems.l_partkey` `l_partkey`, " ,
"alter table mongo_lineitem change `o_lineitems.l_quantity` `l_quantity`, " ,
"alter table mongo_lineitem change `o_lineitems.l_receiptdate` `l_receiptdate`, " ,
"alter table mongo_lineitem change `o_lineitems.l_returnflag` `l_returnflag`, " ,
"alter table mongo_lineitem change `o_lineitems.l_s_n_name` `l_s_n_name`, " ,
"alter table mongo_lineitem change `o_lineitems.l_s_name` `l_s_name`, " ,
"alter table mongo_lineitem change `o_lineitems.l_s_nationkey` `l_s_nationkey`, " ,
"alter table mongo_lineitem change `o_lineitems.l_s_r_name` `l_s_r_name`, " ,
"alter table mongo_lineitem change `o_lineitems.l_s_regionkey` `l_s_regionkey`, " ,
"alter table mongo_lineitem change `o_lineitems.l_shipdate` `l_shipdate`, " ,
"alter table mongo_lineitem change `o_lineitems.l_shipinstruct` `l_shipinstruct`, " ,
"alter table mongo_lineitem change `o_lineitems.l_shipmode` `l_shipmode`, " ,
"alter table mongo_lineitem change `o_lineitems.l_suppkey` `l_suppkey`, " ,
"alter table mongo_lineitem change `o_lineitems.l_tax` `l_tax`",
"alter table mongo_partsupp change `p_suppliers.ps_availqty` `ps_availqty`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_comment` `ps_comment`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_s_n_name` `ps_s_n_name`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_s_name` `ps_s_name`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_s_nationkey` `ps_s_nationkey`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_s_r_name` `ps_s_r_name`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_s_regionkey` `ps_s_regionkey`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_suppkey` `ps_suppkey`, " ,
"alter table mongo_partsupp change `p_suppliers.ps_supplycost` `ps_supplycost`",
"alter table mongo_supplier change `_id` `s_suppkey`",
"alter table mongo_partsupp change `_id` `p_partkey`",
"alter table mongo_part change `_id` `p_partkey`",
"alter table mongo_orders change `_id` `o_orderkey`",
"alter table mongo_lineitem change `_id` `o_orderkey`",
"alter table mongo_customer change `_id` `c_custkey`",
]

tables = [
"alter table mongo_orders_o_lineitems rename to mongo_lineitem",
"alter table mongo_part_p_suppliers rename to mongo_partsupp",
        ]

def get_col_renames(y):
    tokenized = list(filter(lambda x: x != '', y.split(" ")))
    after = "`" + tokenized[2] + "`." + tokenized[4]
    before1 = "`" + tokenized[2] + "`." + tokenized[5]
    before2 = tokenized[2] + "." + tokenized[5].replace('`','')
    return [(before1, after), (before2, after)]

def get_table_renames(y):
    tokenized = list(filter(lambda x: x != '', y.split(" ")))
    after = tokenized[2]
    before = tokenized[5]
    return before, after

def flat_map(f, l):
    ret = []
    for e in l:
        out = f(e)
        if type(out) == list:
            ret.extend(out)
        else:
            ret.append(out)
    return ret

cols = flat_map(get_col_renames, cols)
tables = list(map(get_table_renames, tables))
def format_ad_hoc(table, rnp):
    def ret(col):
        after = "`%s`.`%s.%s`"%(table,rnp,col)
        return [("`%s`.`%s`"%(table, col), after),
                ("%s.%s"%(table, col), after)] 
    return ret

ad_hoc1 = flat_map(format_ad_hoc('mongo_orders_o_lineitems', 'o_lineitems'), [
                                    "l_comment",
                                    "l_commitdate",
                                    "l_discount",
                                    "l_extendedprice",
                                    "l_linenumber",
                                    "l_linestatus",
                                    "l_p_brand",
                                    "l_p_container",
                                    "l_p_name",
                                    "l_p_size",
                                    "l_p_type",
                                    "l_partkey",
                                    "l_quantity",
                                    "l_receiptdate",
                                    "l_returnflag",
                                    "l_s_n_name",
                                    "l_s_name",
                                    "l_s_nationkey",
                                    "l_s_r_name",
                                    "l_s_regionkey",
                                    "l_shipdate",
                                    "l_shipinstruct",
                                    "l_shipmode",
                                    "l_suppkey",
                                    "l_tax",
                                    "o_lineitems_idx"])

ad_hoc2 = flat_map(format_ad_hoc('mongo_part_p_suppliers', 'p_suppliers'), [
    "ps_availqty",
    "ps_comment",
    "ps_s_n_name",
    "ps_s_name",
    "ps_s_nationkey",
    "ps_s_r_name",
    "ps_s_regionkey",
    "ps_suppkey",
    "ps_supplycost",
    ])


with open('testdata/benchmarks/tpch.yml', 'r') as f:
    for line in f:
        for before, after in cols:
            line = line.replace(before, after)
        for before, after in tables:
            line = line.replace(before, after)
        for before, after in ad_hoc1:
            line = line.replace(before, after)
        for before, after in ad_hoc2:
            line = line.replace(before, after)
        print(line[:-1])
