function git_branch
    set -g git_branch (git rev-parse --abbrev-ref HEAD ^ /dev/null)
    if [ $status -ne 0 ]
        set -ge git_branch
        set -g git_untracked_count 0
	set -g git_modified_count 0
    else
        set -g git_untracked_count (git status --porcelain  | grep '??' | wc -l | sed "s/ //g")
        set -g git_modified_count (git status --porcelain  | grep 'M' | wc -l | sed "s/ //g")
    end
end

