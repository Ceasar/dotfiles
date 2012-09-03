function show
    if test -d $argv[1]
        ls $argv[1]
    else
        cat $argv[1]
    end
end
