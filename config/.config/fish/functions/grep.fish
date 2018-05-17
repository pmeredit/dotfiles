function grep
    if type -q rg
        rg $argv
    else
        /usr/grep $argv
    end
end

