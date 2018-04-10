function grep
    if type -q rg
        rg $argv
    else
        /usr/bin/grep $argv
    end
end

