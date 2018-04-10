function grep
    if type -q rg
        rg $argv
    else
        echo "install ripgrep"
    end
end

