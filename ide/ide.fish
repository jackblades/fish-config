
set IDE_CONFIG_DIR ~/fish-config/ide

. $IDE_CONFIG_DIR/redis.fish

## 

function pkg
    if ign count $argv
        echo "pkg: $argv[1]"
        set -g -x IDE_OPEN_PKG $argv[1]
    else if ign count $IDE_OPEN_PKG
        echo "INFO  current package: $IDE_OPEN_PKG"
    else
        echo "ERROR no package open and no name given."
    end
end

function delpkg
    if ign count $argv
        set name $argv[1]
        rall | grep "^$name\." | foreach rdel
	rdel $name
    end
end

function explorer
    if ign count $IDE_OPEN_PKG
        rall | grep $IDE_OPEN_PKG | fzf --print-query --ansi --reverse --preview="redis-cli get {}"
    else
        echo "ERROR no package specified."
	echo "INFO  pkg <package-name>"
    end
end

function node
    if ign count $IDE_OPEN_PKG
        if ign count $argv
	    set keyname $IDE_OPEN_PKG.$argv[1] 
            set name /tmp/(random)
	    if rexists $keyname
	        rget $keyname > $name
	    end

            nvim $name
            rsetf $keyname < $name
	    rm $name
	else
	    echo "ERROR no variable name given"
	end
    else
        echo "ERROR no open package"
    end
end




























