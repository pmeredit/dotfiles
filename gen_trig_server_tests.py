from math import *

funcs = {
        "Asin": asin,
        "Asinh": asinh,
        "Acos": acos,
        "Acosh": acosh,
        "Atan": atan,
        "Atan2": atan2,
        "Atanh": atan,
        "Sinh": sinh,
        "Cosh": cosh,
        "Tanh": tanh,
        "Sin": sin,
        "Cos": cos,
        "Tan": tan,
    }

def gen_acs(name, int_args, float_args):
    print "/* ------------------------- Expression%s -------------------------- */"%name
    print
    print "class Expression%sTest : public ExpressionNaryTestOneArgApproximate {"%name
    print "public:"
    print """
virtual void assertEvaluates(Value input, Value output) override {
    intrusive_ptr<ExpressionContextForTest> expCtx(new ExpressionContextForTest());
       _expr = new Expression%s(expCtx);
       ExpressionNaryTestOneArgApproximate::assertEvaluates(input, output);
    }
};"""%name
    f = funcs[name]
    print
    print "TEST_F(Expression%sTest, IntArg) {"%name
    for i in int_args:
        print "    assertEvaluates(Value(%s), Value(%s));"%(i, f(i))
    print "}"
    print
    print "TEST_F(Expression%sTest, LongArg) {"%name
    for i in int_args:
        print "    assertEvaluates(Value(%sLL), Value(%s));"%(i, f(i))
    print "}"
    print
    print "TEST_F(Expression%sTest, DoubleArg) {"%name
    for i in float_args:
        print "    assertEvaluates(Value(%s), Value(%s));"%(i, f(i))
    print "}"
    print
    print "TEST_F(Expression%sTest, DecimalArg) {"%name
    for i in float_args:
        print '    assertEvaluates(Value(Decimal128("%s")), Value(Decimal128("%s")));'%(i, f(i))
    print "}"
    print """
TEST_F(Expression%sTest, NullArg) {
    assertEvaluates(Value(BSONNULL), Value(BSONNULL));
}"""%name
    print

def gen_acs_atan2(name, int_args, float_args):
    print '/* ------------------------- Expression%s -------------------------- */'%name
    print
    print 'class Expression%sTest : public ExpressionNaryTestTwoArgApproximate {'%name
    print 'public:'
    print '''
virtual void assertEvaluates(Value input1, Value input2, Value output) override {
    intrusive_ptr<ExpressionContextForTest> expCtx(new ExpressionContextForTest());
       _expr = new Expression%s(expCtx);
       ExpressionNaryTestTwoArgApproximate::assertEvaluates(input1, input2, output);
    }
};'''%name
    f = funcs[name]
    print
    print 'TEST_F(Expression%sTest, TwoIntArgs) {'%name
    for i1, i2 in int_args:
        print '    assertEvaluates(Value(%s), Value(%s), Value(%s));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, TwoLongArg) {'%name
    for i1, i2 in int_args:
        print '    assertEvaluates(Value(%sLL), Value(%sLL), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, LongIntArg) {'%name
    for i1, i2 in int_args:
        print '    assertEvaluates(Value(%sLL), Value(%s), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, IntLongArg) {'%name
    for i1, i2 in int_args:
        print '    assertEvaluates(Value(%s), Value(%sLL), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, TwoDoubleArg) {'%name
    for i1, i2 in float_args:
        print '    assertEvaluates(Value(%s), Value(%s), Value(%s));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, TwoDecimalArg) {'%name
    for i1, i2 in float_args:
        print '    assertEvaluates(Value(Decimal128("%s")), Value(Decimal128("%s")), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, DoubleDecimalArg) {'%name
    for i1, i2 in float_args:
        print '    assertEvaluates(Value(%s), Value(Decimal128("%s")), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print
    print 'TEST_F(Expression%sTest, DecimalDoubleArg) {'%name
    for i1, i2 in float_args:
        print '    assertEvaluates(Value(Decimal128("%s")), Value(%s), Value(Decimal128("%s")));'%(i1, i2, f(i1, i2))
    print '}'
    print '''
TEST_F(Expression%sTest, NullArg) {
    assertEvaluates(Value(BSONNULL), Value(BSONNULL), Value(BSONNULL));
    assertEvaluates(Value(1), Value(BSONNULL), Value(BSONNULL));
    assertEvaluates(Value(BSONNULL), Value(1), Value(BSONNULL));
}'''%name
    print

tan_int = [-1, 0, 1]
tan_float = [-1.5, -pi/3, -pi/4, 0, pi/4, pi/3, 1.5]

atan2_int = [(1,0), (1,0), (-1,0), (0,-1)]
atan2_float = map(lambda x: (cos(x), sin(x)), [0.0, pi/6, pi/4, pi/3, pi/2, 2 * pi/3, 3*pi/4, 5*pi/6, pi, 7*pi/6, 5*pi/4, 4*pi/3, 3*pi/2, 5*pi/3, 7 * pi/4, 11*pi/6, 2*pi])

for n in ["Asin", "Acos"]:
    int_args = [0,1]
    float_args = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
    gen_acs(n, int_args, float_args)

gen_acs("Atan", tan_int, tan_float)
gen_acs_atan2("Atan2", atan2_int, atan2_float)

for n in ["Cos", "Cosh", "Sin", "Sinh", "Tan", "Tanh"]:
    if n != "Tan":
        int_args = [0,1,2,3,4,5,6]
        float_args = [0.0, pi/6, pi/4, pi/3, pi/2, 2 * pi/3, 3*pi/4, 5*pi/6, pi, 7*pi/6, 5*pi/4, 4*pi/3, 3*pi/2, 5*pi/3, 7 * pi/4, 11*pi/6, 2*pi]
    else:
        int_args = tan_int
        float_args = tan_float
    gen_acs(n, int_args, float_args)
