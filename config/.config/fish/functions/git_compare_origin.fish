function git_compare_origin
    set res (echo (git rev-list --left-right --count (git_current_branch)...origin/(git_current_branch)) | string split '')
    if test $res[1] != "0"
	    set out "<"
    end
    if test $res[3] != "0"
	    set out "$out>"
    end
    echo $out
end

