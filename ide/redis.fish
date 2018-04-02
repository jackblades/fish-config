

function rall
    redis-cli keys \*
end

function rexists
    set ex (redis-cli exists $argv)
    ign math "$ex == 1"
end

function rget
    redis-cli --raw get $argv
end

function rset
    redis-cli set $argv
end
function rsetf
    redis-cli -x set $argv
end

function rdel
    redis-cli del $argv
end








