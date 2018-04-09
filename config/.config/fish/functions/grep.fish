function grep
    if type -q rg
        rg $argv
    else
        grep $argv
    end
end

