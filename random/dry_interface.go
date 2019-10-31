package main

import "fmt"

type Comparable interface {
  IsComparable()
}

type Comparer interface {
    lt(l,r Comparable) bool
    lte(l,r Comparable) bool
    gt(l,r Comparable) bool
    gte(l,r Comparable) bool
    eq(l,r Comparable) bool
    neq(l,r Comparable) bool
    cmp(l,r Comparable) int
}

type ComparerImpl struct {
  cmp func(l, r Comparable) int
}

func (c ComparerImpl) lt(l,r Comparable) bool {
  return c.cmp(l,r) < 0
}
func (c ComparerImpl) lte(l,r Comparable) bool {
  return c.cmp(l,r) <= 0
}
func (c ComparerImpl) gt(l,r Comparable) bool {
  return c.cmp(l,r) > 0
}
func (c ComparerImpl) gte(l,r Comparable) bool {
  return c.cmp(l,r) >= 0
}
func (c ComparerImpl) eq(l,r Comparable) bool {
  return c.cmp(l,r) == 0
}
func (c ComparerImpl) neq(l,r Comparable) bool {
  return c.cmp(l,r) != 0
}

type ComparableString string
type ComparableInt int
type StringIntPair struct {
  s string
  i int
}

func (ComparableString) IsComparable() {}
func (ComparableInt) IsComparable() {}
func (StringIntPair) IsComparable() {}

var StringComparer = ComparerImpl{
  cmp: func (l,r Comparable) int {
    // This is the part that sucks...
    // there seems to be no way around it.
    ls := l.(ComparableString)
    rs := r.(ComparableString)
    if ls == rs {
      return 0
    }
    if ls < rs {
      return -1
    }
    return 1
  },
}

// This is where generics will help, assuming they
// work this way... we could do impls for everything
// that actually has ==/</> defined in one code path.
var IntComparer = ComparerImpl{
  cmp: func (l,r Comparable) int {
    // This is the part that sucks...
    // there seems to be no way around it.
    ls := l.(ComparableInt)
    rs := r.(ComparableInt)
    if ls == rs {
      return 0
    }
    if ls < rs {
      return -1
    }
    return 1
  },
}

var StringIntPairComparer = ComparerImpl{
  cmp: func (l,r Comparable) int {
    // This is the part that sucks...
    // there seems to be no way around it.
    ls := l.(StringIntPair)
    rs := r.(StringIntPair)
    // We assume standard tuple ordering,
    // i.e., the first item's ordering
    // takes precidence over the second.
    if ls.s < rs.s {
      return -1
    }
    if ls.s == rs.s {
      if ls.i < rs.i {
        return -1
      }
      if ls.i == rs.i {
        return 0
      }
      return 1
    }
    return 1
  },
}

func Test(actual, expected interface{}) string {
  if actual == expected {
    return "Pass"
  }
  return "Failed"
}

func main() {
  fmt.Println(Test(StringComparer.lt(
    ComparableString("zello"), 
    ComparableString("world"),
    ), false))
  fmt.Println(Test(StringComparer.lt(
    ComparableString("hello"), 
    ComparableString("world"),
    ), true))
      fmt.Println(Test(IntComparer.lt(
    ComparableInt(4), 
    ComparableInt(3),
    ), false))
  fmt.Println(Test(IntComparer.lt(
    ComparableInt(4), 
    ComparableInt(42),
    ), true))
  fmt.Println(Test(StringIntPairComparer.lt(
    StringIntPair{"hello", 42},
    StringIntPair{"hello", 43},
  ), true))
    fmt.Println(Test(StringIntPairComparer.lt(
    StringIntPair{"hello", 42},
    StringIntPair{"helloo", 42},
  ), true))
  fmt.Println(Test(StringIntPairComparer.lt(
    StringIntPair{"hello", 43},
    StringIntPair{"hello", 42},
  ), false))
  fmt.Println(Test(StringIntPairComparer.lt(
    StringIntPair{"helloo", 42},
    StringIntPair{"hello", 42},
  ), false))
}
