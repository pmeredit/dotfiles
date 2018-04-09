function git_compare_origin
    set res
    set out ""
    for remote in (git remote)
        set res (echo (git rev-list --left-right --count (git_current_branch)...$remote/(git_current_branch) ^ /dev/null) | string split '')
        if test (count $res) -gt 2
	    set out "$out $remote: "
            if test $res[1] != "0"
                set out "$out<"
            end
            if test $res[3] != "0"
                set out "$out>"
            end
        end
    end
    if test $out != ""
        echo $out
    else
        echo "no remote"
    end
end

