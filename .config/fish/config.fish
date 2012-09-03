# Make fish compatible with solarized
set TERM xterm-256color
center
cd ~/franklin/frontend

# Set the title of the window
function fish_title
    pwd
end

# Set the prompt
function fish_prompt
    if test -z (git branch --quiet 2>| awk '/fatal:/ {print "no git"}')
        printf '%s%s%s (%s) %s$ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (git_current_branch) (set_color normal)
    else
        printf '%s%s%s $ ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    end
end

function reload -d "Reload fish config file"
    . ~/.config/fish/config.fish
end

function fishrc
    vim ~/.config/fish/config.fish
    reload
end
