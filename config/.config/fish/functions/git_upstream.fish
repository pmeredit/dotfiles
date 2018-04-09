function git_upstream
    set res (git status -sb | grep '##' | string split '...' | string split '/')
    if test (count $res) -gt 1
	echo $res[2]
    else
	echo "no upstream"
    end
end
