package main

import (
	"fmt"
	"strings"
)

func main() {
	err := checkConflicts([]string{})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b", "b.c"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b", "a.c"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a.b.b", "a.b.c"})
	fmt.Println(err == nil)
	err = checkConflicts([]string{"a", "b.c", "a"})
	fmt.Println(err != nil)
	fmt.Println(err.Error() == "path a, specified more than once")
	err = checkConflicts([]string{"a.b", "b.c", "a.b"})
	fmt.Println(err != nil)
	fmt.Println(err.Error() == "path a.b, specified more than once")
	err = checkConflicts([]string{"a.b.c.d", "b.c", "a.b.c.d"})
	fmt.Println(err != nil)
	fmt.Println(err.Error() == "path a.b.c.d, specified more than once")
	err = checkConflicts([]string{"a.b.c", "b.c", "a.b.c.d"})
	fmt.Println(err != nil)
	fmt.Println(err.Error() == "prefix a.b.c of path a.b.c.d already exists as complete path")
	err = checkConflicts([]string{"a.b.c.d", "b.c", "a.b.c"})
	fmt.Println(err != nil)
	fmt.Println(err.Error() == "path a.b.c, exists already as a prefix")
}

// getPrefixes generates all strict prefixes of a path. It does
// this in O(n) time by using the prefix from the previous
// index.
func getPrefixes(path string) []string {
	ret := strings.Split(path, ".")
	// note that we ignore the last index, as it would contain the full path.
	ret = ret[0 : len(ret)-1]
	for i := 1; i < len(ret); i++ {
		ret[i] = ret[i-1] + "." + ret[i]
	}
	return ret
}

func checkConflicts(paths []string) error {
	prefixes, fullPaths := make(map[string]struct{}), make(map[string]struct{})
	for _, path := range paths {
		// first, check if this path has been seen before. That is a conflict.
		if _, ok := fullPaths[path]; ok {
			return fmt.Errorf("path %s, specified more than once", path)
		}

		// second, check if this path has existed as a prefix. That is a conflict.
		if _, ok := prefixes[path]; ok {
			return fmt.Errorf("path %s, exists already as a prefix", path)
		}

		// lastly, check if any prefix of this path is a fullPath, if so it is a conflict.
		for _, prefix := range getPrefixes(path) {
			if _, ok := fullPaths[prefix]; ok {
				return fmt.Errorf("prefix %s of path %s already exists as complete path", prefix, path)
			}
			prefixes[prefix] = struct{}{}
		}
		fullPaths[path] = struct{}{}
	}
	return nil
}
