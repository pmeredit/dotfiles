function git_current_branch
    echo (git branch | grep '[*]' | sed 's/[*] //')
end

