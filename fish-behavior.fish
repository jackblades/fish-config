

function source-all --description "source all files in $argv"
    for file in $argv
        . $file
    end
end

# ensure that functions are always edited interactively at prompt
functions --copy funced __copy_fish_funced_orig
function funced --description "wrap original with -i"
    eval __copy_fish_funced_orig -i $argv
end


