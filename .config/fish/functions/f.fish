# Search for a keyword recursively and give context
function f -d "f <keyword> <directory>"
    grep -rn -C 1 $argv
end
