function _common_section
    printf $c1
    printf "["
    printf $argv[1]
    printf $c0
    printf ":"
    printf $c2
    printf $argv[2]
    printf $argv[3]
    printf $c1
    printf "]"
    printf $c0
end

function section
    _common_section $argv[1] $c3 $argv[2] $ce
end

function error
    _common_section $argv[1] $ce $argv[2] $ce
end

function fish_prompt
    # $status gets nuked as soon as something else is run, e.g. set_color
    # so it has to be saved asap.
    set -l last_status $status

    # c0 to c4 progress from dark to bright
    # ce is the error colour
    set -g c0 (set_color 005284)
    set -g c1 (set_color 0075cd)
    set -g c2 (set_color 009eff)
    set -g c3 (set_color 6dc7ff)
    set -g c4 (set_color ffffff)
    set -g ce (set_color $fish_color_error)

    # Clear the line because fish seems to emit the prompt twice. The initial
    # display, then when you press enter.
    printf "\033[K"

    # Current time
    printf (date "+$c2%H$c0:$c2%M$c0:$c2%S, ")
    if [ $last_status -ne 0 ]
        error last $last_status
        set -ge status
    end

    # Git branch and dirty files
    git_branch
    if set -q git_branch
        set out "$git_branch"
        if test $git_untracked_count -gt 0; or test $git_modified_count -gt 0
            set out "$out$c0:$ce""??: $git_untracked_count, M: $git_modified_count"
        end
	set out "$out|"(git_compare_origin)
        section git $out
    end

    # Current Directory
    # 1st sed for colourising forward slashes
    # 2nd sed for colourising the deepest path (the 'm' is the last char in the
    # ANSI colour code that needs to be stripped)
    printf $c1
    printf (pwd | sed "s,/,$c0/$c1,g" | sed "s,\(.*\)/[^m]*m,\1/$c3,")

    # Prompt on a new line
    printf $c4
    printf "\n $ce⛧⛧⛧⛧ $c4> "
end
