function foreach --description 'run  for each line of input'
	while read -l line
        eval $argv $line
    end
end
