# get the full path to the script from which this is executed.
function script_dir
    echo (cd (dirname (status -f)); and pwd)
end
