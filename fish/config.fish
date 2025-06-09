fish_config theme choose "Dracula Official"

function code
    open -a "Visual Studio Code.app" $argv
end

function create_ssl
    read -P "Enter length: " len
    openssl rand -base64 $len
end

function source_fish
    source ~/.config/fish/config.fish
end

function ide_2
    tmux split-window -v -p 30
    tmux split-window -h
end

function ide_1
    tmux split-window -v -p 30
end

function ide
    tmux split-window -v -p 30
    tmux split-window -h -p 66
    tmux split-window -h -p 50
end

function aside
    tmux split-window -h
    tmux split-window -v
end

function split
    tmux split-window -h
    tmux split-window -v -t 0
    tmux split-window -v -t 2
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
# set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# GPG
set -gx GPG_TTY (tty)

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Python 
set -gx PATH /Users/aaron/miniforge3/bin $PATH

# Go
set -g GOPATH ~/go
set -gx PATH $GOPATH/bin $PATH

# RVM 
set -gx PATH $PATH:$HOME/.rvm/bin $PATH

# NVM
# function __check_rvm --on-variable PWD --description 'Do nvm stuff'
#     status --is-command-substitution; and return
#
#     if test -f .nvmrc; and test -r .nvmrc
#         nvm use
#     end
#
#     if test -f .ruby-version; and test -r .ruby-version
#         rvm use
#     end
# end

function dev_version
    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    end

    if test -f .ruby-version; and test -r .ruby-version
        rvm use
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.fish 2>/dev/null || :

# Added by Windsurf
fish_add_path /Users/aaron/.codeium/windsurf/bin
