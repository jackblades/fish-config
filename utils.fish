
function if-exists --description 'if-exists name action'
    type -q $argv[1]
    and eval $argv[2]
    or eval $argv[3]
end

function if-exists-echo --description 'if-exists name value'
    type -q $argv[1]
    and echo $argv[1]
    or echo $argv[3]
end



