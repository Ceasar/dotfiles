function git_current_branch -d "Display name of current git branch"
    git symbolic-ref HEAD ^/dev/null | awk -F/ '{print $3;}'
end
