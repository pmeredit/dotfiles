package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	err := checkConflicts([]string{})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b", "b.c"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b.0"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b.1"})
	fmt.Println(err.Error() == "array specified at path a.b has first index 1,"+
		" which must be 0")
	err = checkConflicts([]string{"a.b.0", "a.b.1"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b.0", "a.b.2"})
	fmt.Println(err.Error() == "previous index for array at path a.b was 0, "+
		"which is not monotonically contiguous with currently specified index 2")
	err = checkConflicts([]string{"a.b.0", "a.b.1", "a.b.0"})
	fmt.Println(err.Error() == "previous index for array at path a.b was 1, "+
		"which is not monotonically contiguous with currently specified index 0")
	err = checkConflicts([]string{"a.b.0", "a.b.1", "a.b.c"})
	fmt.Println(err)
	//	err = checkConflicts([]string{"a", "b.c", "a"})
	//	fmt.Println(err != nil)
	//	fmt.Println(err.Error() == "path a, specified more than once")
	//	err = checkConflicts([]string{"a.b", "b.c", "a.b"})
	//	fmt.Println(err != nil)
	//	fmt.Println(err.Error() == "path a.b, specified more than once")
	//	err = checkConflicts([]string{"a.b.c.d", "b.c", "a.b.c.d"})
	//	fmt.Println(err != nil)
	//	fmt.Println(err.Error() == "path a.b.c.d, specified more than once")
	//	err = checkConflicts([]string{"a.b.c", "b.c", "a.b.c.d"})
	//	fmt.Println(err != nil)
	//	fmt.Println(err.Error() == "prefix a.b.c of path a.b.c.d already exists as complete path")
	//	err = checkConflicts([]string{"a.b.c.d", "b.c", "a.b.c"})
	//	fmt.Println(err != nil)
	//	fmt.Println(err.Error() == "path a.b.c, exists already as a prefix")
	//	err = checkConflicts([]string{"a.0.c", "a.1.c"})
	//	fmt.Println(err)
}

type prefix struct {
	path       string
	arrayIndex int
}

// getPrefixes generates all prefixes of a path including itself. It does
// this in O(n) time by using the prefix from the previous
// index. Note that top level prefixes are never allowed to be arrays,
// they imply numeric doc keys, since the top level must be a doc.
func getPrefixes(path string) []prefix {
	sp := strings.Split(path, ".")
	ret := make([]prefix, len(sp))
	ret[0] = prefix{path: sp[0], arrayIndex: -1}
	for i := 1; i < len(sp); i++ {
		arrayIndex := -1
		if val, err := strconv.Atoi(sp[i]); err == nil {
			arrayIndex = val
		}
		ret[i] = prefix{path: ret[i-1].path + "." + sp[i], arrayIndex: arrayIndex}
	}
	return ret
}

func checkConflicts(paths []string) error {
	// seenFullPaths keeps track of all full paths seen. The int
	// tells us the next valid array index. If -1, that means this is a document.
	seenFullPaths := make(map[string]int)
	// seenPrefixes keeps track of all prefixes seen. The int tells
	// us the next valid array index. If -1, that means this is a document.
	seenPrefixes := make(map[string]int)
	for _, path := range paths {
		currentPrefixes := getPrefixes(path)
		fullPath := currentPrefixes[len(currentPrefixes)-1]
		// First, check if this path has been seen before. That is a conflict.
		if _, ok := seenFullPaths[fullPath.path]; ok {
			return fmt.Errorf("path %s, specified more than once", fullPath.path)
		}
		// Second, check if this path has existed as a prefix. That is a conflict.
		if _, ok := seenPrefixes[fullPath.path]; ok {
			return fmt.Errorf("path %s, exists already as a prefix", fullPath.path)
		}
		// Third, if this is an array, we need to make sure the key fits. The full
		// path is actually the prefix to this path.
		if fullPath.arrayIndex != -1 {
			// note that if fullPath.arrayIndex != -1, the prefixes must be at least
			// length 2, so this is safe.
			currentStrictPrefix := currentPrefixes[len(currentPrefixes)-2].path
			previousIndex, ok := seenFullPaths[currentStrictPrefix]
			if ok {
				if previousIndex+1 != fullPath.arrayIndex {
					return fmt.Errorf(
						"previous index for array at path %s was %d, "+
							"which is not monotonically contiguous with currently specified index %d",
						currentStrictPrefix, previousIndex, fullPath.arrayIndex,
					)
				}
				// If there were no previous index, this index must be 0.
			} else if fullPath.arrayIndex != 0 {
				return fmt.Errorf(
					"array specified at path %s has first index %d, which must be 0",
					currentStrictPrefix, fullPath.arrayIndex,
				)
			}
			seenFullPaths[currentStrictPrefix] = fullPath.arrayIndex
		} else {
			seenFullPaths[fullPath.path] = -1
		}
		// Now loop through all the strict prefixes. If they are full paths already,
		// that is a conflict. We will also check the array cases.
		for _, currentPrefix := range currentPrefixes[0 : len(currentPrefixes)-1] {
			if previousIndex, ok := seenFullPaths[currentPrefix.path]; ok {
				if previousIndex == -1 {
					return fmt.Errorf(
						"prefix %s of path %s already exists as complete path",
						currentPrefix,
						fullPath.path)
				}
				if previousIndex+1 != currentPrefix.arrayIndex {
					return fmt.Errorf(
						"prefix %s of path %s is an array with previous index %d, but this "+
							"prefix specifies a non-monotonically contiguous array index %d",
						currentPrefix.path, fullPath.path, previousIndex, currentPrefix.arrayIndex,
					)
				}
			}
			seenPrefixes[currentPrefix.path] = currentPrefix.arrayIndex
		}
	}
	return nil
}
