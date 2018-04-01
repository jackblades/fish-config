set -x LANG en_US.UTF-8
set -x NVIM_TUI_ENABLE_CURSOR_SHAPE 1  # beam cursor
# set -x EDITOR "env HOME=/tmp/blah subl3 --new-window --wait"

set -x FISH_CONFIG_DIR ~/.config/fish
set -x FISH_CONFIG_FILE $FISH_CONFIG_DIR/config.fish
set -x NIX_CONFIG_FILE /etc/nixos/configuration.nix

. $FISH_CONFIG_DIR/utils.fish
. $FISH_CONFIG_DIR/fish-behavior.fish
source-all $FISH_CONFIG_DIR/interactive/*

# setup abbreviations
abbr -a ll grc ls -alFh
abbr -a rmr rm -r
abbr -a rmrf rm -rf
abbr -a grc ps

abbr -a nc sudo nvim $NIX_CONFIG_FILE
abbr -a nrt sudo nixos-rebuild test
abbr -a nrs sudo nixos-rebuild switch

abbr -a nf nvim $FISH_CONFIG_FILE

abbr -a fzfr fzf --reverse --ansi
abbr -a fzmr fzf --reverse --ansi --multi

# abbr -a disk (if-exists-echo pydf pydf "df -h")

# setup aliases
alias cp='rsync -avP'
alias cpr='rsync -avrP'
alias less='less -R'

alias jess="python -m json.tool | pygmentize -l json | less"
alias seljob="jobs | fzf-tmux"
alias killjob="seljob | awk '{print \$2}' | xargs kill"


function mkcd --description "mkdir and cd into it. -p is assumed"
    mkdir -p $argv[1]
    cd $argv[1]
end

