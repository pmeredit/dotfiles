function evg
	if git status -s | rg '^ M'
		echo 'commit changes before submitting evergreen patch'
	else
		evergreen $argv
	end
end
