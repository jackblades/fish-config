function forever --description 'run cmd forever'
	while sleep 1 # the sleep is needed for Ctrl-C and cpu-usage restrictions
        eval $argv
    end
end
