set fish_git_dirty_color red

function parse_git_dirty 
         git diff --quiet HEAD ^&-
         if test $status = 1
            echo (set_color $fish_git_dirty_color)"Δ"(set_color normal)
         end
end
function parse_git_branch
         # git branch outputs lines, the current branch is prefixed with a *
         set -l branch (git branch --color ^&- | awk '/*/ {print $2}') 
         echo $branch (parse_git_dirty)     
end

function fish_prompt
         if test -z (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
            printf '%s%s%s (%s) $ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (parse_git_branch)            
         else
            printf '%s%s%s $ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
         end 
end

function l
        ls
end

set TERM xterm-256color

function fishrc
    set fishfile ~/.config/fish/config.fish
    vim $fishfile
    . ~/.config/fish/config.fish
end
