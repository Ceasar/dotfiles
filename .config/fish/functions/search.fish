function search -d "find [expression] [directory]"
    if test -n "$argv[1]"
        if test -n "$argv[2]"
            /usr/bin/find $argv[2] -type f -name "*$argv[1]*"
        else
            echo "No directory given."
            return 2
        end
    else
        echo "No expression given."
        return 1
    end
end
