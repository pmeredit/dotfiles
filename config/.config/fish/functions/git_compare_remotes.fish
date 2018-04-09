function git_compare_remotes
    set res
    set upstream (git_upstream)
    set out ""
    for remote in (git remote)
        set res (echo (git rev-list --left-right --count (git_current_branch)...$remote/(git_current_branch) ^ /dev/null) | string split '')
        if test (count $res) -gt 2
	    if test $remote = $upstream
	        set out "$out *$remote:"
	    else
	        set out "$out $remote:"
            end
	    set old $out
	    if test $res[1] != "0"
                set out "$out<"
            end
            if test $res[3] != "0"
                set out "$out>"
            end
	    if test $old = $out
		set out "$out="
	    end
        end
    end
    if test $out != ""
        echo $out
    else
        echo "no remote"
    end
end

